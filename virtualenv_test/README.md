# VIRTUALENV TEST

## [Installation](https://virtualenv.pypa.io/en/latest/installation.html)
```sh
pip install virtualenv
virtualenv --version
```

## Content
|file|function|
|:--|:--|
|[get_virtualenv.sh](https://github.com/nikita-loik/dummy/blob/main/virtualenv_test/get_virtualenv.sh)|creates python virtual environment using virtualenv|
|[remove_virtualenv.sh](https://github.com/nikita-loik/dummy/blob/main/virtualenv_test/remove_virtualenv.sh)|removes python virtual environment using virtualenv|
|[Makefile](https://github.com/nikita-loik/dummy/blob/main/virtualenv_test/Makefile)|contains make commands to run the corresponding shell scripts|
|[test.py](https://github.com/nikita-loik/dummy/blob/main/virtualenv_test/test.py)|imports installed libraries, and reports whether the imports were successful|

## Tests
To create virtual environment using virtualenv, run:
```sh
make venv_get
```
To test the installation was successful, run:
```sh
source .venv_virtualenv_test/bin/activate
python test.py
deactivate
```
To remove virtual environment, run:
```sh
make venv_remove
```