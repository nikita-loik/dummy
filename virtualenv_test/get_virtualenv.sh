# CREATE AND ACTIVATE VIRTUAL ENVIRONMENT =============================
# 1. Get working directory name (without full path).
dir_name=${PWD##*/}

# 2. Replace '-' with '_' in a name.
venv_stem="${dir_name//-/_}"

# 3. Get virtual environment name.
venv_name="venv_${venv_stem}"
echo "===creating virtual environment ${venv_name}==="

# 4. Create virtual environment.
virtualenv -p python3 ".${venv_name}"

# 5. Activate virtual environment.
source ".${venv_name}/bin/activate"

# 6. Upgrade pip.
pip install -U pip

# JUPYTER =============================================================
pip install jupyter

# KERNELS =============================================================
# 1. IPython
python -m ipykernel install --user --name="${venv_stem}_py"

# REQUIREMENTS ========================================================
touch requirements.txt
pip install -r requirements.txt
echo "===virtual environment .${venv_name} created==="

# GIT =================================================================
# NB! better add ignore statement to ./.git/info/exclude so that it doesn't clutter .gitignore.
# 8. If doesn't exist, add virtual environment path to ./.git/info/exclude.
grep -qxF ".${venv_name}/" ../.git/info/exclude || echo ".${venv_name}/" >> ./.git/info/exclude
echo "===updated ./.git/info/exclude. with ".${venv_name}/"==="
