init:
  git submodule update --recursive --init --depth 1

generate-cimgui: init
  cd ./cimgui/generator && ./generator.sh --target "noimstrv"

build-cimgui: generate-cimgui
  make static -C cimgui

cimgui-linux-x64: build-cimgui
  mkdir -p ./linux-x64 && cp -vf ./cimgui/libcimgui.a ./linux-x64/libcimgui.a
