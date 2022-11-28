"""Test file."""
import os
from pathlib import Path

from requests import HTTPError

with Path("/home/mrfika/dotfiles/tmuxinator/.config/tmuxinator/testproj.yml").open() as file:
    content = file.read()
    for line in content:
        if "tmux" in content:
            i = 0 + 2
            print(f"tmux {content}{i}")
            raise ValueError("Woop owop.")
        print(os.name)
        raise HTTPError
