#!/bin/bash

set -e
set -x

name=slurm-spank-lua

VERSION=`grep "Version:.*[0-9]" $name.spec | tr -s " " |  awk '{print $2;}'`

rm -Rf BUILD SOURCES SPECS SRPMS RPMS BUILDROOT
mkdir -p BUILD SOURCES SPECS SRPMS RPMS BUILDROOT

git archive --format=tar.gz -o "SOURCES/$name-${VERSION}.tar.gz" --prefix="$name-${VERSION}/" HEAD
cp $name.spec "SPECS"

rpmbuild --define "_topdir $PWD" -ba SPECS/$name.spec

