#!/usr/bin/env bash

echo -e "\033[32mGit pull\033[0m"
git pull

cd package/community
rm -rf *

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

echo -e "\033[32mAdd luci-app-adguardhome.\033[0m"
git clone https://github.com/rufengsuixing/luci-app-adguardhome

echo -e "\033[32mAdd Rclone-OpenWrt.\033[0m"
git clone https://github.com/ElonH/Rclone-OpenWrt

echo -e "\033[32mAdd luci-app-diskman.\033[0m"
git clone https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

echo -e "\033[32mAdd luci-theme-argon.\033[0m"
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon

cd ../..

echo -e "\033[32mUpdate & Install feeds.\033[0m"
./scripts/feeds update -a
./scripts/feeds install -a

exit 0
