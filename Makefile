build:
	@cargo build

test:
	@echo "===================================================================="
	@echo "Testing Connection Type TCP"
	@echo "===================================================================="
	@REDISRS_SERVER_TYPE=tcp cargo test --features="with-rustc-json"
	@echo "Testing Connection Type UNIX"
	@echo "===================================================================="
	@REDISRS_SERVER_TYPE=unix cargo test --features="with-rustc-json"
	@echo "===================================================================="
	@echo "Testing Connection Type UNIX SOCKETS"
	@echo "===================================================================="
	@REDISRS_SERVER_TYPE=unix cargo test --features="with-rustc-json with-unix-sockets"

test-single: RUST_TEST_THREADS=1
test-single: test

bench:
	@RUST_TEST_THREADS=1 cargo bench

docs: build
	@cargo doc --no-deps

upload-docs: docs
	@./upload-docs.sh

.PHONY: build test bench docs upload-docs
