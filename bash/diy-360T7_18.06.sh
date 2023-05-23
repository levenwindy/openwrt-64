#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 默认ip 192.168.1.1
sed -i 's/192.168.[0-9]\{1,3\}.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 修改时区 UTF-8
sed -i 's/UTC/CST-8/g'  package/base-files/files/bin/config_generate

# 修改主机名 OP
sed -i 's/ImmortalWrt/OpenWrt/g'  package/base-files/files/bin/config_generate

# 时区
sed -i 's/time1.apple.com/time1.cloud.tencent.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time1.google.com/ntp.aliyun.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time.cloudflare.com/cn.ntp.org.cn/g'  package/base-files/files/bin/config_generate
sed -i 's/pool.ntp.org/cn.pool.ntp.org/g'  package/base-files/files/bin/config_generate

# 替换腾讯 opkg 源 21+ ImmortalWrt只有 mirrors.vsean.net 和 北大源 18.06有腾讯源
# sed -i 's,mirrors.vsean.net,mirrors.cloud.tencent.com,g'  package/emortal/default-settings/files/99-default-settings-chinese
