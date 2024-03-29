
clean:
	find ./ -type d | grep "/__pycache__" | xargs -r -l rm -r
	rm -rf dist *.egg-info

format:
	find ./bin/ -type f | xargs -r -l ruff format

check:
	find ./bin/ -type f | xargs -r -l ruff check

dist:
	python3 setup.py sdist

pypi: clean dist
	$(eval VERSION = v$(shell ls dist/riogui-*.tar.gz | cut -d"-" -f2 | cut -d"." -f1-3))
	twine upload --verbose dist/riogui-*.tar.gz
	git tag -a ${VERSION} -m "version ${VERSION}"
	git push origin ${VERSION}

pyvenv: clean dist
	python3 -m venv pyvenv
	pyvenv/bin/python -m pip install -r requirements.txt
	pyvenv/bin/python -m pip install dist/riogui-*.tar.gz
	pyvenv/bin/python bin/rio-setup Altera10M08Eval/config-test.json
