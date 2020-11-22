function dotenv () {
  set -o allexport
  source $1
  set +o allexport
}

function kexec() {
    pod=$1; shift; kubectl exec -it $pod -- $@;
}

function gcd() {
  topdir=$(git rev-parse --show-toplevel)
  if [[ $? -ne 0 ]]; then
    return 1
  fi
  cd "${topdir}/${1}"
}
