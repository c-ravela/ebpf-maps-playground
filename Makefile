EXECUTABLE=bin
HEADERS_PATH=headers
HEADERS_FILES = bpf_helpers bpf_helper_defs bpf_endian bpf_core_read bpf_tracing
CFLAGS := -O2 -g -Wall -Werror $(CFLAGS)
ARCH := $(shell uname -m | sed 's/x86_64/amd64/g; s/aarch64/arm64/g')

all:
	@echo "need to implement"

# cbpf header files manager
headers: vmlinux bpf_helpers
vmlinux:
	@bpftool btf dump file /sys/kernel/btf/vmlinux format c > $(HEADERS_PATH)/vmlinux.h
bpf_helpers:
	@for file in $(HEADERS_FILES) ; do \
		cp /usr/include/bpf/$${file}.h $(HEADERS_PATH)/$${file}.h; \
	done
