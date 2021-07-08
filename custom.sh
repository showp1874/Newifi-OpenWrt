echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

echo '修改默认主题'
sed -i 's/config internal themes/config internal themes\n    option Edge  \"\/luci-static\/edge\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

echo '去除默认bootstrap主题'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

echo '删除旧版argon,链接新版'
# rm -rf ./package/lean/luci-theme-argon
# git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon ../custom/luci-theme-argon
# git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config ../custom/luci-app-argon-config
git clone --depth=1 https://github.com/garypang13/luci-theme-edge ../custom/luci-theme-edge

# echo '插件'
# svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-turboacc ../custom/luci-app-turboacc
# svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ramfree ../custom/luci-app-ramfree
# git clone https://github.com/sirpdboy/luci-app-advanced ../custom/luci-app-advanced
# svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-jd-dailybonus ../custom/luci-app-jd-dailybonus
# svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot ../custom/luci-app-autoreboot

echo '集成diy目录'
ln -s ../../custom ./package/openwrt-packages

# echo '首页增加CPU频率动态显示'
# cp -f ../diy/mod-index.htm ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

