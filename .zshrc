# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# DISABLE_UPDATE_PROMPT=true
# DISABLE_AUTO_UPDATE=false

# # Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

# # User configuration
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# # export MANPATH="/usr/local/man:$MANPATH"

# # ssh
# # export SSH_KEY_PATH="~/.ssh/dsa_id"

# # fzf config, must "brew install fzf" first
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # autojump config, brew install autojump
# [[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # install zplug, plugin manager for zsh, https://github.com/zplug/zplug
# # curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# # zplug configruation
# if [[ ! -d "${ZPLUG_HOME}" ]]; then
  # if [[ ! -d ~/.zplug ]]; then
    # git clone https://github.com/zplug/zplug ~/.zplug
    # # If we can't get zplug, it'll be a very sobering shell experience. To at
    # # least complete the sourcing of this file, we'll define an always-false
    # # returning zplug function.
    # if [[ $? != 0 ]]; then
      # function zplug() {
        # return 1
      # }
    # fi
  # fi
  # export ZPLUG_HOME=~/.zplug
# fi

# if [[ -d "${ZPLUG_HOME}" ]]; then
  # source "${ZPLUG_HOME}/init.zsh"
# fi
# zplug 'plugins/git', from:oh-my-zsh, if:'which git'
# zplug 'romkatv/powerlevel10k', as:theme, depth:1
# zplug "plugins/vi-mode", from:oh-my-zsh
# zplug 'zsh-users/zsh-autosuggestions'
# zplug 'zsh-users/zsh-completions', defer:2
# zplug 'zsh-users/zsh-history-substring-search'
# zplug 'zsh-users/zsh-syntax-highlighting', defer:2
# zplug 'Powerlevel9k/powerlevel9k", from:github, as:theme, if:"[[ $ZSH_THEME_STYLE == 9k ]]'
# if ! zplug check; then
  # zplug install
# fi

# zplug load

# # source your own shrc file if exists
# [ -f ~/.env.sh ] && source ~/.env.sh

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# # HomeBrew
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# export PATH="/usr/local/bin:$PATH"
# export PATH="/usr/local/sbin:$PATH"
# # HomeBrew END
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# # Created by `pipx` on 2025-11-06 14:55:43
# export PATH="$PATH:/Users/chieh/.local/bin"

# export ANTHROPIC_API_KEY="ms-9c26b942-8c0d-4bf6-97b7-ff55c3a1f4b2"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# [ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.

# # # Pyenv 初始化
# # export PYENV_ROOT="$HOME/.pyenv"
# # command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# # eval "$(pyenv init -)"
# # eval "$(pyenv virtualenv-init -)" # 这一行是为 virtualenv 插件准备的


# ==============================================================================
# 🚀 1. Powerlevel10k Instant Prompt (必须在顶部)
# ==============================================================================

# 启用 Powerlevel10k 瞬间提示。
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# ⚙️ 2. 全局环境变量和基本配置
# ==============================================================================

# Oh My Zsh 路径 (如果只使用插件，这行是可选的)
export ZSH=$HOME/.oh-my-zsh

# 禁用 Oh My Zsh 自动更新和更新提示
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=false

# HomeBrew 镜像设置 (合并重复项)
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# PATH 设置
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
# export MANPATH="/usr/local/man:$MANPATH" # 保持原注释
export PATH="$PATH:/Users/chieh/.local/bin" # Pipx 创建的路径

# SSH (保持原注释)
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# ANTHROPIC API 密钥
export ANTHROPIC_API_KEY="ms-9c26b942-8c0d-4bf6-97b7-ff55c3a1f4b2"

# ==============================================================================
# 🔌 3. Zplug 插件管理
# ==============================================================================

# Zplug 安装和初始化
if [[ ! -d "${ZPLUG_HOME}" ]]; then
  if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    if [[ $? != 0 ]]; then
      function zplug() { return 1 }
    fi
  fi
  export ZPLUG_HOME=~/.zplug
fi

if [[ -d "${ZPLUG_HOME}" ]]; then
  source "${ZPLUG_HOME}/init.zsh"
fi

# 插件列表
# ❗ 移除 Powerlevel9k，仅保留更快更秀的 Powerlevel10k
zplug 'romkatv/powerlevel10k', as:theme, depth:1

zplug 'plugins/git', from:oh-my-zsh, if:'which git'
zplug "plugins/vi-mode", from:oh-my-zsh
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# 检查、安装并加载插件
if ! zplug check; then
  zplug install
fi

zplug load

# ==============================================================================
# 🛠️ 4. 工具特定配置
# ==============================================================================

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autojump config
[[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh

# nvm (Node Version Manager) 配置 (合并在一起)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"     # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# x-cmd.root (保持原样)
[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.

# ==============================================================================
# 🐍 5. Pyenv 配置 (如果需要，请取消注释)
# ==============================================================================

# # Pyenv 初始化
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# ==============================================================================
# 🎨 6. 主题和自定义文件
# ==============================================================================

# Source your own shrc file if exists
[ -f ~/.env.sh ] && source ~/.env.sh

# Powerlevel10k 配置 (必须在所有插件加载之后)
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


