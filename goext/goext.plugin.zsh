if (( ${+commands[go]} )); then
    export PATH=$(go env GOPATH)/bin:$PATH
fi
 