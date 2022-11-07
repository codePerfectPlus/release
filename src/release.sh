#!/bin/bash
check_command() {
    if [ ! -x "$(command -v $1)" ]; then
        echo "$1 is not installed"
        pip install $1
        exit 1
    fi
}

check_directory() {
    if [ ! -d "$1" ]; then
        echo "$1 is not found"
        exit 1
    fi
}

check_file() {
    if [ ! -f "$1" ]; then
        echo "$1 is not found"
        exit 1
    fi
}

echo "[[pypi]]\nusername = __token__\npassword = $PYPI_TOKEN" > ~/.pypirc

check_command twine
check_file setup.py
python3 setup.py sdist bdist_wheel
check_directory dist
python3 -m twine upload --repository testpypi dist/*
