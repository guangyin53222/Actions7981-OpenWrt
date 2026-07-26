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

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

clone_pkg() {
  local repo="$1"
  local dest="$2"
  rm -rf "$dest"
  git clone --depth=1 "$repo" "$dest"
}

# EasyTier
clone_pkg https://github.com/EasyTier/luci-app-easytier package/easytier
# OpenAppFilter
clone_pkg https://github.com/destan19/OpenAppFilter package/OpenAppFilter
# iStore
clone_pkg https://github.com/linkease/istore.git package/luci-app-store
# gecoosac
clone_pkg https://github.com/laipeng668/luci-app-gecoosac package/luci-app-gecoosac
# tcpdump抓包
clone_pkg https://github.com/KFERMercer/luci-app-tcpdump.git package/luci-app-tcpdump

# wan-mac修改插件
mkdir -p tmp
TMP_DIR="tmp/openwrt-app-actions"
rm -rf "$TMP_DIR"
git clone --depth=1 https://github.com/linkease/openwrt-app-actions "$TMP_DIR"
if [ -d "${TMP_DIR}/applications/luci-app-wan-mac" ]; then
  rm -rf package/luci-app-wan-mac
  mv "${TMP_DIR}/applications/luci-app-wan-mac" package/
fi
rm -rf "$TMP_DIR"
