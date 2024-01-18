
clean:
	find ./ -type d | grep "/__pycache__" | xargs -r -l rm -r
	rm -rf dist *.egg-info

format:
	find ./ -type f | grep ".py$$" | xargs -r -l isort
	find ./ -type f | grep ".py$$" | xargs -r -l black -l 200 -q

check:
	find ./ -type f | grep ".py$$" | xargs -r -l flake8 --ignore S108,S607,S605,F401,F403,W291,W503 --max-line-length 200

dist:
	python3 setup.py sdist

pypi: clean dist
	twine upload --verbose dist/riogui*

pyvenv: clean dist
	python3 -m venv pyvenv
	pyvenv/bin/python -m pip install -r requirements.txt
	pyvenv/bin/python -m pip install dist/riogui*
	pyvenv/bin/python bin/rio-setup Altera10M08Eval/config-test.json
