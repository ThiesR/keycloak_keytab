java Ktab -k FILE:keycloak.keytab -a $1@DNSBEGO.DE $2 -n $3
java Ktab -k FILE:keycloak.keytab -d $1@DNSBEGO.DE -f -e 16 all
java Ktab -k FILE:keycloak.keytab -d $1@DNSBEGO.DE -f -e 17 all
java Ktab -k FILE:keycloak.keytab -d $1@DNSBEGO.DE -f -e 18 all
java Ktab -k FILE:keycloak.keytab -d $1@DNSBEGO.DE -f -e 19 all
java Ktab -k FILE:keycloak.keytab -d $1@DNSBEGO.DE -f -e 20 all
java Ktab -k FILE:keycloak.keytab -l -e