`sudo apt-get build-dep phpmyadmin`

`curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -`

`echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`

`sudo apt-get install php-curl curl git composer yarn p7zip-full fakeroot`

`sh -c "$(curl -sSL https://leshasmlesha.github.io/phpmyadmin/build.sh)"`
