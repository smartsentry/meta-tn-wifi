# pico-imx6ul + BASEBOARD=pi ships only a QCA9377 module (see
# kernel-module-qcacld-tn.bb), and we only have QCA9377 firmware available
# locally (from drivers.7z, matches ${FILE_DIRNAME}/files/ exactly). Trim
# SRC_URI/do_install down from the upstream recipe's QCA9377+QCA6174 set so
# do_pre_fetch's local-files check succeeds without needing a TechNexion
# GitLab PA_TOKEN for QCA6174 firmware this board doesn't use.

SRC_URI = " \
    file://qca9377/CadenceLicense.txt \
    file://qca9377/bdwlan30.bin \
    file://qca9377/otp30.bin \
    file://qca9377/qwlan30.bin \
    file://qca9377/utf30.bin \
    file://wlan/cfg.dat \
    file://wlan/qca9377/qcom_cfg.ini \
    file://qca/notice.txt \
    file://qca/nvm_tlv_3.2.bin \
    file://qca/rampatch_tlv_3.2.tlv \
"

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/qca9377/
    install -m 0755 ${S}/qca9377/bdwlan30.bin ${D}${nonarch_base_libdir}/firmware/qca9377/
    install -m 0755 ${S}/qca9377/otp30.bin ${D}${nonarch_base_libdir}/firmware/qca9377/
    install -m 0755 ${S}/qca9377/qwlan30.bin ${D}${nonarch_base_libdir}/firmware/qca9377/
    install -m 0755 ${S}/qca9377/utf30.bin ${D}${nonarch_base_libdir}/firmware/qca9377/
    install -d ${D}${nonarch_base_libdir}/firmware/wlan/qca9377/
    install -m 0755 ${S}/wlan/cfg.dat ${D}${nonarch_base_libdir}/firmware/wlan/
    install -m 0755 ${S}/wlan/qca9377/qcom_cfg.ini ${D}${nonarch_base_libdir}/firmware/wlan/qca9377/
    install -d ${D}${nonarch_base_libdir}/firmware/qca
    install -m 0755 ${S}/qca/nvm_tlv_3.2.bin ${D}${nonarch_base_libdir}/firmware/qca
    install -m 0755 ${S}/qca/rampatch_tlv_3.2.tlv ${D}${nonarch_base_libdir}/firmware/qca
}
