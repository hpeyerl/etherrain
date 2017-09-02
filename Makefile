# 
# Herb is lazy and can't remember how to do stuff.
#
PYTHON:=python3
PKG:=etherrain
VERSION:=${shell ${PYTHON} src/${PKG}/__init__.py}

all: clean build test

clean:
	rm -rf dist build /tmp/pip-* src/etherrain.egg-info
	rm -rf venv /home/hpeyerl/.cache/pip/wheels/8e/22/27/96436ab8e9371fdad01caa13fb9fb0a0e80299ad8ea6b24312

build:
	${PYTHON} setup.py sdist bdist_wheel

test:
	virtualenv -p ${PYTHON} venv
	venv/bin/pip -v install dist/${PKG}-${VERSION}.tar.gz
	find venv -name "*${PKG}*"
		
upload_test:
	twine upload -r test dist/${PKG}-${VERSION}.tar.gz

upload_real:
	twine upload -r pypi dist/${PKG}-${VERSION}.tar.gz

show.%: 
	@echo $*=$($*)
