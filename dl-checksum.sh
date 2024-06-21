#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/docker/buildx/releases/download

dl()
{
    local app=$1
    local lchecksums=$2
    local ver=$3
    local os=$4
    local arch=$5
    local dotexe=${6:-}
    local platform="${os}-${arch}"
    local exe=${app}-v${ver}.${platform}${dotexe}

    # https://github.com/docker/buildx/releases/download/v0.12.0/buildx-v0.12.0.linux-arm64
    local url=$MIRROR/v$ver/$exe

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(egrep -e "${exe}\$" $lchecksums | awk '{print $1}')
}

dl_ver() {
    app=$1
    ver=$2
    printf "  '%s':\n" $ver
    local lchecksums="${DIR}/${app}-${ver}-checksums.txt"
    if [ ! -e $lchecksums ];
    then
        # https://github.com/docker/buildx/releases/download/v0.12.0/checksums.txt
        curl -sSLf -o $lchecksums "${MIRROR}/v${ver}/checksums.txt"
    fi

# unfortunately not in the checksum file! #shakefists
#    dl $app $lchecksums $ver darwin arm64
#    dl $app $lchecksums $ver darwin amd64
    dl $app $lchecksums $ver linux amd64
    dl $app $lchecksums $ver linux arm-v6
    dl $app $lchecksums $ver linux arm-v7
    dl $app $lchecksums $ver linux arm64
    dl $app $lchecksums $ver linux ppc64le
    dl $app $lchecksums $ver linux riscv64
    dl $app $lchecksums $ver linux s390x
    dl $app $lchecksums $ver windows amd64 .exe
    dl $app $lchecksums $ver windows arm64 .exe
}

dl_ver buildx ${1:-0.15.1}
