#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF

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
	[ ! -d /system/app/BasicDreams ] && echo "basicdreams=1" >> /tmp/removals.prop
	[ ! -d /system/app/Browser ] && echo "browser=1" >> /tmp/removals.prop
	[ ! -d /system/app/Camera2 ] && echo "camera2=1" >> /tmp/removals.prop
	[ ! -d /system/app/Calendar ] && echo "calendar=1" >> /tmp/removals.prop
	[[ ! -d /system/app/CellBroadcastReceiver || ! -d /system/priv-app/CellBroadcastReceiver ]] && echo "cellbroadcast=1" >> /tmp/removals.prop
	[ ! -d /system/app/CMFileManager ] && echo "cmfilemanager=1" >> /tmp/removals.prop
	[ ! -d /system/priv-app/AudioFX ] && echo "audiofx=1" >> /tmp/removals.prop
	[ ! -d /system/app/CMWallpapers ] && echo "cmwallpapers=1" >> /tmp/removals.prop
	[ ! -d /system/app/DeskClock ] && echo "deskclock=1" >> /tmp/removals.prop
	[ ! -d /system/app/Eleven ] && echo "eleven=1" >> /tmp/removals.prop
	[ ! -d /system/app/Email ] && echo "email=1" >> /tmp/removals.prop
	[ ! -d /system/app/Exchange2 ] && echo "exchange2=1" >> /tmp/removals.prop
	[ ! -d /system/app/Galaxy4 ] && echo "galaxy4=1" >> /tmp/removals.prop
	[ ! -d /system/app/HoloSpiralWallpaper ] && echo "holospiral=1" >> /tmp/removals.prop
	[ ! -d /system/app/LiveWallpapers ] && echo "livewallpapers=1" >> /tmp/removals.prop
	[ ! -d /system/app/NoiseField ] && echo "noisefield=1" >> /tmp/removals.prop
	[ ! -d /system/app/PhaseBeam ] && echo "phasebeam=1" >> /tmp/removals.prop
	[ ! -d /system/app/PhotoPhase ] && echo "photophase=1" >> /tmp/removals.prop
	[ ! -d /system/app/PhotoTable ] && echo "phototable=1" >> /tmp/removals.prop
	[ ! -d /system/app/VisualizationWallpapers ] && echo "visualization=1" >> /tmp/removals.prop
	[ ! -d /system/app/WhisperPush ] && echo "whisperpush=1" >> /tmp/removals.prop
	[ ! -d /system/app/Apollo ] && echo "apollo=1" >> /tmp/removals.prop

  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
	. /tmp/removals.prop
	
	[ $basicdreams -eq 1 ] && rm -rf /system/app/BasicDreams
	[ $browser -eq 1 ] && rm -rf /system/app/Browser
	[ $camera2 -eq 1 ] && rm -rf /system/app/Camera2
	[ $calendar -eq 1 ] && rm -rf /system/app/Calendar
	[ $cellbroadcast -eq 1 ] && rm -rf /system/app/CellBroadcastReceiver && rm -rf /system/priv-app/CellBroadcastReceiver
	[ $cmfilemanager -eq 1 ] && rm -rf /system/app/CMFileManager
	[ $audiofx -eq 1 ] && rm -rf /system/priv-app/AudioFX
	[ $cmwallpapers -eq 1 ] && rm -rf /system/app/CMWallpapers
	[ $deskclock -eq 1 ] && rm -rf /system/app/DeskClock
	[ $eleven -eq 1 ] && rm -rf /system/app/Eleven
	[ $email -eq 1 ] && rm -rf /system/app/Email
	[ $exchange2 -eq 1 ] && rm -rf /system/app/Exchange2
	[ $galaxy4 -eq 1 ] && rm -rf /system/app/Galaxy4
	[ $holospiral -eq 1 ] && rm -rf /system/app/HoloSpiralWallpaper
	[ $livewallpapers -eq 1 ] && rm -rf /system/app/LiveWallpapers
	[ $noisefield -eq 1 ] && rm -rf /system/app/NoiseField 
	[ $phasebeam -eq 1 ] && rm -rf /system/app/PhaseBeam
	[ $photophase -eq 1 ] && rm -rf /system/app/PhotoPhase
	[ $phototable -eq 1 ] && rm -rf /system/app/PhotoTable
	[ $visualization -eq 1 ] && rm -rf /system/app/VisualizationWallpapers
	[ $whisperpush -eq 1 ] && rm -rf /system/app/WhisperPush
	[ $apollo -eq 1 ] && rm -rf /system/app/Apollo
	
	rm -rf /tmp/removals.prop
	
   for i in /system/app /system/priv-app /system/vendor/pittpatt /system/usr/srec; do
        find $i -type d | xargs rmdir -p --ignore-fail-on-non-empty;
   done
  ;;
  post-restore)
	# Stub
  ;;
esac
