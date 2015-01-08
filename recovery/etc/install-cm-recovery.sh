#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8452096 98820df3509226937ee2911e25b856e6bd0dc445 6223872 2c80084042fd91f30e6fd998639962ef26120c87
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8452096:98820df3509226937ee2911e25b856e6bd0dc445; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6223872:2c80084042fd91f30e6fd998639962ef26120c87 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 98820df3509226937ee2911e25b856e6bd0dc445 8452096 2c80084042fd91f30e6fd998639962ef26120c87:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
