.PHONY: minimal
minimal: requirements-minimal.txt venv/bin/activate

# We don't need to test pre-commit, since both parent and child use the same config
# file, and pre-commit will run for all files that is tracked by git.
.PHONY: test
test: development
	venv/bin/cookiecutter . --output-dir tmp/ --overwrite-if-exists --no-input
	venv/bin/mypy tmp/python-package-boilerplate/python_package_boilerplate
	venv/bin/pre-commit run \
		--files $(shell find tmp/python-package-boilerplate -type f) \
		--config tmp/python-package-boilerplate/.pre-commit-config.yaml

	pip install -e tmp/python-package-boilerplate
	pip uninstall python-package-boilerplate -y

development: minimal venv/bin/pre-commit

# We use `pre-commit` as a proxy (assuming pre-commit will always be included)
# so that we can cache the dev build.
venv/bin/pre-commit: requirements-dev-minimal.txt
	venv/bin/pip install -r requirements-dev-minimal.txt
	pre-commit install
	touch venv/bin/pre-commit

venv/bin/activate:
	test -d venv || python3 -m venv venv
	venv/bin/pip install -r requirements-minimal.txt
	touch venv/bin/activate
