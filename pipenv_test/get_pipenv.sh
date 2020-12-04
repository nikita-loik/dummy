# CREATE VIRTUAL ENVIRONMENT =============================
# 1. Get working directory name (without full path).
dir_name=${PWD##*/}

# 2. Replace '-' with '_' in a name.
venv_stem="${dir_name//-/_}"

# 3. Get IPy-kernel name.
kernel_name="${venv_stem}_py"
echo "===creating virtual environment ${kernel_name}==="


# Create virtual environment.
# NB! To recycle installed python, use flag '--python PYTHON_VERSION'.
echo "===installing pipenv virtual environment==="
pipenv --python 3.8


# KERNELS =============================================================
# Install IPython kernel.
echo "===installing IPython kernel==="
pipenv install ipykernel


# JUPYTER =============================================================
# 2. Connect the environment to the kernel.
echo "===connecting ipykernell to virtual environment==="
pipenv run python -m ipykernel install --user --name=${kernel_name}

# NB! jupyter installation using pipenv doesn't work.
# pipenv install jupyter  # fails
# 3. Upgrade pip.
echo "===installing jupyter using pip==="
pipenv run pip install -U pip
pipenv run pip install jupyter
