`sudo apt-get install curl gnupg software-properties-common`

`sudo apt-add-repository ppa:ondrej/php`

`sudo apt-add-repository ppa:ondrej/apache2`

`curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -`

`sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8`

`sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.timeweb.ru/mariadb/repo/10.3/ubuntu bionic main'`

`sudo apt-get dist-upgrade`

`gpg --full-generate-key`

`sudo apt-get build-dep phpmyadmin`

`curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -`

`echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`

`sudo apt-get update`

`sudo apt-get install php-curl curl git composer yarn p7zip-full fakeroot`

`git config --global user.email "you@example.com"`

`git config --global user.name "Your Name"`

`sh -c "$(curl -sSL https://leshasmlesha.github.io/phpmyadmin/build.sh)"`
