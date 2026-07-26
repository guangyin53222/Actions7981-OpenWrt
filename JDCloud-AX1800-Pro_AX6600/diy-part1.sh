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

# 自定义克隆函数，目录不存在才克隆，增加--depth=1加速下载
clone_pkg() {
  local repo_url="$1"
  local target_dir="$2"
  if [ ! -d "${target_dir}" ]; then
    git clone --depth=1 "${repo_url}" "${target_dir}"
  fi
}

# Add a feed source
clone_pkg https://github.com/kenzok8/openwrt-packages package/kenzo
clone_pkg https://github.com/kenzok8/small package/small

# OpenAppFilter 应用过滤
clone_pkg https://github.com/destan19/OpenAppFilter package/OpenAppFilter
# iStore 应用商店
clone_pkg https://github.com/linkease/istore.git package/luci-app-store
# gecoosac 锐捷认证
clone_pkg https://github.com/laipeng668/luci-app-gecoosac package/luci-app-gecoosac
# tcpdump 抓包工具
clone_pkg https://github.com/KFERMercer/luci-app-tcpdump.git package/luci-app-tcpdump
