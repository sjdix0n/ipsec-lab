#!/bin/zsh                                                                                                   

SESSIONNAME="vagrant"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ] 
 then
    tmux new-session -s $SESSIONNAME -n vagrant -d
    tmux new-window 
    tmux rename-window cpe1
    tmux new-window
    tmux rename-window cpe2
    tmux new-window
    tmux rename-window cpe3
    tmux new-window
    tmux rename-window site1
    tmux new-window
    tmux rename-window site2
    tmux new-window
    tmux rename-window site3
fi

tmux attach -t $SESSIONNAME
