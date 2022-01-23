#!/bin/sh -e

# SET NAMES FOR THE ENVIRONMET & KERNELS ==============================
# 1. Get working directory name (without full path).
dir_name=${PWD##*/}
echo ${venv_stem}

# 2. Get virtual-environment name.
venv_name="venv-${venv_stem}"
echo "=== venv name: ${venv_name} ==="

# 3. Get kernel name.
py_kernel_name="${venv_stem}-py"
echo "=== kernel name: ${py_kernel_name} ==="

# SET LOCAL PYTHON VERSION ============================================
echo "=== installing relevant python 3.8.6 ==="
pyenv install --skip-existing
pyenv local 3.8.6

# CREATE & ACTIVATE VIRTUAL ENVIRONMENT ===============================
echo "===creating virtual environment ${venv_name}==="
virtualenv -p python3 "${venv_name}"

source "${venv_name}/bin/activate"

# UPGRADE PIP =========================================================
pip install -U pip

# INSTALL JUPYTER =====================================================
pip install jupyter

# KERNELS =============================================================
# 1. iPython
echo "===installing iPy kernel ${py_kernel_name}==="
python -m ipykernel install --user --name="${py_kernel_name}"

# REQUIREMENTS ========================================================
if [ -e requirements.txt ]; then
    echo "===installing specified requirements==="
    pip install -r requirements.txt
else
    echo "===installing Jupyter==="
    touch requirements.txt
    pip install scipy numpy pandas matplotlib torch black pytest pre-commit
    pip freeze > requirements.txt
fi

echo "===virtual environment ${venv_name} created==="

# ACTIVATE PRE-COMMITS ================================================
pre-commit install

# GIT =================================================================
# Prevent Git from Tracking the Virtual Environment
# NB! better add ignore statement to ./.git/info/exclude so that it doesn't clutter .gitignore.
# If doesn't exist, add virtual environment path to ./.git/info/exclude.
grep -qxF "${venv_name}/" ./.git/info/exclude || echo "${venv_name}/" >> ./.git/info/exclude
echo "===updated ./.git/info/exclude. with "${venv_name}/"==="

# Add and commit .gitignore to git.
# NB Will report 'no changes added to commit' if .gitignore stayed the same.
git add .gitignore
git commit -m "Update .gitignore with '.${venv_name}/'"
echo "===added & committed .gitignore to git==="