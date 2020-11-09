# https://wiki.archlinux.org/index.php/java#Better_font_rendering
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export _JAVA_OPTIONS=$_JAVA_OPTIONS:'-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export JAVA_FONTS=/usr/share/fonts/TTF

export GOPATH=~/.go

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.gem/ruby/2.4.0/bin
export PATH=$PATH:~/.gem/ruby/2.3.0/bin
export PATH=$PATH:~/.gem/ruby/2.2.0/bin
export PATH=$PATH:~/.gem/ruby/2.5.0/bin
export PATH=$PATH:~/.bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/opt/kafka/bin
export PATH=$PATH:/opt/google-cloud-sdk/bin
export PATH=$PATH:~/.node_modules/bin
export PATH=$PATH:node_modules/.bin
export PATH=$PATH:/usr/lib/jvm/java-10-openjdk/bin
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/home/simon/.bin
export PATH=$PATH:/opt/Archi/
export PATH=$PATH:/opt/confluent/bin

export EDITOR=nvim
export BROWSER=chromium
export HOSTNAME=$(hostname)

export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECONFIG=$HOME/.kube/config

export PYTHONBREAKPOINT=pdb.set_trace
export PYTHONWARNINGS="ignore"

# Fyndiq
export SCHEMA_REGISTRY_URL=http://schema-registry-cp-schema-registry.kafka.svc.cluster.local:8081
export KAFKA_BROKERS=kafka-cp-kafka-headless.kafka.svc.cluster.local:9092

if [ -f /opt/google-cloud-sdk/path.zsh.inc ]; then
  source '/opt/google-cloud-sdk/path.zsh.inc'
fi

if [ -f /opt/google-cloud-sdk/completion.zsh.inc ]; then
  source '/opt/google-cloud-sdk/completion.zsh.inc'
fi

if [ -f $(dirname $0)/secrets.zsh ]; then
    source $(dirname $0)/secrets.zsh 2>/dev/null
fi

if [ -f /opt/azure-cli/az.completion ]; then
    # enable bash completion
    autoload bashcompinit && bashcompinit
    source '/opt/azure-cli/az.completion'
fi
