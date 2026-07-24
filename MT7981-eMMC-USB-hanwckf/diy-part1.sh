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
#!/bin/bash
SRC_FILES="$GITHUB_WORKSPACE/MT7981-eMMC-USB-hanwckf/files"
DST_FILES="$GITHUB_WORKSPACE/openwrt/files"

echo "源目录: $SRC_FILES"
if [ ! -d "$SRC_FILES" ];then
    echo " 源文件夹不存在"
    exit 1
fi

mkdir -p "$DST_FILES"
cp -r "$SRC_FILES"/* "$DST_FILES"/
echo " 文件复制完成"

chmod +x "$DST_FILES/etc/zerotier.start"
chmod +x "$DST_FILES/etc/zerotier.stop"
chmod +x "$DST_FILES/etc/zerotier.reload"
echo " Zerotier脚本授权完毕"

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
git clone --depth=1 https://github.com/EasyTier/luci-app-easytier package/easytier
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
# istore插件
git clone --depth=1 https://github.com/linkease/istore.git package/luci-app-store
# 克隆gecoosac插件
git clone --depth=1 https://github.com/laipeng668/luci-app-gecoosac package/luci-app-gecoosac
#下载 wan-mac 修改插件，先创建tmp目录
mkdir -p tmp
git clone --depth=1 https://github.com/linkease/openwrt-app-actions tmp/openwrt-app-actions
mv tmp/openwrt-app-actions/applications/luci-app-wan-mac package/luci-app-wan-mac
rm -rf tmp/openwrt-app-actions
# 添加 luci-app-tcpdump 抓包插件
git clone --depth=1 https://github.com/KFERMercer/luci-app-tcpdump.git ./package/luci-app-tcpdump
