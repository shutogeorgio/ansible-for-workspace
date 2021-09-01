## 📚 Ansible Workspace Spec

### 🚧 Preparation

- Create pair of keys(private and public)[reference procedure is here](https://www.task-notes.com/entry/20150208/1423325535)
```bash
ssh-keygen -t rsa -b 4096 -f ge_key -C sg@hogehoge.com
```

- Register public key on GitHub
    - To use "brew tap for somepackage

### 🧬 Install Homebrew and Ansible

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
```

### 🥾 Dry run

```bash
ansible-playbook -i hosts packages.yml --check
```

### 🏃‍♂️ Run

```bash
ansible-playbook -i hosts packages.yml
```

### 💨 After Run
```bash
### Apply your config
$ source ~/.zshrc
```