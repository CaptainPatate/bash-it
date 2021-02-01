alias sshadd='ssh-add -t $((3*3600))'
alias bashnorc='bash --noprofile --norc'

# CDs
alias cdworld='cd ~/travail/backmarket/world'
alias cdworldmaster='cd ~/travail/backmarket/world/world-master'
alias cdpold='cd ~/travail/backmarket/pold'
alias cdpoldmaster='cd ~/travail/backmarket/pold/pold-master'
alias cddoorman='cd ~/travail/backmarket/doorman'
alias cddoormandev='cd ~/travail/backmarket/doorman/doorman-dev'
alias cdken='cd ~/go/src/github.com/BackMarket/ken'

# Emacs
alias edit-aliases='ecn ~/.bash_it/aliases/custom.aliases.bash'
alias ecn='emacsclient -n'
alias magit='emacsclient -n -e \(magit-status\)'

# Terraform
alias tg-landscape='terragrunt plan | podman run -i --rm terraform-landscape'
alias reload-aliases='source ~/.bash_it/aliases/custom.aliases.bash'

# Kubernetes
alias k="kubectl \${KUBE_CTX:+ --context} \$KUBE_CTX \${KUBE_NS:+ --namespace} \$KUBE_NS" # override tsh context via .envrc
alias kawsid="kubectl \${KUBE_CTX:+ --context} \$KUBE_CTX \${KUBE_NS:+ --namespace} \$KUBE_NS get no -ocustom-columns=NAME:.metadata.name,AWS:.spec.providerID"
alias kgetns=$'kubectl get ns -oname | awk \'{split($0,a,\"/\"); print a[2]}\''
alias kexec='function _kexec(){ kubectl exec -t $(kubectl get po -lservice=$1 -ojsonpath="{.items[0].metadata.name}") -- $2; }; _kexec'
alias kfoo='function _kfoo(){ echo "kubectl exec -t $(kubectl get po -lservice=$1 -ojsonpath={.items[0].metadata.name}) -- $2;" }; _kfoo'
