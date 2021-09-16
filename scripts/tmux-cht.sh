#!/bin/sh
languages="golang nodejs javascript typescript cpp c lua rust python bash php css html pearl"
commands="find man tldr sed awk tr cp ls grep xargs rg ps mv kill lsof less head tail tar cp rm rename jq cat ssh cargo git git-worktree git-status git-commit git-rebase docker docker-compose stow chmod chown"

selected=`echo ${languages} ${commands} | tr ' ' '\n' | fzf`
if [ $? -ne 0 ]; then
	exit 0
fi

read -p "Enter Query: " query

echo ${languages} | grep -qs "${selected}"
if [ $? -eq 0 ]; then
	query=`echo ${query} | tr ' ' '+'`
	separator='/'
else
	separator='~'
fi

if [ ${query} -eq "" ]; then
	uri=${selected}
else
	uri=${selected}${separator}${query}
fi

tmux neww bash -c "curl -s cht.sh/${uri} | less -R"
