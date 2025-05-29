#!/bin/sh
#
# ,run-build.sh -- run build.sh with sensible defaults
#
[ $# -lt 2 ] && { echo 1>&2 "usage: $0 machine args..."; exit 1; }
scriptname="$(basename $0)"
# log the invocation.  note the TAB
echo "$(date +%FT%T)	${scriptname}" "$@" >> "${scriptname}.log"
OBJ=${TD:-..}/obj
# Note that the default -j${NCPU} can be overridden with a "-jN" arg.
# In other words: the last "-jN" passed to build.sh is authoritative.
NCPU=$(( $(nproc) + 2 ))
MACHINE=$1; shift
exec ./build.sh -j${NCPU} -U -m ${MACHINE} -T ${OBJ}/tools \
	-O "${OBJ}/obj.${MACHINE}" -D "${OBJ}/destdir.${MACHINE}" \
	-R "${OBJ}/releasedir.${MACHINE}" "$@"
