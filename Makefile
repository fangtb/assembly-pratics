# 编译器和选项
CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic -std=c99
####------------------------c-----------------###############
# 源文件和目标文件
SOURCE = ret.c
ASM_SOURCE = asm_ret.asm
SRC_DIR = assembly/day01

SRC = $(SRC_DIR)/${SOURCE}
ASM = $(SRC_DIR)/auto_$(notdir $(SRC:.c=.s))
OBJ = $(SRC:.c=.o)
EXE = $(SRC:.c=)

# 生成汇编代码
$(ASM): $(SRC)
	$(CC) -S -masm=intel $(CFLAGS) -fno-asynchronous-unwind-tables -fno-ident $^ -o $@
	#$(CC) -S -masm=intel $(CFLAGS) -fno-asynchronous-unwind-tables -fno-ident $^ -o $@
		#@sed -i -e '/^\s*\.intel_syntax noprefix/d' \
        	    #-e '/^\s*ret$$/q' \
			    #-e '/^\s*ret$$/,$$d' $@

# 生成目标文件
$(OBJ): $(SRC)
	$(CC) -c $(CFLAGS) $< -o $@

# 链接目标文件
$(EXE): $(OBJ)
	$(CC) $(CFLAGS) $< -o $@

# 运行可执行文件
run: $(EXE)
	./$(EXE)

# 默认目标
all: $(ASM)

# 清理生成的文件
clean:
	rm -f $(ASM) $(OBJ) $(EXE)

.PHONY: all clean
###############-------------处理asm汇编语言----###################


# ASM 目标文件和可执行文件
ASM_SRC = $(SRC_DIR)/$(ASM_SOURCE)
ASM_OBJ = $(SRC_DIR)/$(ASM_SOURCE:.asm=.o)
ASM_EXE = $(SRC_DIR)/$(ASM_SOURCE:.asm=)

# 生成 ASM 目标文件
$(ASM_OBJ): $(ASM_SRC)
	as -o $@ $<

# 链接 ASM 目标文件
$(ASM_EXE): $(ASM_OBJ)
	$(CC) $(CFLAGS) $^ -o $@

# 运行 ASM 可执行文件
asm_run: $(ASM_EXE)
	./$(ASM_EXE)

# 清理生成的文件
clean-ASM:
	rm -f $(ASM_OBJ) $(ASM_EXE)