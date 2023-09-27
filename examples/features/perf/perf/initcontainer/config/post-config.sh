#!/bin/bash

echo "#### Custom config start. ####"

cc="\n\n"
cc="       ${cc}<acceptors><acceptor name=\"artemis\">tcp://0.0.0.0:61616?protocols=CORE,AMQP,STOMP,HORNETQ,MQTT,OPENWIRE;anycastPrefix=jms.topic.;multicastPrefix=/topic/;tcpSendBufferSize=1048576;tcpReceiveBufferSize=1048576;useEpoll=true;amqpCredits=1000;amqpMinCredits=300</acceptor></acceptors>"
cc="       ${cc}\n\n"

sed -i '/<acceptors>/,/<\/acceptors>/d' ${CONFIG_INSTANCE_DIR}/etc/broker.xml

sed -i "s|  </connectors>| </connectors> ${cc} |g" ${CONFIG_INSTANCE_DIR}/etc/broker.xml

echo "#### Custom config done. ####"