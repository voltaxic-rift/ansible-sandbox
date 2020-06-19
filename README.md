# ansible-sandbox

## Requirements

- Vagrant
- Vagrant plugin (vagrant-vbguest)

```
# For ArchLinux
sudo pacman -S vagrant
vagrant plugin install vagrant-vbguest
```

## Getting started

```
vagrant up
vagrant ssh ansible

cd /ansible/ansible
```

### Execute playbook

```
ansible-playbook -i hosts site.yml --become
```