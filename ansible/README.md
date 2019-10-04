# Setup

```bash
ansible-galaxy install weareinteractive.environment
ansible-galaxy install geerlingguy.certbot
```

setup ansible to vagrant

```bash
ansible-playbook 100-vagrant.yml -i environments/vagrant
```
