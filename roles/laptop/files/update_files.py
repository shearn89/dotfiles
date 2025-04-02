import os
import pathlib
import shutil

files_to_copy = {
    "bash_aliases": "~/.bash_aliases",
    "bashrc": "~/.bashrc",
    "Brewfile": "~/.Brewfile",
    "conky.conf": "~/.conkyrc",
    "gemrc": "~/.gemrc",
    "ghosttyrc": "~/Library/Application Support/com.mitchellh.ghostty/config",
    "git_commit_template.txt": "~/.git_commit_template.txt",
    "gitconfig": "~/.gitconfig",
    "gitignore_global": "~/.gitignore_global",
    "init.vim": "~/.config/nvim/init.vim",
    "minttyrc": "~/.minttyrc",
    "profile": "~/.profile",
    "tmux.conf": "~/.tmux.conf",
    "vscode-extensions": "~/vscode-extensions",
    "wsl.conf": "/etc/wsl.conf",
    "xinitrc": "~/.xinitrc",
    "Xmodmap": "~/.Xmodmap",
    "zprofile": "~/.zprofile",
    "zsh_plugins.txt": "~/.zsh_plugins.txt",
    "zshrc": "~/.zshrc",
}

def copy_file(src, dest):
    """Copy the file from its location to this folder, ignoring missing files"""
    if os.path.exists(src):
        shutil.copyfile(src, dest)

def copy_files():
    this_file_path = pathlib.Path(__file__).parent.resolve()
    print(f"Copying files to {this_file_path}")
    for dest, src in files_to_copy.items():
        src = os.path.expanduser(src)
        dest = this_file_path / os.path.expanduser(dest)
        copy_file(src, dest)

if __name__ == "__main__":
    copy_files()

