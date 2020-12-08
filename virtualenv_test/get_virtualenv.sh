# Get Names for the Environment and Kernels ===========================
# 1. Get working directory name (without full path).
dir_name=${PWD##*/}

# 2. Replace '-' with '_' in a name.
venv_stem="${dir_name//-/_}"

# 3. Get names for virtual environment and kernels.
venv_name=".venv_${venv_stem}"
py_kernel_name="${venv_stem}_py"

# Create the Virtual Environment ======================================
# 1. Create the virtual environment.
echo "===creating virtual environment ${venv_name}==="
virtualenv -p python3 "${venv_name}"

# 2. Activate virtual environment.
source "${venv_name}/bin/activate"

# 3. Upgrade pip.
pip install -U pip

# Install Jupyter =====================================================
pip install jupyter

# Install Kernels =====================================================
# Install ipython kernel.
echo "===installing iPy kernel ${py_kernel_name}==="
python -m ipykernel install --user --name="${py_kernel_name}"

# Install Rrequirements ===============================================
touch requirements.txt
pip install -r requirements.txt
echo "===virtual environment ${venv_name} created==="

# Prevent Git from Tracking the Virtual Environment ===================
# NB! better add ignore statement to ./.git/info/exclude so that it doesn't clutter .gitignore.
# If doesn't exist, add virtual environment path to ./.git/info/exclude.
grep -qxF "${venv_name}/" ../.git/info/exclude || echo "${venv_name}/" >> ./.git/info/exclude
echo "===updated ./.git/info/exclude. with "${venv_name}/"==="
