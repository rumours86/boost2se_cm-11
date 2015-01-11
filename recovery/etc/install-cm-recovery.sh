#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8452096 a79a20b8775282b29fe07fe3f98e5ff722ef69c3 6223872 5477725481305a4455a488a41c106e8095df2ab5
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8452096:a79a20b8775282b29fe07fe3f98e5ff722ef69c3; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6223872:5477725481305a4455a488a41c106e8095df2ab5 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery a79a20b8775282b29fe07fe3f98e5ff722ef69c3 8452096 5477725481305a4455a488a41c106e8095df2ab5:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
