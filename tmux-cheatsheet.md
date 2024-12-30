Start tmux:
  $ tmux

reload config:
  tmux source ~/.config/tmux/tmux.conf

panes:
  new pane: <prefix> 
  zoom a pane: <prefix> z
  split pane vertically: <prefix> %
  split pane horizontally: <prefix> "
  switch pane: 
    1. <prefix> q <pane-id>
    2. <prefix> up/down/left/right arrow keys
  re-arrange pane for left: <prefix> { 
  re-arrange pane for right: <prefix> }
  pane to window: <prefix> !
  preview of sessions: <prefix> s
  preview of windows: <prefix> w
  attach to session: tmux attach -t <session-name> # this essentially opens that session
