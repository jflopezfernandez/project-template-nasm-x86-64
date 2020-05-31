
vpath %.asm src
vpath %.ld src

AS := nasm
#ASFLAGS := -felf64 -Pinclude/defs.inc -O0 -Wall  -gdwarf
ASFLAGS := -felf64 -Pinclude/defs.inc -Ov -Wall 
LD := ld
#LDFLAGS := -nostdlib -O -N --strip-all --check-sections --gc-sections --print-gc-sections -Map linker.map --reduce-memory-overheads --relax --verbose -b elf64-x86-64 -m elf_x86_64 -T src/linker-script.lds
#LDFLAGS := -nostdlib -O -N --strip-all --check-sections --gc-sections --print-gc-sections -Map linker.map --reduce-memory-overheads --relax --verbose -b elf64-x86-64 -m elf_x86_64 -T src/linker-script.lds

# YES
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections --trace
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections --trace --traditional-format
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections --trace --traditional-format --oformat elf64-x86-64
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections --trace --traditional-format --oformat elf64-x86-64 --reduce-memory-overheads --relax --stats
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections --trace --traditional-format --oformat elf64-x86-64 --reduce-memory-overheads --relax --stats
LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections --trace --traditional-format --oformat elf64-x86-64 --reduce-memory-overheads --relax --stats --check-sections --gc-sections --print-gc-sections


#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections --trace --traditional-format --oformat elf64-x86-64 --reduce-memory-overheads --relax --stats --check-sections --gc-sections --print-gc-sections
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 --no-dynamic-linker --check-sections --trace --traditional-format --oformat elf64-x86-64 --reduce-memory-overheads --relax --stats --check-sections -T src/linker-script.lds
# NO
#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 -T src/linker-script.lds --dynamic-linker /lib/ld-linux.so.2

#LDFLAGS := -nostdlib -O --strip-all -b elf64-x86-64 -T src/linker-script.lds

TARGET := temp

all: $(TARGET)

$(TARGET): main.o
	$(LD) $(LDFLAGS) -o $@ $^

main.o: main.asm
	$(AS) $(ASFLAGS) -o $@ $^

.PHONY: clean
clean:
	rm -f *.o $(TARGET)
