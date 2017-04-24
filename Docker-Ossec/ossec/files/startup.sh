#!/bin/bash
Region=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document |grep region | awk {'print $3'}| sed 's_"__g' | sed 's_,__g'`

                if [ "$Region" = "eu-west-1" ]
                then
                        zone="eu"
                elif [ "$Region" = "us-west-2" ]
                then
                        zone="usw2"
                elif [ "$Region" = "ap-southeast-1" ]
                then
                        zone="sg"
                elif [ "$Region" = "us-east-1" ]
                then
                        zone="india"
		elif [ "$Region" = "cn-north-1"]
                then
                        zone="cn"
                fi

sed -i "s/REGION/`echo ${zone}`/g" /etc/apache2/sites-available/ossec.domain.conf
