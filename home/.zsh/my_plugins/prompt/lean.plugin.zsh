# lean prompt theme
# by Miek Gieben: https://github.com/miekg/lean
#
# Based on Pure by Sindre Sorhus: https://github.com/sindresorhus/pure
# Colors used: (see Vim's iceberg theme)
# 242 is the gray that is used.
# 110 is the blue.
# 150 is the yellow.
#
# MIT License

COLOR1=${PROMPT_LEAN_COLOR1-"242"}
COLOR2=${PROMPT_LEAN_COLOR2-"4"}
COLOR3=${PROMPT_LEAN_COLOR3-"150"}
COLOR4=${PROMPT_LEAN_COLOR4-"196"}
COLOR5=${PROMPT_LEAN_COLOR5-"132"}
COLOR6=${PROMPT_LEAN_COLOR6-"214"}
COLOR8=${PROMPT_LEAN_COLOR7-"74"}

PROMPT_LEAN_NOTITLE=${PROMPT_LEAN_NOTITLE-0}

# turns seconds into human readable time, 165392 => 1d 21h 56m 32s
prompt_lean_human_time() {
    local tmp=$1
    local days=$(( tmp / 60 / 60 / 24 ))
    local hours=$(( tmp / 60 / 60 % 24 ))
    local minutes=$(( tmp / 60 % 60 ))
    local seconds=$(( tmp % 60 ))
    (( $days > 0 )) && echo -n "${days}d "
    (( $hours > 0 )) && echo -n "${hours}h "
    (( $minutes > 0 )) && echo -n "${minutes}m "
    echo "${seconds}s "
}

# fastest possible way to check if repo is dirty
prompt_lean_git_dirty() {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    # check if it's dirty
    local umode="-uno" #|| local umode="-unormal"
    command test -n "$(git status --porcelain --ignore-submodules ${umode} 2>/dev/null | head -100)"

    (($? == 0)) && echo '+'
}

# displays the exec time of the last command if set threshold was exceeded
prompt_lean_cmd_exec_time() {
    local stop=$EPOCHSECONDS
    local start=${cmd_timestamp:-$stop}
    integer elapsed=$stop-$start
    (($elapsed > ${PROMPT_LEAN_CMD_MAX_EXEC_TIME:=5})) && prompt_lean_human_time $elapsed
}

prompt_lean_set_title() {
    # shows the current tty and dir and executed command in the title when a process is active
    print -Pn "\e]0;"
    print -Pn "%l %1d"
    print -rn ": $1"
    print -Pn "\a"
}

prompt_lean_preexec() {
    cmd_timestamp=$EPOCHSECONDS
    local lean_no_title=$PROMPT_LEAN_NOTITLE
    (($lean_no_title != 1)) && prompt_lean_set_title "$1"
    unset lean_no_title
}

prompt_lean_pwd() {
    local lean_path="`print -Pn '%~'`"
    print "$lean_path"
}

prompt_lean_precmd() {
    vcs_info
    rehash

    local jobs
    local prompt_lean_jobs
    unset jobs
    for a (${(k)jobstates}) {
        j=$jobstates[$a];i='${${(@s,:,)j}[2]}'
        jobs+=($a${i//[^+-]/})
    }
    # print with [ ] and comma separated
    prompt_lean_jobs=""
    [[ -n $jobs ]] && prompt_lean_jobs="%F{"$COLOR1"}["${(j:,:)jobs}"] "

    MODE_CURSOR_VICMD="#5C6370 blinking block"
    MODE_CURSOR_VIINS="#98C379 blinking bar"
    MODE_CURSOR_SEARCH="#C678DD steady underline"

    MODE_INDICATOR_VIINS='%F{15}[%F{7}I%F{15}]%f'
    MODE_INDICATOR_VICMD='%F{10}[%F{2}N%F{10}]%f'
    MODE_INDICATOR_REPLACE='%F{9}[%F{1}R%F{9}]%f'
    MODE_INDICATOR_SEARCH='%F{13}[%F{5}S%F{13}]%f'
    MODE_INDICATOR_VISUAL='%F{12}[%F{4}V%F{12}]%f'
    MODE_INDICATOR_VLINE='%F{12}[%F{4}V-L%F{12}]%f'

    setopt promptsubst
    local vcs_info_str='$vcs_info_msg_0_' # avoid https://github.com/njhartwell/pw3nage
    PROMPT="$prompt_lean_user%f@$prompt_lean_host%f:%F{"$COLOR2"}`prompt_lean_pwd`%F{"$COLOR1"}$vcs_info_str%F{"$COLOR4"}`prompt_lean_git_dirty`
${MODE_INDICATOR_PROMPT}%f`$PROMPT_LEAN_LEFT`%f%(?.%F{"$COLOR8"}.%B%F{203}%K{234})❯ %f%k%b"
    RPROMPT="%B%(?.%F{green}.%F{red})%?%f%b%{$fg[green]%} %F{"$COLOR3"}`prompt_lean_cmd_exec_time`%f[%*]%`$PROMPT_LEAN_RIGHT`"

    unset cmd_timestamp # reset value since `preexec` isn't always triggered
}

function zle-keymap-select {
    prompt_lean_precmd
    zle reset-prompt
}

prompt_lean_setup() {
    prompt_opts=(cr percent sp subst)

    zmodload zsh/datetime
    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    add-zsh-hook precmd prompt_lean_precmd
    add-zsh-hook preexec prompt_lean_preexec

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:git*' formats ' %b'
    zstyle ':vcs_info:git*' actionformats ' %b|%a'

    prompt_lean_host="%F{"$COLOR6"}%m%f"
    prompt_lean_user="%F{"$COLOR5"}%n%f"

    return 0
}

prompt_lean_setup "$@"
