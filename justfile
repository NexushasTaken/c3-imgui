init:
  git submodule update --recursive --init --depth 1

generate-cimgui: init
  cd ./cimgui/generator && ./generator.sh --target "noimstrv" --cflags ""
# original: "glfw opengl3 opengl2 sdl2"
# all possible flags: "allegro5 android dx10 dx11 dx12 dx9 glfw glut opengl2 opengl3 sdl2 sdl3 sdlrenderer2 sdlrenderer3 vulkan wgpu win32"

build-cimgui: generate-cimgui
  make static -C cimgui

# see 'c3c --list-targets' for available targets
build TARGET: build-cimgui
  mkdir -p ./{{TARGET}} && cp -vf ./cimgui/libcimgui.a ./{{TARGET}}/libcimgui.a
