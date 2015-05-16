#!/sbin/sh
#
#LP-GAPPS Tools
#by raulx222
#

case "$1" in
	save)
	rm -rf /sdcard/LP-GAPPS
	mkdir /sdcard/LP-GAPPS
	cp /tmp/aroma/selectgapps.prop /sdcard/LP-GAPPS/selectgapps.prop
	cp /tmp/aroma/rem.prop /sdcard/LP-GAPPS/rem.prop
	cp /tmp/aroma/allgapps.prop /sdcard/LP-GAPPS/allgapps.prop
	;;
	load)
	[ -f /sdcard/LP-GAPPS/selectgapps.prop ] && rm -f /tmp/aroma/selectgapps.prop && cp /sdcard/LP-GAPPS/selectgapps.prop /tmp/aroma/selectgapps.prop
	[ -f /sdcard/LP-GAPPS/rem.prop ] && rm -f /tmp/aroma/rem.prop && cp /sdcard/LP-GAPPS/rem.prop /tmp/aroma/rem.prop
	[ -f /sdcard/LP-GAPPS/allgapps.prop ] && rm -f /tmp/aroma/allgapps.prop && cp /sdcard/LP-GAPPS/allgapps.prop /tmp/aroma/allgapps.prop
	;;
	reset)
	rm -f /tmp/aroma/selectgapps.prop
	rm -f /tmp/aroma/rem.prop
	rm -f /tmp/aroma/allgapps.prop
	;;
	remove)
	[ -f /system/addon.d/80-gapps.sh ] && sh /system/addon.d/80-gapps.sh "remove"
	;;
esac
