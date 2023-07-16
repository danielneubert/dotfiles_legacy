<?php

if ($argc < 2) {
    exit;
}

$file = $argv[1];
$file = str_replace(' ', '\ ', $file);

function wez($command)
{
    return shell_exec("/opt/homebrew/bin/fish -c 'wezterm cli {$command}'");
}

$panes = wez("list --format json");
$panes = json_decode($panes);
$vimPane = array_filter($panes, function ($pane) {
    // check if the title either start with vim, nvim or with the shortcut .. (eg. ..config)
    return strpos($pane->title, 'vim') === 0 || strpos($pane->title, 'nvim') === 0 || strpos($pane->title, '..') === 0;
});
$vimPane = array_shift($vimPane);

if (!is_null($vimPane)) {
    wez("send-text \"\\x1:tabnew\n:e {$file}\n\" --no-paste --pane-id {$vimPane->pane_id}");
    exit;
}

$homePane = array_filter($panes, function ($pane) {
    // check if there is an "empty" window with the default title "~"
    return $pane->title == '~';
});
$homePane = array_shift($homePane);

if (!is_null($homePane)) {
    wez("send-text \"vim {$file}\n\" --no-paste --pane-id {$homePane->pane_id}");
    exit;
}

// nothing matching found, create new window
$newPane = wez("spawn --new-window");
wez("send-text \"vim {$file}\n\" --no-paste --pane-id {$newPane}");
