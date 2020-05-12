#!/usr/bin/env zsh

# set -euo
set -x

# kcom="$(cat ~/.zsh/k8s/k8s_alias | fzf | awk '{print $2}' | awk -F'=' '{print $1}')"
#
# writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

print -z "aws_sso"

