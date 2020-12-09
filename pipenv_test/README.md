# PIPENV TEST

|file|function|
|:-:|:-:|
|[get_pipenv.sh](https://github.com/nikita-loik/dummy/blob/main/pipenv_test/get_pipenv.sh)|creates python virtual environment using poetry|
|[Makefile](https://github.com/nikita-loik/dummy/blob/main/pipenv_test/Makefile)|contains make commands to get and remove virtual environment|
|[test.py](https://github.com/nikita-loik/dummy/blob/main/pipenv_test/test.py)|imports installed libraries, and reports whether the imports were successful|

To install virtual environment, run:
```sh
make venv_get
```
To test the installation was successful, run:
```sh
pipenv run python test.py
```
To remove virtual environment, run:
```sh
make venv_remove
```