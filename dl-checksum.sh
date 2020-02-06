#!/usr/bin/env sh
#set -x
DIR=~/Downloads
MIRROR=https://gitlab-docker-machine-downloads.s3.amazonaws.com

dl()
{
    local ver=$1
    local platform_suffix=$2
    local platform=$3
    local dotexe=${4:-}
    local rfilename=docker-machine${platform_suffix}${dotexe}
    local lfilename=docker-machine-${platform}${dotexe}
    local url=$MIRROR/$ver/$rfilename
    local lfile=$DIR/$lfilename

    if [ ! -e $lfile ]; then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver()
{
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver -Darwin-x86_64 Darwin-x86_64
    dl $ver '' Linux-x86_64
    dl $ver -Windows-x86_64 Windows-x86_64 .exe
}


dl_ver ${1:-v0.16.2-gitlab.3}
