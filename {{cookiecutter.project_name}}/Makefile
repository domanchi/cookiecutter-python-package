.PHONY: minimal
minimal: requirements-minimal.txt venv/bin/activate

.PHONY: test
test: development
	venv/bin/tox

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
