#!/sbin/sh
#
#Check the existence of some essential apps 
#

[ -d /system/app/Browser ] && echo "browser=1" >> /tmp/protection.prop || echo "browser=0" >> /tmp/protection.prop
[ -d /system/app/Email || -d /system/app/PrebuiltGmail ] && echo "email=1" >> /tmp/protection.prop || echo "email=0" >> /tmp/protection.prop
[ -d /system/priv-app/Mms ] && echo "mms=1" >> /tmp/protection.prop || echo "mms=0" >> /tmp/protection.prop
[ -d /system/app/PicoTts ] && echo "picotts=1" >> /tmp/protection.prop || echo "picotts=0" >> /tmp/protection.prop
[ -d /system/app/LatinIME ] && echo "latinime=1" >> /tmp/protection.prop || echo "latinime=0" >> /tmp/protection.prop
[ -d /system/app/Calendar ] && echo "calendar=1" >> /tmp/protection.prop || echo "calendar=0" >> /tmp/protection.prop
[ -d /system/app/Camera2 || -d /system/app/OpenCamera || -d /system/app/ABCamera] && echo "camera=1" >> /tmp/protection.prop || echo "camera=0" >> /tmp/protection.prop