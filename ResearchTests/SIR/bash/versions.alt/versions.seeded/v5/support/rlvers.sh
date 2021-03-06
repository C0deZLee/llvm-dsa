#! /bin/sh
#
# rlvers.sh -- run a program that prints out the readline version number
#	       using locally-installed readline libraries
#

PROGNAME=`basename $0`
TDIR=/tmp/rlvers

# defaults
CC=cc
RL_LIBDIR=/usr/local/lib

TERMCAP_LIB="-ltermcap"

while [ $# -gt 0 ]; do
	case "$1" in
	-C)	shift ; CC="$1"; shift ;;
	-L)	shift ; RL_LIBDIR="$1" ; shift ;;
	-T)	shift ; TERMCAP_LIB="$1" ; shift ;;
	-v)	shift ; verbose=y ;;
	--)	shift ; break ;;
	*)	echo "${PROGNAME}: usage: $PROGNAME [-C compiler] [-L libdir] [-v]" >&2 ; exit 2;;
	esac
done

# if someone happened to install examples/rlversion, use it (it's not
# installed by default)
if test -f ${RL_LIBDIR}/rlversion ; then
	if [ -n "$verbose" ]; then
		echo "${PROGNAME}: using installed rlversion from ${RL_LIBDIR}/rlversion"
	fi
	v=`${RL_LIBDIR}/rlversion 2>/dev/null`
	case "$v" in
	unknown | "")	echo 0 ;;
	*)		echo "$v" ;;
	esac
	exit 0
fi

if [ -n "$verbose" ]; then
	echo "${PROGNAME}: using ${RL_LIBDIR} to find libreadline"
	echo "${PROGNAME}: attempting program compilation"
fi

# make $TDIR mode 0700
mkdir $TDIR || {
	echo "${PROGNAME}: ${TDIR}: file exists" >&2
	echo 0
	exit 1
}
chmod 700 $TDIR

trap 'rm -f $TDIR/rlvers $TDIR/rlvers.? ; rmdir $TDIR' 0 1 2 3 6 15

cat > $TDIR/rlvers.c << EOF
#include <stdio.h>
extern char *rl_library_version;

main()
{
	printf("%s\n", rl_library_version ? rl_library_version : "0");
	exit(0);
}
EOF

if eval ${CC} -L${RL_LIBDIR} -o $TDIR/rlvers $TDIR/rlvers.c -lreadline ${TERMCAP_LIB};
then
	v=`$TDIR/rlvers`
else
	if [ -n "$verbose" ] ; then
		echo "${PROGNAME}: compilation failed: status $?"
		echo "${PROGNAME}: using version 0"
	fi
	v=0
fi

case "$v" in
unknown | "")	echo 0 ;;
*)		echo "$v" ;;
esac

exit 0
