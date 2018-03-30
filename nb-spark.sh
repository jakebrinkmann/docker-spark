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
           -e IMAGE=$IMAGE \
           -e MASTER=$MASTER \
           -e MESOS_PRINCIPAL=$MESOS_PRINCIPAL \
           -e MESOS_SECRET=$MESOS_SECRET \
           -e MESOS_ROLE=$MESOS_ROLE \
           $IMAGE \
           jupyter-notebook --ip='0.0.0.0'
