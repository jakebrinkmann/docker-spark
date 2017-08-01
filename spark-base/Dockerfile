FROM centos:7

WORKDIR /opt
RUN yum groupinstall -y "Development Tools" && \
	yum clean all

## Install JAVA JDK 1.8.0
ENV JAVA_HOME "/usr/local/java"
RUN curl -LO -H "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz && \
	tar -zxf jdk-8u131-linux-x64.tar.gz && \
	rm jdk-8u131-linux-x64.tar.gz && \
	mv jdk1.8.0_131 $JAVA_HOME
ENV PATH="${PATH}:${JAVA_HOME}/bin"

## Install HADOOP 2.8.0
RUN groupadd hadoop
RUN useradd -d /home/hadoop -g hadoop -m hadoop
ENV HADOOP_HOME="/usr/local/hadoop"
RUN curl -O "http://apache.claz.org/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz" && \
	tar -zxf hadoop-2.8.0.tar.gz && \ 
	mv hadoop-2.8.0 $HADOOP_HOME && \
	rm -Rf $HADOOP_HOME/share/doc && \
	chown -R hadoop:hadoop $HADOOP_HOME && \
	rm hadoop-2.8.0.tar.gz
ENV PATH="${PATH}:${HADOOP_HOME}/bin"

# Install SPARK 2.20.0 (for hadoop 2.7)
ENV SPARK_HOME="/usr/local/spark"
RUN curl -O https://archive.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz && \
        tar -zxf spark-2.2.0-bin-hadoop2.7.tgz && \
        mv spark-2.2.0-bin-hadoop2.7 $SPARK_HOME && \
	rm -Rf spark-2.2.0-bin-hadoop2.7.tgz
ENV PATH="${PATH}:${SPARK_HOME}/bin"

USER hadoop
WORKDIR /home/hadoop
ENTRYPOINT ["spark-shell"]

