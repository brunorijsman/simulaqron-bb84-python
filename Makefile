pre-commit: lint test
	@echo "OK"

install:
	pip install -r requirements.txt

lint:
	pylint bb84 bb84/tests

test:
	rm -f .coverage*
	pytest -v -s --cov=bb84 --cov-report=html --cov-report term bb84/tests

coverage-open:
	open htmlcov/index.html

docs:
	sphinx-build -a docs/source docs/build

docs-open: docs
	open docs/build/index.html

clean:
	rm -f .coverage*
	rm -f profile.out profile.png
	rm -rf __pycache__
	rm -rf htmlcov
	rm -rf .pytest_cache
	rm -rf bb84/__pycache__
	rm -rf bb84/.pytest_cache
	rm -rf bb84/tests/__pycache__
	rm -rf docs/source/_modules
	rm -rf docs/build/*

.PHONY: pre-commit install lint test coverage-open docs docs-open clean