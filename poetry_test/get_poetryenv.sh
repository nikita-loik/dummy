# CREATE VIRTUAL ENVIRONMENT =============================
# 1. Initiate Poetry Project
poetry init

# 2. Set python version to be used in poetry
# NB! python version has to be gotten somehow.
poetry env use 3.8

# JUPYTER & KERNELS==================================================
poetry add --dev jupyter ipykernel
# Possible:
# poetry run python -m ipykernel install --user --name pymedphys