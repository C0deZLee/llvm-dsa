OPTFLAGS="-sprtLnNum -prtLnNum"
TESTS="gcd welcome compression recursive"

_script()
{
	local cur
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	case $COMP_CWORD in
		1) COMPREPLY=( $(compgen -W "$OPTFLAGS" -- ${cur}) ) ;;
		2) COMPREPLY=( $(compgen -W "$TESTS" -- ${cur}) ) ;;
		*) COMPREPLY=( $(compgen -W "$(ls)" -- ${cur}) ) ;;
	esac

	return 0
}
complete -o nospace -F _script ./run.sh
