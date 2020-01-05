#!/usr/bin/env bash

echo -e "\033[32mClone offical openwrt sources. \033[0m"
git clone https://github.com/openwrt/openwrt

echo -e "\033[32mClone Lean's latest sources. (use --depth=1) \033[0m"
mkdir -p package/lean && cd package
git clone --depth=1 https://github.com/coolsnowwolf/lede

echo -e "\033[32mCopy Lean's packages to ./package/lean.\033[0m"
cd lede/package/lean
cp -r {adbyby,automount,baidupcs-web,ddns-scripts_aliyun,ddns-scripts_dnspod,luci-app-adbyby-plus,luci-app-baidupcs-web,luci-app-dnspod,luci-app-familycloud,luci-app-kodexplorer,luci-app-n2n_v2,luci-app-netdata,luci-app-nps,luci-app-unblockmusic,luci-app-verysync,luci-app-zerotier,n2n_v2,npc,UnblockNeteaseMusic,verysync,luci-app-vsftpd,vsftpd-alt} "../../../lean"
cp -r {luci-app-smartdns,smartdns} "../../../"
cd "../../../"
rm -rf lede
mkdir community && cd community

echo -e "\033[32mAdd mentohust & luci-app-mentohust.\033[0m"
git clone https://github.com/BoringCat/luci-app-mentohust
git clone https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

echo -e "\033[32mAdd ServerChan.\033[0m"
git clone https://github.com/tty228/luci-app-serverchan

echo -e "\033[32mAdd luci-app-ssr-plus-Jo.\033[0m"
git clone https://github.com/Leo-Jo-My/luci-app-ssr-plus-Jo
git clone https://github.com/SuLingGG/ssr-plus-Jo-dependences
rm -rf ssr-plus-Jo-dependences/openwrt-v2ray-plugin

echo -e "\033[32mAdd OpenClash.\033[0m"
git clone https://github.com/vernesong/OpenClash

echo -e "\033[32mAdd luci-app-koolproxyR.\033[0m"
git clone https://github.com/Leo-Jo/luci-app-koolproxyR

echo -e "\033[32mAdd luci-app-onliner. (need luci-app-nlbwmon)\033[0m"
git clone https://github.com/rufengsuixing/luci-app-onliner

echo -e "\033[32mAdd luci-app-dockerman.\033[0m"
git clone https://github.com/lisaac/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman

echo -e "\033[32mAdd luci-app-frpc.\033[0m"
git clone https://github.com/SuLingGG/luci-app-frpc

echo -e "\033[32mAdd luci-app-adguardhome.\033[0m"
git clone https://github.com/rufengsuixing/luci-app-adguardhome

echo -e "\033[32mAdd Rclone-OpenWrt.\033[0m"
git clone https://github.com/ElonH/Rclone-OpenWrt

echo -e "\033[32mAdd openwrt-iptvhelper.\033[0m"
git clone https://github.com/riverscn/openwrt-iptvhelper

echo -e "\033[32mAdd luci-app-vssr.\033[0m"
git clone https://github.com/jerrykuku/luci-app-vssr

echo -e "\033[32mAdd default settings.\033[0m"
git clone https://github.com/SuLingGG/default-settings

echo -e "\033[32mCopy packages to openwrt/package.\033[0m"
cp -r ../* ../../openwrt/package

echo -e "\033[32mAdd Lienol's feeds.\033[0m"
cd ../../openwrt
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