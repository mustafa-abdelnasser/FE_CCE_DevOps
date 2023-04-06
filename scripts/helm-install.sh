#!/bin/bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# auto complete
source <(helm completion bash)
echo 'source <(helm completion bash)' >>~/.bashrc

# helm alias h
alias h='helm'
complete -o default -F __start_helm h
echo 'alias h=helm' >>~/.bashrc
echo 'complete -o default -F __start_helm h' >>~/.bashrc
