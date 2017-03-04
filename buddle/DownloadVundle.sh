#########################################################################
# File Name: DownloadVundle.sh
# Author: donald.zhuang
# Email: 1034894966@qq.com
# Created Time: Sat 04 Mar 2017 10:59:02 AM CST
#########################################################################
#!/bin/bash
LOCAL_PATH=$(pwd)
VUNDLE_GIT_FOLDER="$LOCAL_PATH/Vundle.vim"

if [ -d "$VUNDLE_GIT_FOLDER/.git" ]; then
	cd $VUNDLE_GIT_FOLDER
	git pull
else
	if [ -d "$VUNDLE_GIT_FOLDER" ]; then
		rm -rf $VUNDLE_GIT_FOLDER
		mkdir -p $VUNDLE_GIT_FOLDER
	fi
	git clone http://github.com/VundleVim/Vundle.vim.git $VUNDLE_GIT_FOLDER 
fi


