#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.1.210/g' package/base-files/files/bin/config_generate

# 设定ip dns
# sed -i "/exit 0/i\uci set network.lan.ipaddr='192.168.1.210'" package/lean/default-settings/files/zzz-default-settings 
# sed -i "uci set network.lan.proto='static'" package/base-files/files/bin/config_generate
# sed -i "uci set network.lan.type='bridge'" package/base-files/files/bin/config_generate
# sed -i "uci set network.lan.ifname='eth0'" package/base-files/files/bin/config_generate
# sed -i "uci set network.lan.netmask='255.255.255.0'" package/base-files/files/bin/config_generate

# sed -i "/exit 0/i\uci set network.lan.gateway='192.168.1.1'" package/lean/default-settings/files/zzz-default-settings 
# sed -i "/exit 0/i\uci set network.lan.dns='192.168.1.1'" package/lean/default-settings/files/zzz-default-settings 
# sed -i "/exit 0/i\uci commit network" package/lean/default-settings/files/zzz-default-settings 
# cat package/lean/default-settings/files/zzz-default-settings 

#- name: 替换默认主题 luci-theme-argon
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile
#cat feeds/luci/collections/luci/Makefile
