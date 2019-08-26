VER="4_8_5"
VERIN="4.8.5"
if [ -d "$LINK_OR_DIR" ]; then 
  cp backup source
  else
  git clone https://github.com/phpmyadmin/phpmyadmin.git source
fi
cp source backup
cd source
git checkout RELEASE_$VER
git checkout -b release
composer update --no-dev
scripts/update-po
rm -rf *
git checkout .
cd themes
curl -O https://files.phpmyadmin.net/themes/metro/2.8/metro-2.8.zip
unzip metro-*
rm metro-*
cd ../
git add .
git commit -m 'Add changed from leshasmlesha'
scripts/create-release.sh $VERIN release
cp release/phpMyAdmin-$VERIN-source.tar.xz ../phpmyadmin_$VERIN.orig.tar.xz
cd ..
rm -rf source
curl -O http://archive.ubuntu.com/ubuntu/pool/universe/p/phpmyadmin/phpmyadmin_4.6.6-5.debian.tar.xz
mkdir phpmyadmin
tar xf phpmyadmin_4.6.6-5.debian.tar.xz -C phpmyadmin
rm phpmyadmin_4.6.6-5.debian.tar.xz
#curl https://files.phpmyadmin.net/phpMyAdmin/4.8.5/phpMyAdmin-4.8.5-source.tar.xz -o phpmyadmin_4.8.5.orig.tar.xz
tar xf phpmyadmin_$VERIN.orig.tar.xz -C phpmyadmin --strip-components=1
rm phpmyadmin/debian/patches/Truncate-only-long-passwords.patch
cd phpmyadmin/debian/
curl -O https://leshasmlesha.github.io/phpmyadmin/changed/install
curl -O https://leshasmlesha.github.io/phpmyadmin/changed/rules
curl -O https://leshasmlesha.github.io/phpmyadmin/changed/changelog
curl -O https://leshasmlesha.github.io/phpmyadmin/changed/control
cd patches
curl -O https://leshasmlesha.github.io/phpmyadmin/changed/series
curl -O https://leshasmlesha.github.io/phpmyadmin/changed/debian.patch
cd ../
rm -rf po/*.po*
cp ../po/* po
cd ..
dpkg-buildpackage
cd ../
rm -rf phpmyadmin

