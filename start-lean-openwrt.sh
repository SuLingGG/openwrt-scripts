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

echo -e "\033[32mAdd smartdns.\033[0m"
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
git clone https://github.com/SuLingGG/luci-app-smartdns ../luci-app-smartdns

echo -e "\033[32mAdd OpenAppFilter.\033[0m"
git clone https://github.com/destan19/OpenAppFilter
popd

echo -e "\033[32mCompile po2lmo.\033[0m"
git clone https://github.com/openwrt-dev/po2lmo
pushd po2lmo
make && sudo make install
popd

echo -e "\033[32mChange timezone.\033[0m"
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo -e "\033[32mChange default theme.\033[0m"
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

echo -e "\033[32mRemove bootstrap theme.\033[0m"
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

exit 0
