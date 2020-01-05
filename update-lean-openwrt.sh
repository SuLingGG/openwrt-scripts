#!/usr/bin/env bash

cd package/community

echo -e "\033[32mUpdate mentohust & luci-app-mentohust.\033[0m"
cd luci-app-mentohust
git pull
cd ../MentoHUST-OpenWrt-ipk
git pull

echo -e "\033[32mUpdate ServerChan.\033[0m"
cd ../luci-app-serverchan
git pull

echo -e "\033[32mUpdate OpenClash.\033[0m"
cd ../OpenClash
git pull

echo -e "\033[32mUpdate luci-app-koolproxyR.\033[0m"
cd ../luci-app-koolproxyR
git pull

echo -e "\033[32mUpdate luci-app-onliner.\033[0m"
cd ../luci-app-onliner
git pull

echo -e "\033[32mUpdate luci-app-dockerman.\033[0m"
cd ../luci-lib-docker
git pull
cd ../luci-app-dockerman
git pull

echo -e "\033[32mUpdate luci-app-adguardhome.\033[0m"
cd ../luci-app-adguardhome
git pull

echo -e "\033[32mUpdate Rclone-OpenWrt.\033[0m"
cd ../Rclone-OpenWrt
git pull

echo -e "\033[32mUpdate luci-app-vssr.\033[0m"
cd ../luci-app-vssr
git pull

echo -e "\033[32mUpdate luci-theme-argon.\033[0m"
cd ../luci-theme-argon
git pull

cd ../../..

echo -e "\033[32mUpdate & Install feeds.\033[0m"
./scripts/feeds update -a
./scripts/feeds install -a

exit 0