# https://wiki.archlinux.org/index.php/java#Better_font_rendering
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export _JAVA_OPTIONS=$_JAVA_OPTIONS:'-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export JAVA_FONTS=/usr/share/fonts/TTF

export GOPATH=~/.go

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/opt/kafka/bin
export PATH=$PATH:~/.local/opt/google-cloud-sdk/bin
export PATH=$PATH:~/.node_modules/bin
export PATH=$PATH:node_modules/.bin
export PATH=$PATH:/usr/lib/jvm/java-10-openjdk/bin
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
export PATH=$PATH:$GOPATH/bin

export EDITOR=nvim
export BROWSER=vivaldi-stable
export HOSTNAME=$(hostname)

export PYTHONBREAKPOINT=pdb.set_trace
export PYTHONWARNINGS="ignore"

# fyndiq
export SCHEMA_REGISTRY_URL=http://schema-registry-cp-schema-registry.kafka.svc.cluster.local:8081
export KAFKA_BROKERS=kafka-cp-kafka-headless.kafka.svc.cluster.local:9092

# z
export _Z_EXCLUDE_DIRS=".cache|.git|.venv|node_modules"

# imgur-screenshot
export XDG_PICTURES_DIR=/tmp
