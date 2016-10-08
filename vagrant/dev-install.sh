# Install git, zip, and add PHP repository

sudo apt-get install git -y
sudo apt-get install zip -y
sudo apt-get install python-software-properties -y
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
sudo apt-get update


# Install PHP, Nginx, and PHP packages

sudo apt-get install php7.0 php7.0-fpm php7.0-mysql -y
sudo apt-get install nginx -y
sudo apt-get install php7.0-curl -y
sudo apt-get install php-dev -y
sudo service php7.0-fpm reload
sudo apt-get install php7.0-gd -y
sudo apt-get install php7.0-mbstring -y
sudo apt-get install pkg-config -y
sudo apt-get install php-pear -y

# Reload PHP service

sudo service php7.0-fpm reload

# Install Redis

sudo apt-get install redis-server -y

# Create a directory for ssl configuration in Nginx

sudo mkdir /etc/nginx/ssl
cd /etc/nginx/ssl


export LC_ALL="en_US.UTF-8"

# Generate a self-signed certificate and private key - save them
# in the /etc/nginx/ssl directory, which we have already navigated to

sudo openssl req \
    -new \
    -newkey rsa:2048 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=inprojectvagrant.dev" \
    -keyout server.key \
    -out inprojectvagrant.dev.cert

# Copy the server block configuration file from our project root to Nginx configuration
# then enable the site and reload Nginx service

sudo cp /home/vagrant/inprojectvagrant/vagrant/dev-nginx-server-block /etc/nginx/sites-available/inprojectvagrant
sudo ln -s /etc/nginx/sites-available/inprojectvagrant /etc/nginx/sites-enabled
sudo service nginx reload


# These next four commands prepare us to install Mariadb - they can also be adapted for
# installation of MySQL as well

export LC_ALL="en_US.UTF-8"
export DEBIAN_FRONTEND=noninteractive

# Replace "secret" with your desired root password on both lines

debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password password secret'
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password_again password secret'
sudo apt-get install mariadb-server-5.5 -y

# Optionally create your project's database - or do any other things you'd like with
# the MySQL CLI

mysql -u root -psecret -e "CREATE DATABASE inprojectvagrant;"

# Install Composer

cd ~
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
export LC_ALL="en_US.UTF-8"

# Install Node.JS packages, NPM, update to latest version

sudo apt-get install nodejs -y
sudo apt-get install nodejs-legacy -y
sudo apt-get install npm -y
sudo apt-get install build-essential -y

# Install npm globally with "-g" flag

sudo npm install -g npm

# Clean NPM cache

sudo npm cache clean -f

# Update Node.JS to latest stable version

sudo npm install -g n
sudo n stable

# Install gulp-cli globally

sudo npm install --global gulp-cli