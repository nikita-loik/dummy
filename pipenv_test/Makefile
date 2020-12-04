# 1 GET NAMES =========================================================

# 1.1 Get virtual-environment name.
PROJECT_DIR_NAME := $(shell basename $(CURDIR))

# 1.2 Get virtual-environment stem.
VENV_STEM := $(subst .venv_,,$(PROJECT_DIR_NAME))

# 1.3 Get kernel names from virtual-environment stem.
KERNEL_NAME_PY = "$(VENV_STEM)_py"

# =====================================================================

venv_get:
	get_pipenv.sh

venv_remove:
	@echo "===removing virtual environment==="
	pipenv --rm

	@echo "===removing iPython kernel==="
	@echo "~/Library/Jupyter/kernels/$(KERNEL_NAME_PY)"
	rm -rf ~/Library/Jupyter/kernels/$(KERNEL_NAME_PY)
