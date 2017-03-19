#########################################################################
# File Name: SyncVimrcConfig.sh
# Author: donald.zhuang
# Email: 1034894966@qq.com
# Created Time: Sun 05 Mar 2017 09:34:59 AM CST
#########################################################################
#!/bin/bash
LOCAL_PATH=$(pwd)
if [ -f "~/.vimrc" ]; then
	mv ~/.vimrc ~/.vimrc_bk
fi
cp $LOCAL_PATH/vimrc ~/.vimrc
