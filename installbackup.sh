#Mac重装系统后恢复安装软件脚本
#!/bin/bash

# 设置变量
DOTFILES_DIR="$HOME/dotfiles"

# 安装 Homebrew（如果尚未安装）
if ! command -v brew &> /dev/null; then
    echo "安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc 
    ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc  # 添加 .zshrc 软连接
    source ~/.zshrc
else
    echo "Homebrew 已安装。"
fi

# 检查 dotfiles 目录是否存在
if [ -d "$DOTFILES_DIR" ]; then
    echo "找到 dotfiles 目录，开始配置..."
    cd "$DOTFILES_DIR"

    # 安装 dotfiles 中的配置
    if [ -f "installbackup.sh" ]; then
        echo "运行 dotfiles 安装脚本..."
        ./install.sh
    else
        echo "未找到 installbackup.sh 脚本，手动创建符号链接..."
        # 手动创建符号链接
        ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc  # 添加 .vimrc 软连接
        ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
        # 添加更多配置文件...
    fi
else
    echo "未找到 dotfiles 目录，跳过配置。"
fi

# 通过brewfile恢复安装程序
brew install mas
brew bundle --file="~/dotfiles/.brewfile"

# 设置 macOS 系统偏好（可选）
echo "设置 macOS 系统偏好..."
# 禁用自动更正
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# 显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder

# 完成
echo "系统配置完成！请重启终端或系统以应用所有更改。"