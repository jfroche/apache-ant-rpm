#!/bin/sh
version="1.8.3"
rm -rf BUILD RPMS SRPMS tmp || true
mkdir -p BUILD RPMS SRPMS SOURCES

if [ ! -f SOURCES/apache-ant-$version-bin.tar.gz ];
then
    wget "http://apache.mogo.be//ant/binaries/apache-ant-$version-bin.tar.gz" -O SOURCES/apache-ant-$version-bin.tar.gz
fi

rpmbuild -ba --define="_topdir $PWD" --define="_tmppath $PWD/tmp" --define="ver $version" apache-ant.spec
