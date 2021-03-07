# TODO

#### Example 
```
$ tree -L 1
.
├── dotfiles
├── hosts
├── main.yml
├── playbooks
├── roles

# sync all dot files
ansible-playbook -i hosts main.yml --tags dotfiles

# full sync
ansible-playbook -i hosts main.yml
```