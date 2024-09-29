export PS1='%~ % '

bindkey -s ^f "tmux-sessionizer\n"

function flutter-watch(){
  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \;\
  split-window -v \;\
  resize-pane -y 3 \;\
  send-keys 'npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \;\
  select-pane -t 0 \;
}

function adb-screenshot() {
 adb exec-out screencap -p > /tmp/screenshot.png && open /tmp/screenshot.png
}


source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.scripts/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
