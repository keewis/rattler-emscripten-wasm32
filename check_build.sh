#!/usr/bin/env bash

package_path=$(find target/conda/emscripten-wasm32 -name "pyemscripten-*.tar.bz2" | head -1)

rm -rf my_env

mamba create -y -p ./my_env \
    -c https://prefix.dev/emscripten-forge-4x \
    -c https://prefix.dev/conda-forge \
    --platform=emscripten-wasm32 \
    python=3.13 numpy pyjs $package_path

pyjs_code_runner run script browser-main \
    --conda-env $PWD/my_env \
    --script main.py \
    --mount=$PWD/workdir:/home/web_user/fubar \
    --work-dir /home/web_user/fubar \
    --async-main \
    --headless
