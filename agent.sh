#!/bin/bash
read -p "👉 请粘贴面板上的完整安装命令并回车: " FULL_CMD
[ -z "$FULL_CMD" ] && exit 1

CLEAN_CMD=${FULL_CMD//sudo /}
[[ "$CLEAN_CMD" != *" -- "* ]] && exit 1

ARGS="${CLEAN_CMD#* -- }"
eval "$CLEAN_CMD" > /dev/null 2>&1
nohup /opt/komari/agent $ARGS > /dev/null 2>&1 &