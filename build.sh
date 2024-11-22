#!/usr/bin/env bash

[[ -x './target' ]] || c3c compile ./src/target.c3 -O4
TARGET="$(./target)"

init() {
  git submodule update --recursive --init --depth 1
}

# original: "glfw opengl3 opengl2 sdl2"
# all possible flags: "allegro5 android dx10 dx11 dx12 dx9 glfw glut opengl2 opengl3 sdl2 sdl3 sdlrenderer2 sdlrenderer3 vulkan wgpu win32"
generate-cimgui() {
  init && pushd ${PWD} && cd ./cimgui/generator && ./generator.sh --target "noimstrv" --cflags "" && popd
}

build-cimgui() {
  make static -C cimgui CXXFLAGS='-DIMGUI_DISABLE_OBSOLETE_KEYIO -DIMGUI_DISABLE_OBSOLETE_FUNCTIONS'
}

# see 'c3c --list-targets' for available targets
build() {
  build-cimgui && mkdir -p ./${TARGET} && cp -vf ./cimgui/libcimgui.a ./${TARGET}/libcimgui.a
}

usage() {
  cat <<EOF
Usage of build.sh:
   -i --init          initialize and update submodules
   -g --generate      generate cimgui wrappers
   -b --build-cimgui  compile cimgui wrappers static library
   -B --build         generate and compile cimgui wrappers and copy static library
                      to its target directory
   -t --target        specify the build target and where static library should be copied
                      (default: $TARGET)
   -h --help          show this message and exit
EOF
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

# parse command line arguments
# ref: https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
while [[ $# -gt 0 ]]; do
  case $1 in
    -i|--init)
      init
      shift # past argument
      ;;
    -g|--generate)
      generate-cimgui
      shift # past argument
      ;;
    -b|--build-cimgui)
      build-cimgui
      shift # past argument
      ;;
    -B|--build)
      build
      shift # past argument
      ;;
    -t|--target)
      TARGET="${2:-$TARGET}"
      shift # pass argument
      shift # pass value
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*|--*)
      echo "Unknown option $1"
      usage
      exit 1
      ;;
  esac
done
