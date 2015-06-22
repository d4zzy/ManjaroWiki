#!/bin/bash
root_account() {
if [ "$UID" -eq "0" ]; then
	wget https://raw.githubusercontent.com/dazzay/ManjaroWiki/manjaro-wiki/wiki.sh -O /usr/bin/manjaro-wiki # wget wiki script straight from github repo
	chmod +x /usr/bin/manjaro-wiki # make executeable
	echo "manjaro-wiki sucessfully installed!"
	manjaro-wiki --help # show info
else user_account
fi
}

user_account() {
if [ -e "/usr/bin/sudo" ]; then # check if sudo is installed
	sudo wget https://raw.githubusercontent.com/dazzay/ManjaroWiki/manjaro-wiki/wiki.sh -O /usr/bin/manjaro-wiki # wget wiki script straight from github repo
	sudo chmod +x /usr/bin/manjaro-wiki # make executeable
	echo "manjaro-wiki sucessfully installed!"
	manjaro-wiki --help # show info
else
	echo
	echo "*sudo not detected* it is recommended to use sudo for administration from a user account."
	echo
	echo "To install manjaro-wiki-cli please provide the root password"
	su -c 'wget -O - https://raw.githubusercontent.com/dazzay/ManjaroWiki/manjaro-wiki/wiki.sh | sh'
fi
}
root_account