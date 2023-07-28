function kafka-purge-topic() {
    set -x
    topic=$1
    kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --delete --topic $topic 2>/dev/null
    kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --create --topic $topic 2>/dev/null
}

function kafka-delete-topic() {
    set -x
    topic=$1
    kafka-topics.sh --bootstrap-server $KAFKA_BROKERS --delete --topic $topic 2>/dev/null
}

function kafka-consumer-groups() {
    set -x
    command kafka-consumer-groups.sh \
      --bootstrap-server "$KAFKA_BROKERS" \
      $(if [ -n "$KAFKA_SASL_PASSWORD" ]; then
        echo "--command-config credentials/client.properties"
      fi) \
      $@
}

function kafka-topics() {
    set -x
    command kafka-topics.sh \
      --bootstrap-server "$KAFKA_BROKERS" \
      $(if [ -n "$KAFKA_SASL_PASSWORD" ]; then
        echo "--command-config credentials/client.properties"
      fi) \
      $@
}


function kafka-console-producer() {
    set -x
    command kafka-console-producer.sh \
      --bootstrap-server "$KAFKA_BROKERS" \
      $(if [ -n "$KAFKA_SASL_PASSWORD" ]; then
        echo "--producer.config credentials/client.properties"
      fi) \
      $@
}


function kafka-console-consumer() {
    set -x
    command kafka-console-consumer.sh \
      --bootstrap-server "$KAFKA_BROKERS" \
      $(if [ -n "$KAFKA_SASL_PASSWORD" ]; then
        echo "--producer.config credentials/client.properties"
      fi) \
      $@
}

function kafka-configs() {
    set -x
    command kafka-configs.sh \
      --bootstrap-server "$KAFKA_BROKERS" \
      $(if [ -n "$KAFKA_SASL_PASSWORD" ]; then
        echo "--command-config credentials/client.properties"
      fi) \
      $@
}
