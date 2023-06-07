# gRPC Gateway Support

This repo generates the missing Python code to support code generated using
[gRPC Gateway](https://github.com/grpc-ecosystem/grpc-gateway) protoc annotations.

This package depends on `googleapis-common-protos` to provide `google.api.annotations_pb2` and others
that the generated code will depend on.


## Usage

```shell
pip install grpc-gateway-protoc-gen-openapiv2
```

## Building

1. Run `make init`
2. Run `make build` to generate the code from grpc-gateway and build the package
3. Run `pip install dist/grpc_gateway_protoc_gen_openapiv2-2.14.0-py3-none-any.whl` to install in the current Python
   distribution


## Publishing (optional)

Setup PyPi credentials and
1. `python3 -m pip install --user --upgrade twine && python3 -m twine upload --repository pypi dist/*`
