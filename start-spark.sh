export IMAGE="usgseros/lcmap-spark:1.1.0-develop"
export MASTER="mesos://zk://localhost:2181/mesos"
export MESOS_PRINCIPAL=<mesos-principal>
export MESOS_SECRET=<mesos-secret>
export MESOS_ROLE=<mesos-role>

docker run -it --rm --net host \
           -e LIBPROCESS_SSL_ENABLED="0" \
           -e LIBPROCESS_SSL_SUPPORT_DOWNGRADE="1" \
           -e LIBPROCESS_SSL_VERIFY_CERT="0" \
           -e LIBPROCESS_SSL_ENABLE_SSL_V3="0" \
           -e LIBPROCESS_SSL_ENABLE_TLS_V1_0="0" \
           -e LIBPROCESS_SSL_ENABLE_TLS_V1_1="0" \
           -e LIBPROCESS_SSL_ENABLE_TLS_V1_2="0" \
           -e LIBPROCESS_SSL_CIPHERS="" \
           -e LIBPROCESS_SSL_CERT_FILE="" \
           -e LIBPROCESS_SSL_KEY_FILE="" \
           -e LIBPROCESS_SSL_CA_FILE="" \
           -e LIBPROCESS_SSL_CA_DIR="" \
           -e LIBPROCESS_SSL_ECDH_CURVE="" \
           -e LIBPROCESS_SSL_REQUIRE_CERT="0" \
           $IMAGE \
           pyspark --master $MASTER \
                   --total-executor-cores 2 \
                   --driver-memory 1024m \
                   --executor-memory 1024m \
                   --conf spark.app.name=$USER:pyspark \
                   --conf spark.driver.host=$HOSTNAME \
                   --conf spark.mesos.principal=$MESOS_PRINCIPAL \
                   --conf spark.mesos.secret=$MESOS_SECRET \
                   --conf spark.mesos.role=$MESOS_ROLE \
                   --conf spark.mesos.executor.docker.image=$IMAGE \
                   --conf spark.mesos.executor.docker.forcePullImage='false' \
                   --conf spark.mesos.task.labels=$USER:demo \
                   --conf spark.serializer='org.apache.spark.serializer.KryoSerializer' \
                   --conf spark.python.worker.memory='1g'
