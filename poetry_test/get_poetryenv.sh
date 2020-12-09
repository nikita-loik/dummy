# CREATE VIRTUAL ENVIRONMENT =============================
if [ -e pyproject.toml ]; then
    echo "===installing developer environment==="
    poetry install
else
    echo "===installing Jupyter==="
    poetry init
    poetry add --dev jupyter ipykernel black pytest
    poetry add numpy pandas
    # NB! The installation of scipy, matplotlib, and torch using 'poetry add' fails.
fi