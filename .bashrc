# common
source /usr/share/bash-completion/bash_completion
complete -C "/usr/local/bin/aws_completer" aws
source <(kubectl completion bash)
complete -F __start_kubectl k
source <(helm completion bash)
alias k=kubectl