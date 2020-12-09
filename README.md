# DUMMY

This project provides the shell scripts and Makefiles which create python virtual environments using
* [virtualenv](https://virtualenv.pypa.io/)
* [pipenv](https://pipenv.pypa.io/)
* [poetry](https://python-poetry.org/)

Each project contains a `test.py` which imports packages often used for data-science projects.
If running `test.py` is successful, it outputs the following message in the terminal:
> All packages imported successfully.

To install the virtual environments and run the tests, follow the instructions the README.md files in the corresponding directories.

## Comments

### virtualenv
It proved to be the most robust yet very basic tool.

However, it's pain in the ass to maintain production and development environments. Keeping the `requirements.txt` clean requires loads of manual work and removing dependency-packages.

### pipenv
Using `pipenv install` fails with several packages including **scipy**, **matplotlib**, and **torch** producing the following error message:

> This is likely caused by a bug in [package]. Report this to its maintainers.

The import of the packages which depend on `numpy` fails for some abscure reason:

> RuntimeError: Polyfit sanity test emitted a warning, most likely due to using a buggy Accelerate backend. If you compiled yourself, see site.cfg.example for information. Otherwise report this to the vendor that provided NumPy.
RankWarning: Polyfit may be poorly conditioned.

### poetry
Using `poetry add` fails with several packages including **scipy**, **matplotlib**, and **torch**.