#!/bin/sh

# Get Names for the Environment and Kernels ===========================
# 1. Get working directory name (without full path).
dir_name=${PWD##*/}

# 2. Replace '-' with '_' in a name.
venv_stem="${dir_name//-/_}"

# 3. Get names for virtual environment and kernels.
py_kernel_name="${venv_stem}_py"

if [ -e Pipfile ]; then
    echo "===installing developer environment==="
    pipenv install --dev
else
    echo "===installing Jupyter==="
    pipenv install --dev jupyter
    pipenv install --dev --skip-lock black pytest
    pipenv install --skip-lock numpy pandas
    # NB! The installation of scipy, matplotlib, and torch using 'pipenv install' fails.
fi
