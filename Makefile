SHELL=/bin/bash

edk2_build:
	@cd ${HOME}/edk2; \
	source edksetup.sh; \
	build

kernel_build:
	@cd $(CURDIR)/mikanos/kernel; \
	source ${HOME}/osbook/devenv/buildenv.sh; \
	compiledb make

run_qemu: kernel_build
	@cd ${HOME}/edk2; \
	${HOME}/osbook/devenv/run_qemu.sh \
		Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi \
		$(CURDIR)/mikanos/kernel/kernel.elf

.PHONY: edk2_build kernel_build run_qemu
