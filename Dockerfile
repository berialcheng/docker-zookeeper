FROM centos:latest

MAINTAINER Cheng "berialcheng@gmail.com"

RUN yum install -y vim git java-1.7.0-openjdk.x86_64 && yum clean all
RUN curl -fL http://apache.mirror.digitalpacific.com.au/zookeeper/stable/zookeeper-3.4.6.tar.gz | tar xzf - -C /opt && \
mv /opt/zookeeper-3.4.6 /opt/zookeeper

RUN cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

VOLUME /tmp/zookeeper

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 2181

CMD ["/opt/zookeeper/bin/zkServer.sh", "start"]