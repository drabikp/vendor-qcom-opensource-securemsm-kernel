M=$(PWD)
SSG_MODULE_ROOT=$(KERNEL_SRC)/$(M)
INC=-I/$(M)/linux/*
KBUILD_OPTIONS+=SSG_MODULE_ROOT=$(SSG_MODULE_ROOT)

# trace_smcinvoke.h defaults to the Android-tree layout path; SSG_MODULE_ROOT
# is on LINUXINCLUDE so the bare subdir resolves
KBUILD_OPTIONS += KCPPFLAGS=-DSMCINVOKE_TRACE_INCLUDE_PATH=smcinvoke
all: modules

clean:
	rm -f *.cmd *.d *.mod *.o *.ko *.mod.c *.mod.o Module.symvers modules.order

%:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $(INC) $@ $(KBUILD_OPTIONS)