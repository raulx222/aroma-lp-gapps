#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
[[ -f /tmp/backuptool.functions ]] && . /tmp/backuptool.functions

list_files() {
cat <<EOF
addon.d/80-gapps.sh
addon.d/71-gapps-faceunlock.sh
app/FaceLock/FaceLock.apk
app/FaceLock/lib/arm/libfacelock_jni.so
etc/permissions/com.google.android.camera2.xml
framework/com.google.android.camera2.jar
lib/libgcam.so
lib/libgcam_swig_jni.so
lib/libjni_eglfence.so
lib/libjni_filtershow_filters.so
lib/libjni_mosaic.so
lib/liblightcycle.so
lib/libnativehelper_compat.so
vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/landmark_group_meta_data.bin
vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin
vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin
vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-3-tree7-wmd.bin
vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-r0-ri30.4a-v24-tree7-2-wmd.bin
vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rn30-ri30.5-v24-tree7-2-wmd.bin
vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rp30-ri30.5-v24-tree7-2-wmd.bin
vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-r.8.1.bin
vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-y-r.8.1.bin
vendor/pittpatt/models/recognition/face.face.y0-y0-71-N-tree_7-wmd.bin
@file.list@
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
	[[ -d /system/app/Chrome && ! -d /system/app/Browser ]] && echo "browser=1" >> /tmp/variables.prop
	
	[[ -d /system/app/Gmail2 && ! -d /system/app/Email ]] && echo "email=1"  >> /tmp/variables.prop
	
	[[ -d /system/app/Messenger && ! -d /system/priv-app/Mms ]] && echo "mms=1"  >> /tmp/variables.prop
	
	[[ -d /system/app/GoogleTTS && ! -d /system/app/PicoTts ]] && echo "tts=1"  >> /tmp/variables.prop
	
	[[ -d /system/app/Keyboard && ! -d /system/app/LatinIME ]] && echo "keyboard=1"  >> /tmp/variables.prop
	
	[[ -d /system/app/CalendarGoogle && ! -d /system/app/Calendar ]] && echo "calendar=1"  >> /tmp/variables.prop
	
	[ -d /system/app/CameraGoogle ] && ! [[ -d /system/app/Camera2 || -d /system/app/OpenCamera || -d /system/app/ABCamera ]] && echo "camera=1"  >> /tmp/variables.prop
	
	[[ -d /system/app/GoogleHome ]] && ! [[ -d /system/priv-app/Trebuchet || -d /system/app/Launcher3 ]] && echo "launcher=1"  >> /tmp/variables.prop
	
	[[ -d /system/app/Music2 ]] && ! [[ -d /system/app/Eleven || -d /system/app/Apollo ]] && echo "music=1"  >> /tmp/variables.prop
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
	. /tmp/variables.prop
	
	[ $browser -eq 1 ] && rm -rf /system/app/Browser
	
	[ $email -eq 1 ] && rm -rf /system/app/Email && rm -rf /system/app/Exchange2
	
	[ $mms -eq 1 ] && rm -rf /system/priv-app/Mms && rm -rf /system/priv-app/MmsService
	
	[ $tts -eq 1 ] && rm -rf /system/app/PicoTts && rm -rf /system/priv-app/PicoTts && rm -rf /system/lib/libttscompat.so && rm -rf /system/lib/libttspico.so
	
	[ $keyboard -eq 1 ] && rm -rf /system/app/LatinIME
	
	[ $calendar -eq 1 ] && rm -rf /system/app/Calendar
	
	[ $camera -eq 1 ] && rm -rf /system/app/Camera2
	
	[ $launcher -eq 1 ] && rm -rf /system/priv-app/Trebuchet
	
	[ $music -eq 1 ] && rm -rf /system/app/Eleven && rm -rf /system/app/Apollo
	
	rm -rf /tmp/variables.prop
	
   for i in /system/app /system/priv-app /system/vendor/pittpatt /system/usr/srec; do
        find $i -type d | xargs rmdir -p --ignore-fail-on-non-empty;
   done
  ;;
  post-restore)
	# Stub
  ;;
  remove)
    for i in `list_files`; do
      rm -rf /system/$i
    done;

	for i in /system/app /system/priv-app /system/vendor/pittpatt /system/usr/srec; do
        find $i -type d | xargs rmdir -p --ignore-fail-on-non-empty;
   done
  ;;
esac
