# Ruby On Rails Box for tutorial

## Installation

> Two packages: `vagrant` and `virtualbox` should be installed first.

You can get the source code of the repo either by downloading and unpacking this zip archive:

https://github.com/RORBrains/vagrant/archive/master.zip

Or by clonning it with command:

```bash

git clone git@github.com:RORBrains/vagrant.git rails-vagrant

```

## Usage

Start the VM:

```bash

vagrant up

```

Stop the VM:

```bash

vagrant stop

```

Destroy the VM:

```bash

vagrant destroy

```

Login into the VM:

```bash

vagrant ssh

```

Your projects folder on the host machine will be mounted to the `/vagrant` folder on the guest machine.

