#!/usr/bin/env bash

echo -e "\033[32mGit pull\033[0m"
git pull

echo -e "\033[32mClone Lean's latest sources. (use --depth=1) \033[0m"
pushd package
rm -rf lean
git clone --depth=1 https://github.com/coolsnowwolf/lede
popd

echo -e "\033[32mCopy Lean's packages to openwrt/package/lean.\033[0m"
mkdir package/lean
pushd package/lede/package/lean
cp -r {adbyby,automount,autocore,baidupcs-web,ddns-scripts_aliyun,ddns-scripts_dnspod,dns2socks,frp,ipt2socks,ipv6-helper,kcptun,luci-app-adbyby-plus,luci-app-airplay2,luci-app-arpbind,luci-app-autoreboot,luci-app-baidupcs-web,luci-app-cifs-mount,luci-app-cpufreq,luci-app-familycloud,luci-app-filetransfer,luci-app-frpc,luci-app-frps,luci-app-n2n_v2,luci-app-netdata,luci-app-nfs,luci-app-nps,luci-app-softethervpn,luci-app-ssr-plus,luci-app-usb-printer,luci-app-unblockmusic,luci-app-vsftpd,luci-app-webadmin,luci-app-xlnetacc,luci-app-zerotier,luci-lib-fs,microsocks,n2n_v2,npc,pdnsd-alt,proxychains-ng,redsocks2,shadowsocksr-libev,simple-obfs,softethervpn5,srelay,tcpping,trojan,UnblockNeteaseMusic,UnblockNeteaseMusicGo,v2ray,v2ray-plugin,vsftpd-alt} "../../../lean"
popd

echo -e "\033[32mAdd Default settings.\033[0m"
pushd package/lean
git clone -b default --depth=1 https://github.com/SuLingGG/default-settings
popd

echo -e "\033[32mClean Lean's code.\033[0m"
pushd package
rm -rf lede
popd

echo -e "\033[32mClone community packages to package/community.\033[0m"
rm -rf package/community/*
pushd package/community

echo -e "\033[32mLienol's Packages.\033[0m"
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf openwrt-package/lienol/luci-app-ssr-python-pro-server

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

echo -e "\033[32mAdd openwrt-iptvhelper.\033[0m"
git clone --depth=1 https://github.com/riverscn/openwrt-iptvhelper

echo -e "\033[32mAdd luci-app-diskman.\033[0m"
git clone --depth=1 https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

echo -e "\033[32mAdd luci-theme-argon.\033[0m"
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon

echo -e "\033[32mAdd smartdns.\033[0m"
rm -rf ../smartdns ../luci-app-smartdns
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

echo -e "\033[32mAdd udptools.\033[0m"
git clone --depth=1 https://github.com/bao3/openwrt-udp2raw
git clone --depth=1 https://github.com/bao3/openwrt-udpspeeder
git clone --depth=1 https://github.com/bao3/luci-udptools

echo -e "\033[32mAdd OpenAppFilter.\033[0m"
git clone --depth=1 https://github.com/destan19/OpenAppFilter

echo -e "\033[32mluci-app-dockerman.\033[0m"
mkdir luci-lib-docker
wget https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile -O luci-lib-docker/Makefile
mkdir luci-app-dockerman
wget https://raw.githubusercontent.com/lisaac/luci-app-dockerman/master/Makefile -O luci-app-dockerman/Makefile

echo -e "\033[32mAdd tmate.\033[0m"
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/tmate
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/msgpack-c

echo -e "\033[32mAdd gotop.\033[0m"
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gotop

echo -e "\033[32mSubscribe converters.\033[0m"
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subconverter
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/jpcre2
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/rapidjson
popd

echo -e "\033[32mUpdate & Install feeds.\033[0m"
./scripts/feeds update -a
./scripts/feeds install -a

echo -e "\033[32mConvert translation.\033[0m"
curl -s https://raw.githubusercontent.com/project-openwrt/build-scripts/master/convert_translation.sh | bash || true

echo -e "\033[32mRemove upx.\033[0m"
curl -s https://raw.githubusercontent.com/SuLingGG/OpenWrt-Rpi/master/scripts/remove_upx.sh | bash || true

exit 0
