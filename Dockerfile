FROM registry-intl-vpc.ap-southeast-5.aliyuncs.com/dki-tools/java-tomcat:9 AS build
ENV TOMCATPATH=/opt/apache-tomcat-9.0.41
WORKDIR /tmp/ops

COPY OPS/ops-admin/ .
RUN apk add maven && \
    mvn -f pom.xml clean install && \
    rm -rf ${TOMCATPATH}/webapps/ROOT && \
    mv target/lmsadmin-0.0.1-SNAPSHOT ${TOMCATPATH}/webapps/ROOT && \
    mv target/lmsadmin-0.0.1-SNAPSHOT.war ${TOMCATPATH}/webapps/ROOT.war

FROM registry-intl-vpc.ap-southeast-5.aliyuncs.com/dki-tools/java-tomcat:9 AS runtime
ARG namespace
ENV TOMCATPATH=/opt/apache-tomcat-9.0.41
WORKDIR ${TOMCATPATH}/webapps/

RUN rm -rf ROOT
COPY --from=build ${TOMCATPATH}/webapps/ROOT ROOT
COPY --from=build ${TOMCATPATH}/webapps/ROOT.war .
