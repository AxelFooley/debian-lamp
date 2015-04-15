# Debian LAMP Docker Image #

This is *NOT* an official Debian image (nor related to Apache Software Foundation or anything).

This is a full LAMP stack Docker Image based on Debian Stable and running with the latest PHP version provided by [Dotdeb Repositories](https://www.dotdeb.org/tag/php5/), and Percona MySQL Server (for better performances).

Current installed versions:
	1.  OS: Debian Wheezy
	2.  PHP: 5.6.7
	3.  Percona: 5.6.23
	4.  Apache: 2.2.22

## Usage ##

Get the image by pulling it:

`docker pull axelfooley/debian-lamp`

Run the container:

`docker run -d -p 80:80 -p 3306:3306 axelfooley/debian-lamp`

## Some notes ##

### MySQL Password ###

The root MySQL password will be set up automagically and randomically at startup, to see what password has been set follow the container's logs.

`docker logs -f $container_id 

### PHP Application ###

This image is intended to provide a pure plain LAMP development environment, therefore it comes without any kind of pre installed PHP application.

Connect to the container and setup your dev application on your own:

`docker exec -ti $container_id /bin/bash`
