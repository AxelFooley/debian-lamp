#!/bin/bash

TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`
PASSWD=`pwgen -s 8 1`

# MySQL root password setup

echo "$TIMESTAMP => Setting MySQL root password"

/usr/bin/mysqld_safe &> /dev/null &

echo -n "$TIMESTAMP => Waiting for MySQL to start"

TEST=1
while [[ $TEST = 1 ]]
do
	echo -n "."
	sleep 1
	mysql -uroot -e "status" > /dev/null
	TEST=$?
done
echo
mysqladmin -u root password $PASSWD

while [[ $? != 0 ]]
do
	sleep 0.1
done

echo "$TIMESTAMP => Done!"
cat << EOF
	+-------------------------------------------------------+
	|	MySQL root password:				|
	|		$PASSWD				|
	|							|
	| 	You can connect to this MySQL server with:	|
	| 	mysql -u root -p$PASSWD			|
	|							|
	|	Pro Tip: Create a .my.cnf 			|
	|	inside /root and paste this content		|
	|	to be able to login into MySQL simply		|
	|	launching "mysql".				|
	|							|
	|	[client]					|
	|	user = root					|
	|	password = $PASSWD				|
	+-------------------------------------------------------+
EOF

mysqladmin -uroot -p$PASSWD shutdown

# Fix Apache2 "Could not reliably determine the server's fully qualified domain name" warning
echo "ServerName localhost" > /etc/apache2/conf.d/servername
