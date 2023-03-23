#!/usr/bin/env zsh

function lg(){
if [[ -e "$HOME/.secret/$1" ]] ; then

source "$HOME/.secret/$1"

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

