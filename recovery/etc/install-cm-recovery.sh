#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8452096 0f4e5e3dc43c8a859218bd20b900093d847120f5 6223872 9dbc23fb60e64564732a7c2fb588a1b5a71eec38
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8452096:0f4e5e3dc43c8a859218bd20b900093d847120f5; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6223872:9dbc23fb60e64564732a7c2fb588a1b5a71eec38 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 0f4e5e3dc43c8a859218bd20b900093d847120f5 8452096 9dbc23fb60e64564732a7c2fb588a1b5a71eec38:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
