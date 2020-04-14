#!/usr/bin/env bash

echo -e "\033[32mClone Lean's latest sources. \033[0m"
git clone https://github.com/coolsnowwolf/lede

echo -e "\033[32mAdd Lienol's feeds.\033[0m"
cd lede
echo "src-git lienol https://github.com/Lienol/openwrt-package" >> feeds.conf.default

echo -e "\033[32mUpdate & Install feeds.\033[0m"
./scripts/feeds update -a
./scripts/feeds install -a

echo -e "\033[32mClone community packages to package/community.\033[0m"
mkdir package/community
pushd package/community

echo -e "\033[32mAdd mentohust & luci-app-mentohust.\033[0m"
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

echo -e "\033[32mAdd ServerChan.\033[0m"
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

echo -e "\033[32mAdd OpenClash.\033[0m"
git clone --depth=1 https://github.com/vernesong/OpenClash

echo -e "\033[32mAdd luci-app-onliner. (need luci-app-nlbwmon)\033[0m"
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

echo -e "\033[32mAdd luci-app-adguardhome.\033[0m"
git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome

echo -e "\033[32mAdd Rclone-OpenWrt.\033[0m"
git clone --depth=1 https://github.com/ElonH/Rclone-OpenWrt

echo -e "\033[32mAdd luci-app-diskman.\033[0m"
git clone --depth=1 https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

echo -e "\033[32mAdd luci-app-dockerman.\033[0m"
git clone --depth=1 https://github.com/KFERMercer/luci-app-dockerman
mkdir luci-lib-docker
curl -s -o ./luci-lib-docker/Makefile https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile
rm -rf ../lean/luci-app-dockerman

echo -e "\033[32mAdd luci-theme-argon.\033[0m"
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon

echo -e "\033[32mAdd tmate.\033[0m"
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/tmate
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/msgpack-c

echo -e "\033[32mAdd gotop.\033[0m"
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gotop

echo -e "\033[32mAdd subscribe converters.\033[0m"
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subconverter
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/jpcre2
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/rapidjson

echo -e "\033[32mAdd smartdns.\033[0m"
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

echo -e "\033[32mAdd udptools.\033[0m"
git clone --depth=1 https://github.com/bao3/openwrt-udp2raw
git clone --depth=1 https://github.com/bao3/openwrt-udpspeeder
git clone --depth=1 https://github.com/bao3/luci-udptools

echo -e "\033[32mAdd OpenAppFilter.\033[0m"
git clone --depth=1 https://github.com/destan19/OpenAppFilter
popd

echo -e "\033[32mFix libssh.\033[0m"
pushd feeds/packages/libs
rm -rf libssh
svn co https://github.com/openwrt/packages/trunk/libs/libssh
popd

exit 0
