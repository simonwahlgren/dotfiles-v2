function kafka-purge-topic() {
    topic=$1
    kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --delete --topic $topic
    kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --create --topic $topic
}
