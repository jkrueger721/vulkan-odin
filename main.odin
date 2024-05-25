package main 

import "core:fmt"
import "vendor:glfw"
import vk "vendor:vulkan"

WIDTH :: 800
HEIGHT :: 600

run :: proc(){
  initWindow()
  mainLoop()
  cleanUp()
}

 window: glfw.WindowHandle;
 instance: vk.Instance;
 createInfo: vk.InstanceCreateInfo;
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
initVulkan :: proc() { 
  createInstance()
}

createInstance :: proc(){
    glfwExtensionCount:u32 = 0;
    glfwExtensions:= glfw.GetRequiredInstanceExtensions();

    appInfo: vk.ApplicationInfo
    appInfo.sType = .APPLICATION_INFO
    appInfo.pApplicationName = "Hello Triangle"
    appInfo.applicationVersion = vk.MAKE_VERSION(1, 0, 0)
    appInfo.pEngineName = "No Engine"
    appInfo.engineVersion = vk.MAKE_VERSION(1, 0, 0)
    appInfo.apiVersion = vk.API_VERSION_1_0

    createInfo.sType = .INSTANCE_CREATE_INFO
    createInfo.pApplicationInfo = &appInfo
    createInfo.enabledExtensionCount = glfwExtensionCount
    createInfo.ppEnabledExtensionNames = raw_data(glfwExtensions)
    createInfo.enabledLayerCount = 0
    result:= vk.CreateInstance(&createInfo, nil, &instance)
 }

main :: proc(){
  run()
}