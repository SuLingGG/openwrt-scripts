#!/usr/bin/env bash

echo -e "\033[32mGit pull\033[0m"
git pull

echo -e "\033[32mClone Lean's latest sources. (use --depth=1) \033[0m"
cd package
rm -rf lean
git clone --depth=1 https://github.com/coolsnowwolf/lede

echo -e "\033[32mCopy Lean's packages to openwrt/package/lean.\033[0m"
mkdir lean
cd lede/package/lean
cp -r {adbyby,antfs,antfs-mount,automount,baidupcs-web,ddns-scripts_aliyun,ddns-scripts_dnspod,ipt2socks,luci-app-adbyby-plus,luci-app-baidupcs-web,luci-app-dnspod,luci-app-familycloud,luci-app-kodexplorer,luci-app-mwan3helper,luci-app-n2n_v2,luci-app-netdata,luci-app-nps,luci-app-syncdial,luci-app-unblockmusic,luci-app-verysync,luci-app-vsftpd,luci-app-xlnetacc,luci-app-zerotier,n2n_v2,npc,pdnsd-alt,shadowsocksr-libev,trojan,UnblockNeteaseMusic,v2ray,verysync,vsftpd-alt} "../../../lean"
cp -r {luci-app-smartdns,smartdns} "../../../"
cd ../../tools
cp -rf {upx,ucl} "../../../tools"
cd "../../"
rm -rf lede

echo -e "\033[32mAdd mentohust & luci-app-mentohust.\033[0m"
cd community
rm -rf *
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

echo -e "\033[32mAdd luci-app-diskman.\033[0m"
git clone https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

echo -e "\033[32mAdd luci-app-vssr.\033[0m"
git clone https://github.com/jerrykuku/luci-app-vssr

echo -e "\033[32mAdd luci-theme-argon.\033[0m"
git clone https://github.com/jerrykuku/luci-theme-argon

echo -e "\033[32mAdd default settings.\033[0m"
git clone https://github.com/SuLingGG/default-settings

echo -e "\033[32mUpdate & Install feeds.\033[0m"
cd ../..
./scripts/feeds update -a
./scripts/feeds install -a

echo -e "\033[32mConvert Translation.\033[0m"
cp ../convert_translation.sh .
chmod +x ./convert_translation.sh
./convert_translation.sh || true

exit 0
