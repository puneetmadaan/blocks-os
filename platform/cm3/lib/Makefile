AS=	arm-none-eabi-as -mcpu=cortex-m3
LD=	arm-none-eabi-ld

OBJS=	memset.o memcpy.o memcmp.o memlen.o \
	eabi_memset.o eabi_memset4.o eabi_memset8.o \
	eabi_memcpy.o eabi_memcpy4.o eabi_memcpy8.o

%.o: %.S
	$(AS) -o $@ $<

lib.a:	$(OBJS)
	$(AR) r lib.a $(OBJS)
	rm -f $(OBJS)

clean:
	rm -f lib.a $(OBJS)

