SHELL=/bin/bash

edk2_build:
	@cd ${HOME}/edk2; \
	source edksetup.sh; \
	build

setup_env:
	@source ${HOME}/osbook/devenv/buildenv.sh

kernel_build:
	@cd ${HOME}/workspace/mikanos_work/kernel; \
	compiledb make

run_qemu: setup_env kernel_build
	@cd ${HOME}/edk2; \
	${HOME}/osbook/devenv/run_qemu.sh \
		Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi \
		${HOME}/workspace/mikanos_work/kernel/kernel.elf
		# ${HOME}/repos/github.com/uchan-nos/mikanos/kernel/kernel.elf

.PHONY: edk2_build setup_env kernel_build run_qemu
