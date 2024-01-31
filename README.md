# DevBox

Vagrantfile and relevant configuration to deploy on virtualbox a working  *nix machine to use as a dev environment.
Comes configured with:

- docker
- python
- pyenv
- pyenv virtualenv
- pipx under global interpreter of pyenv
- poetry under pipx

Provisioning can be executed via shell scripts or via ansible, to run with ansible execute use flag `--provision-with ansible_local`

## Bringing the machine up

Execute:

```bash
vagrant up
# alternative:
# vagrant up --provision-with ansible_local
```

Connect:

```bash
vagrant ssh
```

## Network

Tweak inside the [Vagrantfile](./Vagrantfile) the desidered configurations for "private_network" (does not require forwarded ports) or "forwarded_port" (if using with localhost forwarding from guest).
