<?php

// only run if there is a file given
if ($argc < 2) {
    exit;
}

// escape spaces in file path
$file = $argv[1];
$file = str_replace(' ', '\ ', $file);

// helper function to run wezterm cli
function wez($command)
{
    return shell_exec("/opt/homebrew/bin/fish -c 'wezterm cli {$command}'");
}

// get all panes
$panes = wez("list --format json");
$panes = json_decode($panes);

// check if there is a pane running vim
$vimPane = array_filter($panes, function ($pane) {
    // check if the title either start with vim, nvim or with the shortcut .. (eg. ..config)
    return strpos($pane->title, 'vim') === 0 || strpos($pane->title, 'nvim') === 0 || strpos($pane->title, '..') === 0;
});
$vimPane = array_shift($vimPane);

// if there is a vim pane, open the file in a new tab
if (!is_null($vimPane)) {
    wez("send-text \"\\x1:tabnew\n:e {$file}\n\" --no-paste --pane-id {$vimPane->pane_id}");
    exit;
}

// check if there is a pane with the default title "~" (eg. WezTerm was started via applescript)
$homePane = array_filter($panes, function ($pane) {
    return $pane->title == '~';
});
$homePane = array_shift($homePane);

// if there is a pane with the default title, start vim with the file
if (!is_null($homePane)) {
    wez("send-text \"vim {$file}\n\" --no-paste --pane-id {$homePane->pane_id}");
    exit;
}

// nothing matching found, create new window and start vim with the file
$newPane = wez("spawn --new-window");
wez("send-text \"vim {$file}\n\" --no-paste --pane-id {$newPane}");
