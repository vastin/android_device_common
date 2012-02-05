PATH=/system/bin:/system/xbin

DMIPATH=/sys/class/dmi/id

board=`cat $DMIPATH/product_name`
case "$board" in
	*)
		alsa_amixer set Master on
		;;
esac

alsa_amixer set Master 100
alsa_amixer set Headphone 100
alsa_amixer set Speaker 100

# import cmdline variables
for c in `cat /proc/cmdline`; do
	case $c in
		*=*)
			eval $c
			;;
	esac
done

[ -z "$SDCARD" -o "$SDCARD" = "internal" ] && start sdcard

# disable cursor blinking
echo -e '\033[?17;0;0c' > /dev/tty0
