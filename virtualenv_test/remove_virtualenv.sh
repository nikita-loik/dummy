#!/bin/sh

# Get Names for the Environment and Kernels ===========================
# 1. Get working directory name (without full path).
dir_name=${PWD##*/}

# 2. Replace '-' with '_' in a name.
venv_stem="${dir_name//-/_}"

# 3. Get virtual environment name.
venv_name=".venv_${venv_stem}"
py_kernel_name="${venv_stem}_py"

# Remove Kernels ======================================================
echo "===removing iPy kernel ${py_kernel_name}==="
# 1. Activate virtual environment.
source "${venv_name}/bin/activate"
# 2. Remove iPy kernel.
yes | jupyter kernelspec uninstall "${py_kernel_name}"
# 3. Deactivate virtual environment.
deactivate

# Remove the Virtual Environment ======================================
echo "===removing virtual environment ${venv_name}==="
rm -rf "${venv_name}"
