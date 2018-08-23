FROM yannart/jboss-5.1.0.ga-jdk6

# Run JBoss
ENV JAVA_OPTS="-Xms512m -Xmx7168m -XX:PermSize=32m -XX:MaxPermSize=512m -Xss2m"

ENV APP_HOME /opt/jboss/server/default/deploy

CMD ["/opt/jboss/bin/run.sh", "-b", "0.0.0.0"]

EXPOSE 8080
# EXPOSE 8009