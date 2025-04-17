# netbsd-devenv-scripts

Support scripts for my NetBSD development environment.
Initially made public to help my 2024 Google Summer of Code student to
compile NetBSD and run it in a VM.

Use this in conjuntion with [direnv(1)](https://direnv.net/) to add the
script directory automatically to the shell's PATH variable.  `direnv` also
sets some environment variables which are used by the scripts.

## Support scripts
The utilities are:

### ,run-build.sh
Runs `./build.sh` with options to do an unprivileged build,
using a standard `obj` directory for build artifacts, and creating all the
output from `build.sh` under that directory.

It also keeps a log of all invocations with timestamps in
",run-build.sh.log."

Usage: `,run-build.sh MACHINE [build.sh-options...]`

`MACHINE` is one of the MACHINE values that `build.sh list-arch` prints.

### ,run-qemu
Runs NetBSD in a QEMU VM.  It has sensible defaults.  It has
command line options to simplify often used QEMU incantations.

Run it with the `-h` or `--help` options to print the usage message.

### ,mkobj
Create a NetBSD build system OBJDIR (default "obj") and mark it as not to be
backuped.

### ,yymmdd
Outputs the current date in YYMMDD format -- shorter and
faster to type than `date +%y%m%d`.

## Setup

# Directory layout
The scripts assumes that you keep your NetBSD source tree(s), obj
directories, and other directories used by these scripts under a top-level
directory, e.g. "~/work/netbsd/".

The directory layout is:

```
~/work/netbsd/
	|
	\ .envrc 	- config file for direnv(1)
	\ scripts	- these scripts
	\ src		- the NetBSD sources
	\ obj		- the build artifacts
	\ vm		- holds the VM images and installation ISOs
```

## direnv setup

Create `.envrc` in your top-level directory with the following contents:

```
PATH_add scripts
PATH_add obj/tools/bin
export CVS_RSH=ssh
# TOPDIR
export TD=${PWD}
```

Then run `direnv allow` allow in the top-level directory.

## Why the commas?
In short:
  - they don't conflict with system commands
  - command completion: typing ",TAB" makes them easily discoverable

Thanks to [Brandon Rhodes](https://rhodesmill.org/brandon/2009/commands-with-comma/).

## History
I created `,run-build.sh` years ago to so that I don't have to type or paste
in the common arguments to `build.sh` over and over again.

I published this in 2024 in order to create a common work environment with
my Google Summer of Code student.
