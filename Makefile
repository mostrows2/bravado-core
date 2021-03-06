.PHONY: all install test tests clean docs

all: test

build:
	./setup.py bdist_egg

dev: clean
	./setup.py develop

docs:
	tox -e docs

install:
	pip install .

test: install-hooks
	tox

tests: test


.PHONY: install-hooks
install-hooks:
	tox -e pre-commit -- install -f --install-hooks

clean:
	@rm -rf .tox build dist docs/build *.egg-info
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete
