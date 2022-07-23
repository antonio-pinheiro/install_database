#http://repo.mongodb.org/apt/debian/dists/bullseye/mongodb-org/6.0/main/binary-amd64/

install_mongodb(){
    
    echo
    echo "Installing mongoDB"
    echo
    wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add - echo "deb http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
    apt-get update -y
    if  apt-get install mongodb-org -y; then
        echo "mongoDB successfuly installed..."
        echo
        echo "Configuring mongoDB..."
        echo
        main_function
    else
        echo "Installation failed, please try again..."
        main_function
    fi
}

install_mongodb_ubuntu(){
    
    echo
    echo "Installing mongoDB"
    echo
    apt-get update -y
    if  apt-get install mongodb mongodb-tools mongoose -y; then
        echo "mongoDB successfuly installed..."
        main_function
    else
        echo "Installation failed, please try again..."
        main_function
    fi
}


install_mariadb(){
    
    echo
    echo "Installing MySQL / MariaDB"
    echo
    apt-get update -y
    if  apt-get install mariadb-server -y; then
        echo "MySQL / MariaDB successfuly installed..."
        main_function
    else
        echo "Installation failed, please try again..."
        main_function
    fi
}

install_postgresql(){
    
    echo
    echo "Installing MySQL / MariaDB"
    echo
    apt-get update -y
    if  sudo apt install postgresql postgresql-contrib -y; then
        echo "PostgreSQL successfuly installed..."
        main_function
    else
        echo "Installation failed, please try again..."
        main_function
    fi
}


main_function(){
echo
echo "Select an option: "
echo
echo "1 - Install mongoDB on Debian"
echo "2 - Install mongoDB on Linux Mint or Ubuntu"
echo "3 - Install MySql / MariaDB"
echo "4 - Install PostgreSQL"
echo "5 - Exit"
echo

while :
do
  read select_option
  case $select_option in

    1)  install_mongodb;;
    2)  install_mongodb_ubuntu;;
    3)  install_mysql;;
    4)  install_postgresql;;
    5)  exit

  esac
done
}

main_function