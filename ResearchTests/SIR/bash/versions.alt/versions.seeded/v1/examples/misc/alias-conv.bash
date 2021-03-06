#! /bin/bash
#
# alias-conv.sh - convert csh aliases to bash aliases and functions
#
# usage: alias-conv.sh
#
# Chet Ramey
# chet@po.cwru.edu
#
trap 'rm -f /tmp/cb$$.?' 0 1 2 3 6 15

T=$'\t'

cat << \EOF >/tmp/cb$$.1
mkalias ()
{
	if [ "x$2" = "x" ]; then
		echo alias ${1}="''"
	elif echo "$2" | egrep -s '(\!|#)' >/dev/null 2>&1; then
		comm=$(echo $2 | sed  's/\!\*/"$\@"/g
				      s/\!:\([1-9]\)/"$\1"/g
			              s/#/\#/g')
		echo $1 \(\) "{" command "$comm"  "; }"
	else
		echo alias ${1}=\'$(echo "${2}" | sed "s:':'\\\\'':")\'
	fi
}
EOF

sed "s/^\([a-zA-Z0-9_-]*\)$T\(.*\)$/mkalias \1 '\2'/" >>/tmp/cb$$.1

$BASH /tmp/cb$$.1 | sed -e 's/\$cwd/\$PWD/g' \
		     -e 's/\$term/\$TERM/g' \
		     -e 's/\$home/\$HOME/g' \
		     -e 's/\$user/\$USER/g' \
		     -e 's/\$prompt/\$PS1/g'

exit 0
