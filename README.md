# Machine Runner


https://github.com/marcos-venicius/machine-runner/assets/94018427/ac3c94c2-a3f2-42d1-a521-48cdd21c6721


As a Software Engineer and a Cyber Security professional, sometimes I really need to up many machines at same time in my computer.

One pretending to be a victim, another one pretending to be the attacker, another one pretending to be something else...

It's very hard to create this bunch of machines by hand using docker or even virtual machines.

## The solution

I created a simple bash script that recognizes a folder as a `machine directory`.

A `machine directory` is any directory that contains a valid `machine.config` file.

It could be your git repository, a random folder, your project folder, doesn't metter!

If you have this `machine.config` file, this directory will be considered as a `machine directory`.

So, **to have a bunch of machines you can just create a bunch of config files and that's it**, to switch over the machines you can just go
inside the specific machine directory you want and run `os_connect`, and **a shell will be opened to you with persistent state**.

To see more information about the machine, just run `os_info`.

And you will have an output like this:

```

OS INFO:

Id:                     L2hvbWUvZGV2L3Byb2plY3RzL21hY2hpbmVzL2FscGluZQo=
Name:
Image:                  alpine:latest
Storage Location:       /tmp/L2hvbWUvZGV2L3Byb2plY3RzL21hY2hpbmVzL2FscGluZQo=/data

```

Now, if you want to connect to the machine, just run: `os_connect` and a shell will be opened to you.

**Don't be afraid to exit your machine, your data will be persisted in the _Storage Location_**, you need to remember that
this code runs over docker containers.


But, and if I want to remove the machine? Just run `os_remove`.

## Creating the machine config file

You don't believe how easy is it.

```config
name=alpine-os
image=alpine:latest
storage=/data
```

Yeah, just this three lines!

The key `name` is an arbitrary name to your machine, I recommend you the pattern `<os-system>-os`.
The key `image` is the system image name from docker hub.
The key `storage` is the volume path of the machine to make it persistent.

The configurations above is the necessary configurations to run an `alpine` system.

## Installing

Just run `./install.sh`

This will copy the `.machinesrc` to your home directory and add the following line to your `.bashrc`:

```bash
source $HOME/.machinesrc
```
