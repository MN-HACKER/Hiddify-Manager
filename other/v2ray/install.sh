source /opt/hiddify-manager/common/utils.sh
install_package shadowsocks-libev

if ! is_installed ./v2ray-plugin_linux; then
    wget -c https://github.com/v2fly/v2ray-core/releases/download/v5.32.0/v2ray-linux-$(dpkg --print-architecture)-v5.32.0.tar.gz
    tar xvzf v2ray-linux-$(dpkg --print-architecture)-v5.32.0.tar.gz
    mv v2ray v2ray_linux
fi
