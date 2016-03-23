FROM jboss/wildfly:9.0.2.Final

ENV KEYCLOAK_VERSION 1.9.1.Final
ENV KEYCLOAK_REALM to_be_provided
ENV KEYCLOAK_REALM_PUBLIC_KEY to_be_provided
ENV KEYCLOAK_AUTH_SERVER_URL to_be_provided

WORKDIR /opt/jboss/wildfly

RUN curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-$KEYCLOAK_VERSION.tar.gz | tar zx

USER root

ADD augeas.commands /opt/jboss/wildfly
RUN augtool -LA -e -f /opt/jboss/wildfly/augeas.commands

USER jboss

# This will boot WildFly in the standalone mode, bind to all interface and set keycloak system properties
CMD ["sh", "-c", "/opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -Dkeycloak.realm=${KEYCLOAK_REALM} -Dkeycloak.realm.public.key=${KEYCLOAK_REALM_PUBLIC_KEY} -Dkeycloak.auth.server.url=${KEYCLOAK_AUTH_SERVER_URL}"]
