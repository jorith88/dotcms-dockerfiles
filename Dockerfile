FROM anapsix/alpine-java:8_jdk

ENV DOTCMS_HOME /opt/dotcms
ENV DOTCMS_VERSION 4.3.3
ENV TOMCAT_VERSION 8.0.18

RUN apk add --update bash curl && rm -rf /var/cache/apk/* \
    && mkdir -p $DOTCMS_HOME \
    && curl -O http://static.dotcms.com/versions/dotcms_$DOTCMS_VERSION.tar.gz \
    && tar xzf dotcms_$DOTCMS_VERSION.tar.gz -C $DOTCMS_HOME \
    && rm dotcms_$DOTCMS_VERSION.tar.gz \
    && chmod +x $DOTCMS_HOME/bin/*.sh \
    && chmod +x $DOTCMS_HOME/dotserver/tomcat-$TOMCAT_VERSION/bin/*.sh

ADD server.xml /opt/dotcms/dotserver/tomcat-8.0.18/conf/server.xml
ADD log4j2.xml /opt/dotcms/dotserver/tomcat-8.0.18/webapps/ROOT/WEB-INF/log4j/log4j2.xml

EXPOSE 8080 8009 8000

CMD ["/opt/dotcms/bin/startup.sh", "run"]
