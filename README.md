### Repo transfer
Gather a git repo tree from a folder to a config, and then re-create the same structure (possibly, on another machine)

Howto:
1. Will create `output.txt`: `bash collect.sh your_git_repos_dir`
2. Will use `output.txt`: `python3 recreate.py your_new_git_repos_dir`
