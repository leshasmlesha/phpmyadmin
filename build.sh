VER="4_9_1"
VERIN="4.9.1"
rm -rf phpmyadmin*
if [ -d "source" ]; then
rm -rf source
  fi
if [ -d "$HOME/.cache/phpmyadmin/backup" ]; then
mv $HOME/.cache/phpmyadmin/backup backup
  fi
if [ -d "backup" ]; then
  cd backup
  git pull
  cd ..
  cp -r backup source
  if [ ! -d "$HOME/.cache/phpmyadmin" ]; then
  mkdir $HOME/.cache
  mkdir $HOME/.cache/phpmyadmin
  fi
  mv backup $HOME/.cache/phpmyadmin/backup
  else
  rm -rf source
  git clone https://github.com/phpmyadmin/phpmyadmin.git source
  cp -r source backup
fi
cd source
git checkout RELEASE_$VER
git checkout -b release
composer update --no-dev
scripts/update-po
rm -rf *
git checkout .
cd themes
curl -O https://files.phpmyadmin.net/themes/metro/2.8.1/metro-2.8.1.zip
unzip metro-*
rm metro-*
cd ..
git add -f themes/metro
git commit -m 'Add changed from leshasmlesha'
scripts/create-release.sh $VERIN release
cp release/phpMyAdmin-$VERIN-source.tar.xz ../phpmyadmin_$VERIN.orig.tar.xz
cd ..
rm -rf source
curl -O http://archive.ubuntu.com/ubuntu/pool/universe/p/phpmyadmin/phpmyadmin_4.6.6-5.debian.tar.xz
mkdir phpmyadmin
tar xf phpmyadmin_4.6.6-5.debian.tar.xz -C phpmyadmin
rm phpmyadmin_4.6.6-5.debian.tar.xz
#curl https://files.phpmyadmin.net/phpMyAdmin/$VERIN/phpMyAdmin-$VERIN-source.tar.xz -o phpmyadmin_$VERIN.orig.tar.xz
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
dpkg-buildpackage -rfakeroot
cd ../
rm -rf phpmyadmin

