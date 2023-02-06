#!/usr/bin/env sh
#set -x
DIR=~/Downloads
MIRROR=https://gitlab-docker-machine-downloads.s3.amazonaws.com

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local dotexe=${4:-}
    local platform="${os}-${arch}"
    local filename=
    local url=$MIRROR/$ver/docker-machine-${platform}${dotexe}
    local lfile=$DIR/docker-machine-${ver}-${platform}${dotexe}

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver()
{
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver Darwin x86_64
    dl $ver Linux x86_64
    dl $ver Windows x86_64 .exe
}

dl_ver v0.16.2-gitlab.8
dl_ver v0.16.2-gitlab.9
dl_ver v0.16.2-gitlab.10
dl_ver v0.16.2-gitlab.11
dl_ver v0.16.2-gitlab.12
dl_ver v0.16.2-gitlab.13
dl_ver v0.16.2-gitlab.15
dl_ver v0.16.2-gitlab.18
dl_ver ${1:-v0.16.2-gitlab.19}
