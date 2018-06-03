#!/usr/bin/env bash

WPInstallPaths[0]='/Users/ashfame/www/httpscop.lo/www/'
WPInstallPaths[1]='/Users/ashfame/www/alertyo.lo/www/'
WPInstallPaths[2]='/Users/ashfame/www/redirecto.lo/www/'
WPInstallPaths[3]='/Users/ashfame/www/blog.ashfame.lo/www/'

for i in "${WPInstallPaths[@]}"
do
	echo 'Going to' $i
    cd $i

    git status
	git diff
	read -p "Press enter to continue"

    echo ""
    echo ""
done
