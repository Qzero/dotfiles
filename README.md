# 使用方法
必装：git vim zsh ohmyzsh tmux

### vim
install ctags ack

### zsh & oh my zsh
curl: 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

wget:
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

切换bash：chsh -s /bin/zsh

the fuck命令行纠错工具
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

### tmux & tpm
github:
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
