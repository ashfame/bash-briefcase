#!/bin/bash

WPInstallPaths[0]='/Users/ashfame/www/httpscop.lo/www/'
WPInstallPaths[1]='/Users/ashfame/www/alertyo.lo/www/'
WPInstallPaths[2]='/Users/ashfame/www/redirecto.lo/www/'
WPInstallPaths[3]='/Users/ashfame/www/blog.ashfame.lo/www/'
WPInstallPaths[4]='/Users/ashfame/www/redirecto.lo/www/'

for i in "${WPInstallPaths[@]}"
do
	echo 'Going to' $i
    cd $i

    #
    # Update WP Core
    #

    # check WP core versions
    current_wp_version=$(wp core version)
    echo "Current WP version: $current_wp_version"
    wp core update
    latest_wp_version=$(wp core version)
    echo "Current WP version now: $latest_wp_version"

    # commit if needed
    if [ $latest_wp_version != $current_wp_version ]
    then
        git add .
        git commit -m "updated WP to latest version: $latest_wp_version"
    fi

    #
    # Update themes & plugins
    #
    wp theme update --all
    git add wp-content/themes
    wp plugin update --all
    git add wp-content/plugins
    git commit -m "updated themes & plugins"

    # Deploy to server
    git push && git push prod

    echo ""
    echo ""
done
