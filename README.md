# microk8s-vagrant

From their respective github repositories:

> [Vagrant](https://github.com/hashicorp/vagrant) is a tool for building and distributing development environments.

> [MicroK8s](https://github.com/ubuntu/microk8s) is a small, fast, single-package Kubernetes for developers, IoT and edge.

## What

Easily install microk8s on a local ubuntu virtual machine. The provision script will install a few microk8s add-ons, docker, and setup aliases.

## Why

I've always been a huge fan of Vagrant. Dead simple testing on any linux os. No cloud costs. And the freedom to do anything, knowing that any mistakes can be resolved with a good ol' `vagrant destroy`.

## Up and Running

This will create an ubuntu vm, and install microk8s.

```bash
vagrant up
vagrant ssh
kubectl get nodes
kubectl get all --all-namespaces
```

## Teardown

```bash
vagrant destroy
```

## Contributing

Feel free to contribute!
