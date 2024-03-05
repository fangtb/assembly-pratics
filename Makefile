# 编译器和选项
CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic -std=c99

#只修改这个
SOURCE = ret.c

# 源文件和目标文件
SRC_DIR = assembly/day01
SRC = $(SRC_DIR)/${SOURCE}
ASM = $(SRC_DIR)/auto_$(notdir $(SRC:.c=.s))  # 修改此处
OBJ = $(SRC:.c=.o)
EXE = $(SRC:.c=)

# 默认目标
all: $(ASM)

# 清理生成的文件
clean:
	rm -f $(ASM) $(OBJ) $(EXE)

.PHONY: all clean

# 生成汇编代码
$(ASM): $(SRC)
#	$(CC) -S -masm=intel $(CFLAGS) -fno-asynchronous-unwind-tables -fno-ident $^ -o $@
	$(CC) -S -masm=intel $(CFLAGS) -fno-asynchronous-unwind-tables -fno-ident $^ -o $@
		@sed -i -e '/^\s*\.intel_syntax noprefix/d' \
        	    -e '/^\s*ret$$/q' \
			    -e '/^\s*ret$$/,$$d' $@


# 生成目标文件
$(OBJ): $(SRC)
	$(CC) -c $(CFLAGS) $< -o $@

# 链接目标文件
$(EXE): $(OBJ)
	$(CC) $(CFLAGS) $< -o $@

# 运行可执行文件
run: $(EXE)
	./$(EXE)