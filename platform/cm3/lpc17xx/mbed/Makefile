ESLC=   eslc
ARCH=	-mcortex-m3
INC=	-I.. -I../.. -I../../.. -I../../.. -I../../../.. \
	-I../../../../net -I../../../../net/phy \
	-I../../../../net/ipv4  -I../../../../net/ipv6 \
	-I../../../../net/wpan -I../../../../net/ppp \
	-I../../../../sensors \
	-I../../../../display -I../../../../display/fonts \
	-I../../../../usb \
	-I../../../../usb/device/hid \
	-I../../../../usb/host \
	-I../../../../fs -I../../../../crc
DBG=
OPT=	-i	# disable inlining
AS=	arm-none-eabi-as -mcpu=cortex-m3
LD=	arm-none-eabi-ld
OBJCOPY=arm-none-eabi-objcopy
OBJDUMP=arm-none-eabi-objdump
NM=	arm-none-eabi-nm
LIB= 	../../lib/lib.a

# keep intermediate files, for now
.PRECIOUS: %.out %.s %.ll

%.dis: %.out
	$(OBJDUMP) -d $< >$@

%.map: %.out
	$(NM) -n $< >$@

%.bin: %.out
	$(OBJCOPY) -I elf32-littlearm -O binary $< $@

%.out: %.o startup.o mem.o $(LIB)
	$(LD) -T ../lpc17xx.ld startup.o $<  mem.o $(LIB) -o $@

%.o: %.s
	$(AS) -o $@ $<

%.s: %.esl
	$(ESLC) $(ARCH) $(DBG) $(INC) $(OPT) $< >$@

%.ll: %.esl
	$(ESLC) -c $(ARCH) $(DBG) $(INC) $(OPT) $<

%.dep: %.esl
	$(ESLC) -M $(ARCH) $(DBG) $(INC) $(OPT) $<

all:	test-timer.bin test-inet.bin \
	test-udp.bin test-tcp.bin \
	test-lcd.bin test-inet-lcd.bin test-inet6-udp-lcd.bin \
	test-colorled.bin test-adc.bin test-speaker.bin \
	test-accel.bin \
	test-usbdev-hid.bin test-usbhost-msc.bin
#	test-hid.out test-sdcard.out test-msc.out

startup.o: ../startup.S
	$(AS) -o startup.o ../startup.S

mem.o:	../../../mem_ff.esl
	$(ESLC) $(ARCH) $(DBG) $(OPT) $<
	$(AS) -o $@ mem_ff.s

clean:
	rm -f *.bin *.out *.o *.s *.ll *.map *.dis

