
all: help


init:  # Setup build environment
	which buf || brew install bufbuild/buf/buf
	python3 -m venv .venv
	.venv/bin/pip install build
	git submodule update --init grpc-gateway


build:  # Generate python package
	./gen-openapi-proto.sh
	.venv/bin/python3 -m build


clean:  # Clean up temporary files
	rm -rf gen dist build


help:  # Show this help
	@grep -E "^[^._][a-zA-Z_-]*:" Makefile | awk -F '[:#]' '{print $$1, ":", $$NF}' | sort | column -t -s:


.SILENT: build clean help init
.PHONY: build clean help init
