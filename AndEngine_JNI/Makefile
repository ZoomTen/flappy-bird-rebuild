CLANGDIR ?= $(ANDROID_NDK)/toolchains/llvm/prebuilt/linux-x86_64

CC := $(CLANGDIR)/bin/aarch64-linux-android21-clang++
ANDINCLUDE := $(CLANGDIR)/sysroot/usr/include
CFLAGS := -march=armv8-a -mfix-cortex-a53-835769

libandengine.so: BufferUtils.o GLES20Fix.o
	$(CC) \
	-shared \
	-o $@ \
	$^

BufferUtils.o: BufferUtils.cpp
	$(CC) \
	-c \
	$(CFLAGS) \
	-I$(ANDINCLUDE) \
	-o $@ \
	$<

GLES20Fix.o: GLES20Fix.c
	$(CC) \
	-c \
	$(CFLAGS) \
	-I$(ANDINCLUDE) \
	-o $@ \
	$<

clean:
	rm -fv *.so *.o