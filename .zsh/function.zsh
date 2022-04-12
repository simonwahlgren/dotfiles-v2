function dotenv () {
  set -o allexport
  source $1
  set +o allexport
}

function kexec() {
    pod=$1; shift; kubectl exec -it $pod -- $@;
}

function kdebug() {
    deployment=$1
    shift
    container=${1:-app}
    echo "Replacing command for container: $container"
    kubectl patch deployments.apps $deployment -p '{"spec":{"template":{"spec":{"containers":[{"name":"'"$container"'","command":["tail", "-f", "/dev/null"]}]}}}}' 
}

function gcd() {
  topdir=$(git rev-parse --show-toplevel)
  if [[ $? -ne 0 ]]; then
    return 1
  fi
  cd "${topdir}/${1}"
}

function jwt_decode() {
  sed 's/\./\n/g' <<< $(cut -d. -f1,2 <<< $1) | base64 --decode | jq
}
