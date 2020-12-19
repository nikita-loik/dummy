# POETRY TEST

## [Installation](https://python-poetry.org/docs/#installation)
```sh
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
source $HOME/.poetry/env
poetry --version
```

## Content
|file|function|
|:--|:--|
|[get_poetryenv.sh](https://github.com/nikita-loik/dummy/blob/main/poetry_test/get_poetryenv.sh)|creates python virtual environment using poetry|
|[Makefile](https://github.com/nikita-loik/dummy/blob/main/poetry_test/Makefile)|contains make commands to get and remove virtual environment|
|[test.py](https://github.com/nikita-loik/dummy/blob/main/poetry_test/test.py)|imports installed libraries, and reports whether the imports were successful|

## Tests
To install virtual environment, run:
```sh
make venv_get
```
To test the installation was successful, run:
```sh
poetry run python test.py
```
To remove virtual environment, run:
```sh
make venv_remove
```