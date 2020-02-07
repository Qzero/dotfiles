# 使用方法
必装：git vim zsh ohmyzsh tmux

### vim
install ctags ack

### zsh & oh my zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

切换bash：chsh -s /bin/zsh

### tmux & tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# 仓库地址
https://github.com/junegunn/vim-plug

## 备份&还原

### 备份
- 1，创建目标文件夹
- 2，移动文件创建软链接
    - 移动：mv [源文件或目录][目标文件或目录]
    - 软链接：ln -s [源文件或目录][目标文件或目录]

### 还原
- 1, 克隆git仓库
- 2，删除隐藏文件
    - rm -rf dotfiles
- 3，创建软连接
    - ln -s dotfiles/.zshrc .zshrc
