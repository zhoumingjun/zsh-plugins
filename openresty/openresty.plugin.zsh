openrestydirs=("/usr/local/opt/openresty" )

FOUND_OPENRESTY=0
for openrestydir in $openrestydirs; do
    if [[ -d "${openrestydir}/nginx" ]]; then
        FOUND_OPENRESTY=1
        break
    fi
done

if [[ $FOUND_OPENRESTY -eq 1 ]]; then
    export OPENRESTY_HOME=${openrestydir}
    export PATH=${OPENRESTY_HOME}/nginx/sbin:$PATH
else
fi

unset openrestydir openrestydirs FOUND_OPENRESTY