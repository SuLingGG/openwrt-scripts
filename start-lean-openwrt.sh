#!/usr/bin/env bash

echo -e "\033[32mClone Lean's latest sources. \033[0m"
git clone https://github.com/coolsnowwolf/lede

mkdir lede/package/community && cd lede/package/community

echo -e "\033[32mAdd mentohust & luci-app-mentohust.\033[0m"
git clone https://github.com/BoringCat/luci-app-mentohust
git clone https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

echo -e "\033[32mAdd ServerChan.\033[0m"
git clone https://github.com/tty228/luci-app-serverchan

echo -e "\033[32mAdd OpenClash.\033[0m"
git clone https://github.com/vernesong/OpenClash

echo -e "\033[32mAdd luci-app-koolproxyR.\033[0m"
git clone https://github.com/Leo-Jo/luci-app-koolproxyR

echo -e "\033[32mAdd luci-app-onliner. (need luci-app-nlbwmon)\033[0m"
git clone https://github.com/rufengsuixing/luci-app-onliner

echo -e "\033[32mAdd luci-app-dockerman.\033[0m"
git clone https://github.com/lisaac/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman

echo -e "\033[32mAdd luci-app-adguardhome.\033[0m"
git clone https://github.com/rufengsuixing/luci-app-adguardhome

echo -e "\033[32mAdd Rclone-OpenWrt.\033[0m"
git clone https://github.com/ElonH/Rclone-OpenWrt

echo -e "\033[32mAdd luci-app-vssr.\033[0m"
git clone https://github.com/jerrykuku/luci-app-vssr

echo -e "\033[32mAdd luci-theme-argon.\033[0m"
git clone https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon

echo -e "\033[32mAdd Lienol's feeds.\033[0m"
cd ../..
echo "src-git lienol https://github.com/Lienol/openwrt-package" >> feeds.conf.default

echo -e "\033[32mCompile po2lmo.\033[0m"
git clone https://github.com/openwrt-dev/po2lmo
cd po2lmo
make && sudo make install
cd ..

echo -e "\033[32mUpdate & Install feeds.\033[0m"
./scripts/feeds update -a
./scripts/feeds install -a

exit 0