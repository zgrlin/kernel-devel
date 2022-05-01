version="-"$(uname -r|sed 's/[0-9].[0-9].[0-9]-//' )
mkdir /tmp/build/
cd /tmp/build/
cp /boot/config-`uname -r` .config
cp /usr/src/linux-headers-5.10.0-13-amd64/Module.symvers .
cd /usr/src/linux
make EXTRAVERSION=$version O=/tmp/build oldconfig
make EXTRAVERSION=$version O=/tmp/build prepare
make EXTRAVERSION=$version O=/tmp/build outputmakefile
make EXTRAVERSION=$version O=/tmp/build archprepare
make EXTRAVERSION=$version O=/tmp/build modules SUBDIRS=scripts
