# Get Names for the Environment and Kernels ===========================
# 1. Get working directory name (without full path).
dir_name=${PWD##*/}

# 2. Replace '-' with '_' in a name.
venv_stem="${dir_name//-/_}"

# 3. Get virtual environment name.
py_kernel_name="${venv_stem}_py"

# Remove Kernels ======================================================
echo "===removing iPy kernel ${py_kernel_name}==="
yes | pipenv run jupyter kernelspec uninstall "${py_kernel_name}"

# Remove the Virtual Environment ======================================
pipenv --venv
rm -rf $(pipenv --venv)
