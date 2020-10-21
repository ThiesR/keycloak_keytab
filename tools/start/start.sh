#!/bin/bash
cd /opt/jboss/tools/ktab
./ktab.sh $KRB_PRINCINPAL $KRB_PWD $KRB_KVNO
/opt/jboss/keycloak/bin/standalone.sh -b 0.0.0.0