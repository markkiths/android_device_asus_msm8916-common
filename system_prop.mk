# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
   dalvik.vm.dex2oat-flags=--no-watch-dog \
   dalvik.vm.dex2oat-threads=1 \
   dalvik.vm.boot-dex2oat-threads=1 \
   dalvik.vm.boot-dex2oat-cpu-set=0,1,2,3 \
   dalvik.vm.image-dex2oat-threads=2 \
   dalvik.vm.image-dex2oat-cpu-set=0,1,2,3 \
   dalvik.vm.dex2oat-cpu-set=0,1,2,3 \
   dalvik.vm.dex2oat-swap=false \
   dalvik.vm.dex2oat64.enabled=true

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
   af.fast_track_multiplier=1 \
   audio.deep_buffer.media=true \
   persist.vendor.audio.fluence.speaker=true \
   persist.vendor.audio.fluence.voicecall=true \
   persist.vendor.audio.fluence.voicerec=false \
   ro.audio.flinger_standbytime_ms=300 \
   ro.af.client_heap_size_kbyte=7168 \
   ro.config.media_vol_steps=25 \
   ro.config.vc_call_vol_steps=7 \
   ro.vendor.audio.sdk.fluencetype=fluence \
   ro.vendor.audio.sdk.ssr=false \
   vendor.audio.tunnel.encode=false \
   vendor.voice.path.for.pcm.voip=true \
   vendor.voice.playback.conc.disabled=true \
   vendor.voice.record.conc.disabled=true \
   vendor.voice.voip.conc.disabled=true \
   vendor.audio_hal.period_size=192

# Audio offload
PRODUCT_PROPERTY_OVERRIDES += \
   audio.offload.min.duration.secs=30 \
   audio.offload.pcm.16bit.enable=true \
   audio.offload.pcm.24bit.enable=true \
   audio.offload.video=true \
   av.offload.enable=true \
   vendor.audio.av.streaming.offload.enable=false \
   vendor.audio.offload.buffer.size.kb=64 \
   vendor.audio.offload.gapless.enabled=true \
   vendor.audio.dolby.ds2.enabled=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
   vendor.bluetooth.soc=pronto \
   vendor.qcom.bluetooth.soc=pronto \
   ro.bluetooth.dun=true \
   ro.bluetooth.hfp.ver=1.7 \
   ro.bluetooth.sap=true \
   ro.qualcomm.bluetooth.ftp=true \
   ro.qualcomm.bluetooth.hfp=true \
   ro.qualcomm.bluetooth.hsp=true \
   ro.qualcomm.bluetooth.map=true \
   ro.qualcomm.bluetooth.nap=true \
   ro.qualcomm.bluetooth.opp=true \
   ro.qualcomm.bluetooth.pbap=true \
   ro.qualcomm.bt.hci_transport=smd

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
   persist.camera.cpp.duplication=false \
   camera2.portability.force_api=1

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
   ro.charger.enable_suspend=true

# Display
PRODUCT_PROPERTY_OVERRIDES += \
   debug.hwui.use_buffer_age=false \
   debug.cpurend.vsync=false \
   debug.egl.hw=0 \
   debug.enable.sglscale=1 \
   debug.mdpcomp.idletime=600 \
   debug.sf.hw=0 \
   dev.pm.dyn_samplingrate=1 \
   persist.demo.hdmirotationlock=false \
   debug.sf.disable_backpressure=1 \
   debug.sf.recomputecrop=0 \
   persist.hwc.mdpcomp.enable=true \
   persist.hwc.ptor.enable=true \
   persist.hwc.pubypass=true \
   debug.sdm.support_writeback=0

# SurfaceLinger
PRODUCT_PROPERTY_OVERRIDES += \
   ro.surface_flinger.max_frame_buffer_acquired_buffers=1 \
   ro.surface_flinger.force_hwc_copy_for_virtual_displays=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.use_phase_offsets_as_durations=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.late.sf.duration=27600000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.late.app.duration=20000000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.early.sf.duration=27600000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.early.app.duration=20000000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.earlyGl.sf.duration=27600000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.earlyGl.app.duration=20000000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.hwc.min.duration=17000000

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
   drm.service.enabled=true

# Fling velocities
PRODUCT_PROPERTY_OVERRIDES += \
   ro.min.fling_velocity=160 \
   ro.max.fling_velocity=20000

# IMS
PRODUCT_PROPERTY_OVERRIDES += \
   persist.dbg.volte_avail_ovr=1 \
   persist.dbg.vt_avail_ovr=0 \
   persist.dbg.wfc_avail_ovr=0 \
   persist.vendor.radio.jbims=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
   mm.enable.sec.smoothstreaming=true \
   mmp.enable.3g2=true \
   debug.stagefright.ccodec=0 \
   debug.stagefright.omx_default_rank.sw-audio=1 \
   debug.stagefright.omx_default_rank=0 \
   media.stagefright.thumbnail.prefer_hw_codecs=true \
   vendor.mediacodec.binder.size=6 \
   vendor.vidc.enc.narrow.searchrange=1 \
   vendor.vidc.enc.disable.pq=true

# Netmgrd
PRODUCT_PROPERTY_OVERRIDES += \
   persist.data.netmgrd.qos.enable=true

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
   ro.am.reschedule_service=true \
   ro.config.max_starting_bg=8 \
   ro.vendor.extension_library=libqti-perfd-client.so \
   ro.vendor.qti.am.reschedule_service=true \
   ro.vendor.qti.sys.fw.bservice_enable=true \
   ro.vendor.qti.sys.fw.bservice_limit=5 \
   ro.vendor.qti.sys.fw.bservice_age=5000 \
   ro.vendor.qti.sys.fw.use_trim_settings=true \
   ro.vendor.qti.sys.fw.empty_app_percent=50 \
   ro.vendor.qti.sys.fw.trim_empty_percent=100 \
   ro.vendor.qti.sys.fw.trim_cache_percent=100 \
   ro.vendor.qti.sys.fw.trim_enable_memory=1073741824

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
   persist.data.qmi.adb_logmask=0 \
   ro.qualcomm.cabl=0

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
   DEVICE_PROVISIONED=1 \
   persist.vendor.radio.add_power_save=1 \
   persist.vendor.radio.qcril_uim_vcc_feature=1 \
   persist.radio.apm_sim_not_pwdn=1 \
   persist.radio.dont_use_dsd=true \
   persist.radio.flexmap_type=dds \
   persist.radio.multisim.config=dsds \
   persist.vendor.radio.aosp_usr_pref_sel=true \
   rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
   ril.subscription.types=NV,RUIM \
   ro.telephony.call_ring.multiple=false \
   ro.telephony.default_network=9,9

# Time
PRODUCT_PROPERTY_OVERRIDES += \
   persist.timed.enable=true

# UART
PRODUCT_PROPERTY_OVERRIDES += \
   sys.uart.enable=0

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
   wifi.interface=wlan0

# Zygote preforking
PRODUCT_PROPERTY_OVERRIDES += \
   persist.device_config.runtime_native.usap_pool_enabled=false

# LMKD
PRODUCT_PROPERTY_OVERRIDES += \
   ro.lmk.use_minfree_levels=true \
   ro.lmk.use_psi=false \
   ro.lmk.kill_heaviest_task=false
