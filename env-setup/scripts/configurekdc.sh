#!/bin/bash
#Add a principal to the KDC for the master node, using the master node's returned host name
sudo kadmin.local -q "ktadd -k /etc/krb5.keytab host/`hostname -f`"
#Declare an associative array of user names and passwords to add
declare -A arr
arr=([user1]=pwd1)
for i in ${!arr[@]}; do
    #Assign plain language variables for clarity
     name=${i}
     password=${arr[${i}]}

     # Create principal for sshuser in the master node and require a new password on first logon
     sudo kadmin.local -q "addprinc -pw $password +needchange $name"

     #Add user hdfs directory
     hdfs dfs -mkdir /user/$name

     #Change owner of user's hdfs directory to user
     hdfs dfs -chown $name:$name /user/$name

done
curl -sSL https://aws-ml-blog.s3.amazonaws.com/artifacts/ml-1954/movie_reviews.csv | hdfs dfs -put - movie_reviews.csv
hive  <<-EOF1
    DROP TABLE IF EXISTS movie_reviews;
    CREATE EXTERNAL TABLE IF NOT EXISTS movie_reviews ( review string, sentiment string)
        ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde';
    LOAD DATA INPATH 'movie_reviews.csv' OVERWRITE INTO TABLE movie_reviews;
EOF1
