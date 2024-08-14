#!/bin/bash

usage()
{
    cat <<EOF
Usage: ${0##*/} [option]
  Options:
    --i3            Set up i3 as the default window manager
    --remove-i3     Set window manager back to XFCE defaults
    --no-zmap       Don't install zmap asset inventory
    --help          Display this message

EOF
exit 0
}

# parse arguments
while :
do
    case $1 in
        i3|-i3|--i3)
            install_i3=true;
            ;;
        remove-i3|-remove-i3|--remove-i3)
            remove_i3=true;
            ;;
        no-zmap|-no-zmap|--no-zmap)
            no_zmap=true;
            ;;
        -h|--help|help)
            usage
            ;;
        *)
            break
    esac
    shift
done

# make sure we're root
if [ "$HOME" != "/root" ]
then
    printf "Please run while logged in as root\n"
    exit 1
fi

# fix bashrc
cp /root/.bashrc /root/.bashrc.bak
cp "/home/$(fgrep 1000:1000 /etc/passwd | cut -d: -f1)/.bashrc" /root/.bashrc
. /root/.bashrc

# enable command aliasing
shopt -s expand_aliases

# skip prompts in apt-upgrade, etc.
export DEBIAN_FRONTEND=noninteractive
alias apt-get='yes "" | apt-get -o Dpkg::Options::="--force-confdef" -y'
apt-get update

# make sure Downloads folder exists
mkdir -p ~/Downloads 2>/dev/null
