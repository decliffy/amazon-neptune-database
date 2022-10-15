#!/bin/bash
yum update -y

sudo amazon-linux-extras install -y java-openjdk11

sudo /usr/sbin/alternatives --auto java

cd /usr/local/share/applications

wget https://archive.apache.org/dist/tinkerpop/3.5.2/apache-tinkerpop-gremlin-console-3.5.2-bin.zip

unzip apache-tinkerpop-gremlin-console-3.5.2-bin.zip

sudo rm -f *.zip

cd apache-tinkerpop-gremlin-console-3.5.2/conf

sudo  bash -c 'cat <<EOF > neptune-remote.yaml
hosts: [your-neptune-endpoint]
port: 8182
connectionPool: { enableSsl: true }
serializer: { className: org.apache.tinkerpop.gremlin.driver.ser.GraphBinaryMessageSerializerV1,
              config: { serializeResultToString: true }}
EOF'






