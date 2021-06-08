#!/bin/bash

jar_bucket=$1
jar_path=$2
jar_file=$3
s3_uri="s3://${jar_bucket}/${jar_path}${jar_file}"
dest_path="/usr/lib/spark/jars/${jar_file}"

sudo adduser user1

# Copy MLeap jars
sudo aws s3 cp "$s3_uri" "$dest_path"
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-avro_2.11/0.15.0/mleap-avro_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-base_2.11/0.15.0/mleap-base_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-core_2.11/0.15.0/mleap-core_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-spark-base_2.11/0.15.0/mleap-spark-base_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-spark-extension_2.11/0.15.0/mleap-spark-extension_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-spark_2.11/0.15.0/mleap-spark_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-runtime_2.11/0.15.0/mleap-runtime_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-tensor_2.11/0.15.0/mleap-tensor_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-tensorflow_2.11/0.15.0/mleap-tensorflow_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-xgboost-runtime_2.11/0.15.0/mleap-xgboost-runtime_2.11-0.15.0.jar -P /usr/lib/spark/jars/
#sudo wget https://repo1.maven.org/maven2/ml/combust/mleap/mleap-xgboost-spark_2.11/0.15.0/mleap-xgboost-spark_2.11-0.15.0.jar -P /usr/lib/spark/jars/

#install python modules
sleep 180
sudo /bin/easy_install pip
#sudo /usr/local/bin/pip3 install --upgrade pip
# shellcheck disable=SC2046
sudo rm -rf $(pip list -v | grep pyparsing | awk  '{print  $3"/pyparsing*"}')
sudo /usr/bin/python3 -m pip install -U pip requests jip
sudo /usr/bin/python3 -m pip install -U boto3 pandas numpy matplotlib scikit-learn mleap==0.15.0
