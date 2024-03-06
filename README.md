# assembly-pratics

gcc -S -masm=intel hello.c


as -o increase.o increase.asm

clang increase.o -o increase

ld test.o tmp.o -o test -lSystem
gcc -o test test.c tmp.c
clang -S -masm=intel example.c -o example.s
clang -o example  example.o
## otool 查看代码
### Mac
otool -v -t ./test  
### Linux
objdump -d ./test

查看链接的动态链接库
otool -L test
## debug
lldb target
(lldb) breakpoint set --file test.s --line 6
(lldb) continue
单步调试
(lldb) nexti
读取此时寄存器和内存的值
(lldb) register read
查看内存中的值
(lldb) memory read 0x00007ffeefbff7b8


## 汇编程序中的段

**代码段 (__TEXT, .text)**：
- 用于存放程序的机器指令或执行代码。

**数据段 (__DATA, .data)**：
- 用于存储初始化的全局变量和静态变量。

**未初始化数据段 (__BSS, .bss)**：
- 用于存储未初始化的全局变量和静态变量，此段在程序启动前被清零。

**只读数据段 (__RODATA, .rodata)**：
- 存储只读数据，如字符串常量和其他常量数据。

**堆栈段 (__STACK, .stack)**：
- 用于支持程序运行时的栈操作，存放局部变量、函数参数等。

**导入段 (__IMPORT, .import)**：
- 添加需要从其他文件或库中导入的符号或函数。

**导出段 (__EXPORT, .export)**：
- 标记可以被其他文件或库使用的符号或函数。

**其他特殊用途段**：
- 如 .heap（堆区域）、.tls（线程局部存储）、.reloc（重定位信息）、.debug（调试信息）等。



## 汇编指示器

- **.data** - 用于开始一个包含已初始化数据的段。
- **.text** - 用于开始一个包含程序指令的段。
- **.bss** - 用于声明一个将会包含未初始化数据的段。
- **.global** 或 **.globl** - 用于声明一个符号（通常是函数或变量）为全局符号，即它可以被模块外部的代码引用。
- **.align** - 用于指定下一个数据或指令的地址对齐方式。
- **.byte** - 用于指定一个或多个字节大小的数据。
- **.word** - 用于指定一个或多个字（2字节）大小的数据。
- **.long** 或 **.int** - 用于指定一个或多个长整型（4字节）大小的数据。
- **.ascii** - 用于定义一个ASCII字符串，不包含 null 结束字符。
- **.asciz** 或 **.string** - 用于定义一个null（'\0'）终止的ASCII字符串。
- **.macro** - 用于定义宏，宏是一组可以在汇编程序中多次使用的指令集合。
- **.endm** - 用于标记宏定义的结束。
- **.equ** 或 **.set** - 用于给一个数值或符号定义一个别名。似于C语言中的#define
- **.space** 或 **.skip** - 用于分配一块未初始化的空间。
- **.file** - 用于指定被汇编的源代码文件名。
- **.include** - 用来包含一个文件的内容到当前源文件中。
- **.section** - 用来开始一个新的段，可精确指定段名称和属性。

.intel_syntax noprefix  语法风格指示符    Intel 风格的语法
.att_syntax prefix                      AT&T(default style)   
