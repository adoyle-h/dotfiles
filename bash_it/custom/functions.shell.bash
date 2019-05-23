bashman () { man bash | less -p "^       $1 "; }
alias manbash=bashman

gitshow() {
  local out shas sha q k
  while out=$(
      git log --left-right --graph --format="%C(auto)%d %h%Creset% s %C(68)%ar %C(ul 117)%aN|%cN%Creset" "$@" |
      fzf --no-sort --reverse --query="$q" --expect=ctrl-i --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = ctrl-i ]; then
      git diff --color=always "$shas" | less -R
    else
      for sha in $shas; do
        git show --color=always "$sha" | less -R
      done
    fi
  done
}
