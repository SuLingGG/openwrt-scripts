# **[OpenWrt-Scripts](https://github.com/SuLingGG/openwrt-scripts)**

此项目旨在快速拉取 OpenWrt 源码及第三方包。

## start-lean-openwrt.sh

**`start-lean-openwrt.sh` 此脚本适用于 Lean 大 OpenWrt 项目：**

<https://github.com/coolsnowwolf/lede>

**执行此脚本后，脚本将自动进行以下操作：**

1.克隆 Lean 大 OpenWrt 项目源码至 `./lede`；

2.克隆脚本中的第三方包项目源码至 `./lede/package/community`目录下；

3.添加 Lienol 大 Feeds: <https://github.com/Lienol/openwrt-package> 至 `./lede/feeds.conf.default`；

4.克隆 po2lmo 项目并自动安装；

5.Update & Install Feeds。

**上文中的 "第三方包" 包含：**

mentohust - 锐捷拨号客户端主程序：

https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

mentohust - Luci 界面：

https://github.com/BoringCat/luci-app-mentohust

Server 酱：

https://github.com/tty228/luci-app-serverchan

OpenClash：

https://github.com/vernesong/OpenClash

koolproxyR - 去广告工具：

https://github.com/Leo-Jo/luci-app-koolproxyR

Onliner - 在线客户端查询：

https://github.com/rufengsuixing/luci-app-onliner

Dockerman - Docker 管理工具：

https://github.com/lisaac/luci-lib-docker

https://github.com/lisaac/luci-app-dockerman

ADguardHome - 去广告工具：

https://github.com/rufengsuixing/luci-app-adguardhome

Rclone-OpenWrt - Rclone 的 Luci 控制面板：

https://github.com/ElonH/Rclone-OpenWrt

luci-theme-argon - 魔改版 Argon 主题：

https://github.com/jerrykuku/luci-theme-argon

## start-official-openwrt.sh

**`start-official-openwrt.sh` 此脚本适用于官方 OpenWrt 项目：**

<https://github.com/openwrt/openwrt>

**执行此脚本后，脚本将自动进行以下操作：**

1.克隆官方 OpenWrt 项目源码至 `./openwrt`；

2.克隆 Lean 大源码，并复制 Lean 大源码中与官方 OpenWrt 不冲突的包至 `./openwrt/package/lean`目录下；

3.克隆脚本中的第三方包项目源码至 `./openwrt/package/community`；

4.添加 Lienol 大 Feeds: <https://github.com/Lienol/openwrt-package> 至 `./openwrt/feeds.conf.default`；

5.克隆 po2lmo 项目并自动安装；

6.Update & Install Feeds。

**上文中的 "第三方包" 包含：**

mentohust - 锐捷拨号客户端主程序：

https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

mentohust - Luci 界面：

https://github.com/BoringCat/luci-app-mentohust

Server 酱：

https://github.com/tty228/luci-app-serverchan

OpenClash：

https://github.com/vernesong/OpenClash

koolproxyR - 去广告工具：

https://github.com/Leo-Jo/luci-app-koolproxyR

Onliner - 在线客户端查询：

https://github.com/rufengsuixing/luci-app-onliner

Dockerman - Docker 管理工具：

https://github.com/lisaac/luci-lib-docker

https://github.com/lisaac/luci-app-dockerman

ADguardHome - 去广告工具：

https://github.com/rufengsuixing/luci-app-adguardhome

Rclone-OpenWrt - Rclone 的 Luci 控制面板：

https://github.com/ElonH/Rclone-OpenWrt

luci-theme-argon - 魔改版 Argon 主题：

https://github.com/jerrykuku/luci-theme-argon

luci-app-ssr-plus-Jo - 魔改版 ShadowSocks R Plus+ 客户端：

https://github.com/Leo-Jo-My/luci-app-ssr-plus-Jo

https://github.com/SuLingGG/ssr-plus-Jo-dependences

luci-app-frpc - Frp 内网穿透客户端：

https://github.com/SuLingGG/luci-app-frpc

openwrt-iptvhelper - IPTV 助手：

https://github.com/riverscn/openwrt-iptvhelper

default settings - 固件默认设置 (源自 Lean 大软件包)：

https://github.com/SuLingGG/default-settings

## update-lean-openwrt.sh / update-official-openwrt.sh

两脚本用于更新第三方包，

`update-lean-openwrt.sh` 需要存放在在 Lean 大源码目录 (`lede/update-lean-openwrt.sh`) 下，

`update-official-openwrt.sh` 需要存放在 OpenWrt 官方源码目录 (`openwrt/update-official-openwrt.sh`)下。

**执行此脚本后，脚本将自动进行以下操作：**

1.更新 `package/community` 中的所有包源码；

2.Update & Install Feeds。







