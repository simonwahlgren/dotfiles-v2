# prepend/append new path to $PATH and make sure it's not a duplicate
typeset -U path
path+=$HOME/.local/bin
path+=$HOME/.local/opt/google-cloud-sdk/bin
path+=$HOME/.local/opt/kafka/bin
path+=$HOME/.local/opt/factorio/bin/x64
path+=$HOME/.local/share/gem/ruby/3.0.0/bin
path+=$HOME/.gem/ruby/3.0.0/bin
path+=$HOME/.krew/bin
path+=/usr/local/bin
path+=$HOME/.cargo/bin
path+=$HOME/go/bin
path=(node_modules/.bin $path)

# system
export EDITOR=nvim
export BROWSER=vivaldi-stable
export HOSTNAME=$(hostname)

# zsh
# a list of non-alphanumeric characters considered part of a word by the line editor
export WORDCHARS='*?[]~=&;!#$%^(){}'

# python
export PYTHONBREAKPOINT=pdb.set_trace
# export PYTHONWARNINGS="ignore"
export PYTHONDONTWRITEBYTECODE=1

# allow gcloud to access external packages
# https://cloud.google.com/iap/docs/using-tcp-forwarding#increasing_the_tcp_upload_bandwidth
export CLOUDSDK_PYTHON_SITEPACKAGES=1

# z
export _Z_EXCLUDE_DIRS=".cache|.git|.venv|node_modules"

# work
## CS
# export SCHEMA_REGISTRY_URL=http://schema-registry-cp-schema-registry.kafka.svc.cluster.local:8081
# export KAFKA_BROKERS=kafka-0-external.kafka.svc.cluster.local:9094
# export KAFKA_BOOTSTRAP_SERVERS=kafka-0-external.kafka.svc.cluster.local:9094
## Fyndiq
export SCHEMA_REGISTRY_URL=http://schema-registry-cp-schema-registry.kafka.svc.cluster.local:8081
export KAFKA_BROKERS=kafka-cp-kafka-headless.kafka.svc.cluster.local:9092
export KAFKA_BOOTSTRAP_SERVERS=kafka-cp-kafka-headless.kafka.svc.cluster.local:9092

# pyenv
export PYENV_ROOT=$HOME/.pyenv
path=($PYENV_ROOT/bin $path)
path=($PYENV_ROOT/shims $path)

# google cloud sdk
# otherwise it might use your local .venv which might not be compatible
export CLOUDSDK_PYTHON=$PYENV_ROOT/shims/python3
