#!/bin/sh

#VARIABLES
if [ -z "$1" ]
    then
        echo -e "\e[32mwould you like to configure the database now? [Y/n]"
        read CONFIRM_DATABASE_CONFIGURE
        if [ "$CONFIRM_DATABASE_CONFIGURE" != "${CONFIRM_DATABASE_CONFIGURE#[Yy]}" ] ;then
            echo "starting database configuration ..."
            echo "\e[32mcreate your database Name ...\e[39m"
            read DATABASE_NAME
            echo -e "\e[39mdatabase: \e[32m${DATABASE_NAME}\e[39m do you want to continue? [Y/n]"
            read CONFIRM_DATABASE_INSTALL
        fi
    else 
    DATBASE_NAME=${1}
    CONFIRM_DATABASE_INSTALL="y"
fi

if [ "$CONFIRM_DATABASE_INSTALL" != "${CONFIRM_DATABASE_INSTALL#[Yy]}" ] ;then
    mysql -e "CREATE DATABASE ${1}; FLUSH PRIVILEGES;"
    echo "Success: database complete ..."
else
   echo "notice: database config skipped by user ..." 
fi

#SELF DELETE AND EXIT
rm -- "$0"
exit
