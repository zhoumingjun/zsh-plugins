#!/usr/bin/env zsh

function lg(){
if [[ -e "$HOME/.config/secrets/login_$1.gpg" ]] ; then

eval $(gpg -q --for-your-eyes-only --no-tty -d "$HOME/.config/secrets/login_$1.gpg")

code=`oathtool --totp --base32 -d6 $OATH_SECRET`

expect <(cat <<EOD
spawn ssh $OPTIONS $JUMPER_SERVER

expect  "*password:"
send "$AD_SECRET\r"

expect "*auth]:"
send "$code\r"


expect "Opt>"
send "$2\r"
interact

EOD
)
fi

}

