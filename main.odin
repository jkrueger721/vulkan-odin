package main 

import "core:fmt"
import "vendor:glfw"
import vk "vendor:vulkan"

WIDTH :: 800
HEIGHT :: 600

run :: proc(){
  // todo stuff
  initWindow()
  mainLoop()
  cleanUp()
}
 window: glfw.WindowHandle;
initWindow :: proc(){
  glfw.Init()
  glfw.WindowHint(glfw.CLIENT_API, glfw.NO_API )
  glfw.WindowHint(glfw.RESIZABLE, glfw.FALSE)
  window = glfw.CreateWindow(WIDTH, HEIGHT, "Vulkan Window", nil, nil);

}
mainLoop :: proc(){
  for !glfw.WindowShouldClose(window){
      glfw.PollEvents()
  }
}
cleanUp :: proc() { 
  glfw.DestroyWindow(window)
  glfw.Terminate()
}

main :: proc(){
  run()
}