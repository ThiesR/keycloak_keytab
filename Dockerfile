FROM adoptopenjdk:11.0.8_10-jdk-hotspot

ARG keycloak_version=11.0.2
ARG keycloak_admin_user=admin
ARG keycloak_admin_passwd=start

ADD keycloak-$keycloak_version.tar /opt/jboss
RUN mv /opt/jboss/keycloak-${keycloak_version} /opt/jboss/keycloak
RUN /opt/jboss/keycloak/bin/add-user-keycloak.sh -r master -u ${keycloak_admin_user} -p ${keycloak_admin_passwd}

# provide ktab manually
ADD tools /opt/jboss/tools

# build Ktab
RUN javac --add-exports java.security.jgss/sun.security.krb5=ALL-UNNAMED \
          --add-exports java.security.jgss/sun.security.krb5.internal=ALL-UNNAMED \
          --add-exports java.security.jgss/sun.security.krb5.internal.ktab=ALL-UNNAMED \
          --add-exports java.security.jgss/sun.security.krb5.internal.crypto=ALL-UNNAMED \
          /opt/jboss/tools/ktab/Ktab.java

RUN chmod +x /opt/jboss/tools/ktab/ktab.sh
RUN chmod +x /opt/jboss/tools/start/start.sh

ENTRYPOINT [ "/opt/jboss/tools/start/start.sh" ]