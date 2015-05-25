#!/sbin/sh
#
#LP-GAPPS Tools for @package@ package
#by raulx222
#

case "$1" in
	save)
	rm -f /sdcard/LP-GAPPS/selectgapps_@package@.prop
	rm -f /sdcard/LP-GAPPS/rem_@package@.prop
	rm -f /sdcard/LP-GAPPS/allgapps_@package@.prop
	[ ! -d /sdcard/LP-GAPPS ] && mkdir /sdcard/LP-GAPPS
	cp /tmp/aroma/selectgapps.prop /sdcard/LP-GAPPS/selectgapps_@package@.prop
	cp /tmp/aroma/rem.prop /sdcard/LP-GAPPS/rem_@package@.prop
	cp /tmp/aroma/allgapps.prop /sdcard/LP-GAPPS/allgapps_@package@.prop
	;;
	load)
	[ -f /sdcard/LP-GAPPS/selectgapps_@package@.prop ] && rm -f /tmp/aroma/selectgapps.prop && cp /sdcard/LP-GAPPS/selectgapps_@package@.prop /tmp/aroma/selectgapps.prop
	[ -f /sdcard/LP-GAPPS/rem_@package@.prop ] && rm -f /tmp/aroma/rem.prop && cp /sdcard/LP-GAPPS/rem_@package@.prop /tmp/aroma/rem.prop
	[ -f /sdcard/LP-GAPPS/allgapps_@package@.prop ] && rm -f /tmp/aroma/allgapps.prop && cp /sdcard/LP-GAPPS/allgapps_@package@.prop /tmp/aroma/allgapps.prop
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
