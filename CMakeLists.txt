cmake_minimum_required(VERSION 3.23)
project(assembly-pratics C)

set(CMAKE_C_STANDARD 99)

file(GLOB SRC_FILES "assembly/*/*.c")

add_executable(assembly-pratics ${SRC_FILES})

# 添加自定义构建命令，将C语言代码编译成汇编代码
