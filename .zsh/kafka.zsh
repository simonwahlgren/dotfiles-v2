function kafka-purge-topic() {
    set -x
    topic=$1
    kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --delete --topic $topic 2>/dev/null
    kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --create --topic $topic 2>/dev/null
}
