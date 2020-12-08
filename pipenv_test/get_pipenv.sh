# Get Names for the Environment and Kernels ===========================
# 1. Get working directory name (without full path).
dir_name=${PWD##*/}

# 2. Replace '-' with '_' in a name.
venv_stem="${dir_name//-/_}"

# 3. Get names for virtual environment and kernels.
py_kernel_name="${venv_stem}_py"

# Install Jupyter =====================================================
echo "===installing Jupyter==="
pipenv install jupyter

# Install Kernels =====================================================
# Install ipython kernel.
echo "===installing IPython kernel==="
# pipenv install ipykernel
pipenv run python -m ipykernel install --user --name=${py_kernel_name}
