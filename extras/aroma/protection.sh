#!/sbin/sh
#
#Check the existence of some essential apps 
#

#Remove empty folders
for i in /system/app /system/priv-app /system/vendor/pittpatt /system/usr/srec; do
    find $i -type d | xargs rmdir -p --ignore-fail-on-non-empty;
done

case "$1" in
	updater-script)
	[[ -d /system/app/Browser || -d /system/app/Chrome ]] && echo "browser=1" >> /tmp/protection.prop || echo "browser=0" >> /tmp/protection.prop
	[[ -d /system/app/Email || -d /system/app/Gmail2 ]] && echo "email=1" >> /tmp/protection.prop || echo "email=0" >> /tmp/protection.prop
	[[ -d /system/priv-app/Mms || -d /system/app/Messenger ]] && echo "mms=1" >> /tmp/protection.prop || echo "mms=0" >> /tmp/protection.prop
	[[ -d /system/app/PicoTts || -d /system/app/GoogleTTS ]] && echo "tts=1" >> /tmp/protection.prop || echo "tts=0" >> /tmp/protection.prop
	[[ -d /system/app/LatinIME || -d /system/app/Keyboard ]] && echo "keyboard=1" >> /tmp/protection.prop || echo "keyboard=0" >> /tmp/protection.prop
	[[ -d /system/app/Calendar || -d /system/app/CalendarGoogle ]] && echo "calendar=1" >> /tmp/protection.prop || echo "calendar=0" >> /tmp/protection.prop
	[[ -d /system/app/Camera2 || -d /system/app/OpenCamera || -d /system/app/ABCamera || -d /system/app/CameraGoogle ]] && echo "camera=1" >> /tmp/protection.prop || echo "camera=0" >> /tmp/protection.prop
	[[ -d /system/priv-app/Trebuchet || -d /system/app/Launcher3 || -d /system/app/GoogleHome ]] && echo "launcher=1" >> /tmp/protection.prop || echo "launcher=0" >> /tmp/protection.prop
	[[ -d /system/app/Eleven || -d /system/app/Music2 ]] && echo "music=1" >> /tmp/protection.prop || echo "music=0" >> /tmp/protection.prop
	;;
	aroma-config)
	[ -d /system/app/Browser ] && echo "browser=1" > /tmp/protection.prop || echo "browser=0" > /tmp/protection.prop
	[ -d /system/app/Email ] && echo "email=1" >> /tmp/protection.prop || echo "email=0" >> /tmp/protection.prop
	[ -d /system/priv-app/Mms ] && echo "mms=1" >> /tmp/protection.prop || echo "mms=0" >> /tmp/protection.prop
	[ -d /system/app/PicoTts ] && echo "tts=1" >> /tmp/protection.prop || echo "tts=0" >> /tmp/protection.prop
	[ -d /system/app/LatinIME ] && echo "keyboard=1" >> /tmp/protection.prop || echo "keyboard=0" >> /tmp/protection.prop
	[ -d /system/app/Calendar ] && echo "calendar=1" >> /tmp/protection.prop || echo "calendar=0" >> /tmp/protection.prop
	[[ -d /system/app/Camera2 || -d /system/app/OpenCamera || -d /system/app/ABCamera ]] && echo "camera=1" >> /tmp/protection.prop || echo "camera=0" >> /tmp/protection.prop
	[[ -d /system/priv-app/Trebuchet || -d /system/app/Launcher3 ]] && echo "launcher=1" >> /tmp/protection.prop || echo "launcher=0" >> /tmp/protection.prop
	[ -d /system/app/Eleven ] && echo "music=1" >> /tmp/protection.prop || echo "music=0" >> /tmp/protection.prop
	;;
esac
