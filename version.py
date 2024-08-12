import requests as R 
import re

r = R.get("https://github.com/neovim/neovim/releases/latest")
#print(r.text)
m = re.search(r"Release NVIM \d+\.\d+.\d+", r.text)
print(m[0][13:])
