
	PS1='\[\033]0;Mahamodul Hasan Moon(win64):\w\007\]' # set window title
	PS1="$PS1"'\n'							# new line
	PS1="$PS1"'\[\e[30;47m\] [\A] '					# insert real-time clock
	PS1="$PS1"'\[\e[97;104m\] \u '					# insert user
	PS1="$PS1"'\[\e[30;46m\] (@\h) '				# insert @host
	PS1="$PS1"'\[\e[30;43m\] <\W> '					# insert current working directory
	
	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PS1="$PS1"'\[\e[97;45m\]'  # change color to cyan
			PS1="$PS1"'`__git_ps1`'   # bash function
		fi
	fi
	PS1="$PS1"'\[\033[0m\]'        # change color
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'$ '                 # prompt: always $
	
	MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc
