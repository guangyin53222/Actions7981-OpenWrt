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

# 启用files自定义配置文件（files大法，取消注释）
if [ -d "$GITHUB_WORKSPACE/files" ]; then
  cp -r $GITHUB_WORKSPACE/files openwrt/
fi

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

git clone https://github.com/EasyTier/luci-app-easytier package/easytier
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter

# istore插件
git clone https://github.com/linkease/istore.git package/luci-app-store

# 克隆gecoosac插件
git clone --depth=1 https://github.com/laipeng668/luci-app-gecoosac package/luci-app-gecoosac

#下载 wan-mac 修改插件，先创建tmp目录
mkdir -p tmp
git clone --depth=1 https://github.com/linkease/openwrt-app-actions tmp/openwrt-app-actions
mv tmp/openwrt-app-actions/applications/luci-app-wan-mac package/luci-app-wan-mac
rm -rf tmp/openwrt-app-actions

# 添加 luci-app-tcpdump 抓包插件
git clone https://github.com/KFERMercer/luci-app-tcpdump.git ./package/luci-app-tcpdump
