#!/usr/bin/env bash

echo -e "\033[32mClone offical openwrt sources.\033[0m"
# Master branch:
# git clone --depth=1 https://github.com/openwrt/openwrt
# openwrt-19.07 branch:
git clone -b openwrt-19.07 --depth=1 https://github.com/openwrt/openwrt

echo -e "\033[32mAdd Lienol's feeds.\033[0m"
cd openwrt
echo "src-git lienol https://github.com/Lienol/openwrt-package" >> feeds.conf.default

echo -e "\033[32mUpdate & Install feeds.\033[0m"
./scripts/feeds update -a
./scripts/feeds install -a

echo -e "\033[32mClone Lean's latest sources. (use --depth=1) \033[0m"
pushd package
git clone --depth=1 https://github.com/coolsnowwolf/lede
popd

echo -e "\033[32mCopy Lean's packages to openwrt/package/lean.\033[0m"
mkdir package/lean
pushd package/lede/package/lean
cp -r {adbyby,automount,baidupcs-web,ddns-scripts_aliyun,ddns-scripts_dnspod,frpc,ipt2socks,kcptun,luci-app-adbyby-plus,luci-app-autoreboot,luci-app-baidupcs-web,luci-app-familycloud,luci-app-frpc,luci-app-kodexplorer,luci-app-mwan3helper,luci-app-n2n_v2,luci-app-netdata,luci-app-nps,luci-app-syncdial,luci-app-usb-printer,luci-app-unblockmusic,luci-app-unblockneteasemusic-go,luci-app-unblockneteasemusic-mini,luci-app-verysync,luci-app-vsftpd,luci-app-xlnetacc,luci-app-zerotier,n2n_v2,npc,pdnsd-alt,shadowsocksr-libev,simple-obfs,srelay,trojan,UnblockNeteaseMusic,UnblockNeteaseMusicGo,v2ray,v2ray-plugin,verysync,vsftpd-alt} "../../../lean"
popd

echo -e "\033[32mAdd upx & ucl.\033[0m"
pushd package/lede/tools
cp -r {upx,ucl} "../../../tools"
popd
sed -i 's/tools-\$(CONFIG_TARGET_x86) += qemu/tools-y += ucl upx\ntools-\$(CONFIG_TARGET_x86) += qemu/g' tools/Makefile

echo -e "\033[32mClean Lean's code.\033[0m"
pushd package
rm -rf lede
popd

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

echo -e "\033[32mAdd openwrt-iptvhelper.\033[0m"
git clone https://github.com/riverscn/openwrt-iptvhelper

echo -e "\033[32mAdd luci-app-diskman.\033[0m"
git clone https://github.com/lisaac/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

echo -e "\033[32mAdd luci-theme-argon.\033[0m"
git clone https://github.com/jerrykuku/luci-theme-argon

echo -e "\033[32mAdd smartdns.\033[0m"
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
git clone https://github.com/SuLingGG/luci-app-smartdns ../luci-app-smartdns

echo -e "\033[32mAdd OpenAppFilter.\033[0m"
git clone https://github.com/destan19/OpenAppFilter

echo -e "\033[32mAdd default settings.\033[0m"
git clone https://github.com/SuLingGG/default-settings

echo -e "\033[32mAdd luci-app-vssr.\033[0m"
git clone https://github.com/Leo-Jo-My/luci-app-vssr

echo -e "\033[32mDependces & Optimizations for luci-app-vssr.\033[0m"
svn co https://github.com/Leo-Jo-My/my/trunk/dnscrypt-proxy-full
svn co https://github.com/Leo-Jo-My/my/trunk/openwrt-dnsforwarder
svn co https://github.com/Leo-Jo-My/my/trunk/openwrt-udp2raw-speeder
svn co https://github.com/Leo-Jo-My/my/trunk/GoQuiet
svn co https://github.com/Leo-Jo-My/my/trunk/chinadns
sed -i 's/mux = 1/mux = 0/g' luci-app-vssr/root/usr/share/vssr/subscribe.lua
rm -rf ../../feeds/packages/net/kcptun

echo -e "\033[32mSubscribe converters.\033[0m"
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subconverter
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/jpcre2
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/rapidjson
popd

echo -e "\033[32mCompile po2lmo.\033[0m"
git clone https://github.com/openwrt-dev/po2lmo
pushd po2lmo
make && sudo make install
popd

echo -e "\033[32mEnable irqbalance.\033[0m"
sed -i 's/0/1/g' feeds/packages/utils/irqbalance/files/irqbalance.config

echo -e "\033[32mMax connections.\033[0m"
sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

echo -e "\033[32mChange timezone.\033[0m"
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo -e "\033[32mChange default theme.\033[0m"
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

echo -e "\033[32mRemove bootstrap theme.\033[0m"
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

echo -e "\033[32mConvert translation.\033[0m"
curl -s https://raw.githubusercontent.com/project-openwrt/build-scripts/master/convert_translation.sh | bash || true

exit 0
