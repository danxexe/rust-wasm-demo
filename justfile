set windows-powershell := true

install-binstall:
  cargo install binstall

install-deps:
  cargo binstall -y binstall
  cargo binstall -y wasm-tools
  cargo binstall -y simple-http-server

build:
  cargo build --target wasm32-unknown-unknown --release
  wasm-tools strip -o www/rust_wasm_demo.wasm target/wasm32-unknown-unknown/release/rust_wasm_demo.wasm

server:
  simple-http-server --index --cors --ip 127.0.0.1 --port 9001 -- www
