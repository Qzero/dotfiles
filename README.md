# dotfiles 使用顺序
- 1，安装vim zsh & oh my zshrc
- 2，安装zplug
- 3，克隆dotfiles文件
- 4，创建软连接

## 安装

### zsh & oh my zsh

curl: sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

wget: sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

### zplug

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

## 备份
---

1，添加创建文件夹

2，移动文件创建软链接

 - 移动：mv [源文件或目录][目标文件或目录]

 - 软链接：ln -s [源文件或目录][目标文件或目录]

## 还原备份
---

1, 克隆git仓库

2，删除机器文件
rm -rf .vimrc .zshrc //首先删除自身机器上原有的dotfiles

3，软链接到机器
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.zshrc .zshrc

