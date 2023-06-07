
all: help


init:  # Setup build environment
	which buf > /dev/null || brew install bufbuild/buf/buf
	rm -rf .venv
	python3 -m venv .venv
	.venv/bin/pip install --disable-pip-version-check -U pip build twine
	git submodule update --init grpc-gateway


build:  # Generate python package
	./gen-openapi-proto.sh
	.venv/bin/python3 -m build


distribute:  # Publish package to Pypi
	.venv/bin/python3 -m twine upload --repository pypi dist/*


clean:  # Clean up temporary files
	rm -rf gen dist build


help:  # Show this help
	@grep -E "^[^._][a-zA-Z_-]*:" Makefile | awk -F '[:#]' '{print $$1, ":", $$NF}' | sort | column -t -s:


.SILENT: build clean distribute help init
.PHONY: build clean distribute help init
