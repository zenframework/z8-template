#!/bin/bash

JAVA=java
#JAVA=/usr/lib/jvm/java-8-openjdk-amd64/bin/java

JAVA_OPTS="-Xmx2048M"
# Debug mode
#JAVA_OPTS="$JAVA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,address=9999,server=y,suspend=n"

#HOST=192.168.56.2
PORT=9080

HOME="$( cd "$(dirname "$0")/.." ; pwd -P )"
WORK="$HOME/work"
LOG="$HOME/log"
WEB="$HOME/web"
SRV_LIB="$HOME/lib"
WEB_LIB="$HOME/lib"

BOOT_CP="$SRV_LIB/org.zenframework.z8.boot-1.3.0-SNAPSHOT.jar"

SRV_CP="$SRV_LIB/servlet-api-3.1.0.jar\
:$SRV_LIB/jetty-http-9.2.20.v20161216.jar\
:$SRV_LIB/jetty-io-9.2.20.v20161216.jar\
:$SRV_LIB/jetty-server-9.2.20.v20161216.jar\
:$SRV_LIB/jetty-util-9.2.20.v20161216.jar"

WEB_CP="$HOME/z8-template.jar\
:$WEB_LIB/com.ibm.icu_58.2.0.v20170418-1837.jar\
:$WEB_LIB/com.lowagie.text_2.1.7.v201004222200.jar\
:$WEB_LIB/commons-cli-1.0.jar\
:$WEB_LIB/commons-fileupload-1.3.1.jar\
:$WEB_LIB/commons-io-2.2.jar\
:$WEB_LIB/commons-lang-2.1.jar\
:$WEB_LIB/dom4j-1.6.1.jar\
:$WEB_LIB/javax.wsdl_1.5.1.v201012040544.jar\
:$WEB_LIB/javax.xml_1.3.4.v201005080400.jar\
:$WEB_LIB/javax.xml.stream_1.0.1.v201004272200.jar\
:$WEB_LIB/jodconverter-core-3.0-beta-4-jahia2.jar\
:$WEB_LIB/juniversalchardet-1.0.3.jar\
:$WEB_LIB/log4j-1.2.17.jar\
:$WEB_LIB/mail-1.4.7.jar\
:$WEB_LIB/org.apache.batik.css_1.8.0.v20170214-1941.jar\
:$WEB_LIB/org.apache.batik.util_1.8.0.v20170214-1941.jar\
:$WEB_LIB/org.apache.commons.codec_1.9.0.v20170208-1614.jar\
:$WEB_LIB/org.apache.commons.logging_1.1.1.v201101211721.jar\
:$WEB_LIB/org.apache.poi_3.9.0.v201405241750.jar\
:$WEB_LIB/org.eclipse.birt.runtime_4.7.0-20170622.jar\
:$WEB_LIB/org.eclipse.core.runtime_3.13.0.v20170207-1030.jar\
:$WEB_LIB/org.eclipse.datatools.connectivity.oda_3.5.0.201603142002.jar\
:$WEB_LIB/org.eclipse.datatools.connectivity.oda.consumer_3.3.0.201603142002.jar\
:$WEB_LIB/org.eclipse.equinox.common_3.9.0.v20170207-1454.jar\
:$WEB_LIB/org.eclipse.equinox.registry_3.7.0.v20170222-1344.jar\
:$WEB_LIB/org.eclipse.osgi_3.12.0.v20170512-1932.jar\
:$WEB_LIB/org.mozilla.javascript_1.7.5.v201504281450.jar\
:$WEB_LIB/org.w3c.css.sac_1.3.1.v200903091627.jar\
:$WEB_LIB/org.zenframework.z8.auth-1.3.0-SNAPSHOT.jar\
:$WEB_LIB/org.zenframework.z8.interconnection-1.3.0-SNAPSHOT.jar\
:$WEB_LIB/org.zenframework.z8.lang-1.3.0-SNAPSHOT.jar\
:$WEB_LIB/org.zenframework.z8.oda.driver-1.3.0-SNAPSHOT.jar\
:$WEB_LIB/org.zenframework.z8.server-1.3.0-SNAPSHOT.jar\
:$WEB_LIB/org.zenframework.z8.servlet-1.3.0-SNAPSHOT.jar\
:$WEB_LIB/org.zenframework.z8.webserver-1.3.0-SNAPSHOT.jar\
:$WEB_LIB/servlet-api-3.1.0.jar\
:$WEB_LIB/mssql-jdbc-6.4.0.jre7.jar\
:$WEB_LIB/mssql-jdbc-6.4.0.jre8.jar\
:$WEB_LIB/ojdbc6.jar\
:$WEB_LIB/postgresql-42.0.0.jar\
:$WEB_LIB/jrtf-0.7.jar\
:$WEB_LIB/freemarker-2.3.16.jar\
:$WEB_LIB/jodreports-2.4.0.jar\
:$WEB_LIB/slf4j-api-1.6.1.jar\
:$WEB_LIB/xom-1.2.5.jar"

CP=$SRV_CP:$WEB_CP:$1

echo "HOME: $HOME"
echo "WORK: $WORK"

mkdir -p "$LOG"
mkdir -p "$WORK"

cd "$WORK"
$JAVA $JAVA_OPTS -Xbootclasspath/p:$BOOT_CP -cp $CP -Djava.rmi.server.hostname=$HOST -Dz8.webserver.port=$PORT -Dz8.webserver.webapp=$WEB org.zenframework.z8.server.engine.ServerMain -server webserver 1>$LOG/out.log 2>$LOG/err.log &