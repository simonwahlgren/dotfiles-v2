function k8s_pod_resources() {
  namespace="${1:-default}"
  columns="\
    NAME:.metadata.name,\
    CPU(Req):.spec.containers[*].resources.requests.cpu,\
    MEM(Req):.spec.containers[*].resources.requests.memory,\
    CPU(Lim):.spec.containers[*].resources.limits.cpu,\
    MEM(Lim):.spec.containers[*].resources.limits.memory"
  resources=$(kubectl -n $namespace get pod -o custom-columns=$(echo $columns | tr -d ' '))
  usage=$(kubectl -n $namespace top pods)
  join --nocheck-order <(echo "$resources") <(echo "$usage") | column -t
}

function k8s_node_resources() {
  columns="\
    NAME:.metadata.name,\
    CPU(Cap):.status.capacity.cpu,\
    MEM(Cap):.status.capacity.memory,\
    CPU(Alloc):.status.allocatable.cpu,\
    MEM(Alloc):.status.allocatable.memory"
  resources=$(kubectl get node -o custom-columns=$(echo $columns | tr -d ' '))
  usage=$(kubectl top node)
  # TODO: get Allocated resources from `kubectl describe node <node>`
  join --nocheck-order <(echo "$resources") <(echo "$usage") | column -t
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

bindkey -s '^o' 'kubectx\n'
