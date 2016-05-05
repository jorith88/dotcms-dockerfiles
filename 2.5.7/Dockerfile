FROM openjdk:7-jdk-alpine

ENV DOTCMS_ROOT /opt/dotcms
ENV DOTCMS_HOME /opt/dotcms/dotserver
ENV DOTCMS_VERSION 2.5.7

RUN apk add --update curl && rm -rf /var/cache/apk/* \
    && mkdir -p $DOTCMS_ROOT \
    && curl -O http://dotcms.com/physical_downloads/release_builds/dotcms_$DOTCMS_VERSION.tar.gz \
    && tar xzf dotcms_$DOTCMS_VERSION.tar.gz -C $DOTCMS_ROOT \
    && rm dotcms_$DOTCMS_VERSION.tar.gz \
    && chmod +x $DOTCMS_ROOT/dotserver/bin/*.sh \
    && chmod +x $DOTCMS_ROOT/dotserver/tomcat/bin/*.sh

ADD log4j.xml /opt/dotcms/dotserver/tomcat/lib/log4j.xml

EXPOSE 80 8009 8000

WORKDIR /opt/dotcms/dotserver

CMD ["/opt/dotcms/dotserver/bin/startup.sh", "run"]