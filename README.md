# dotfiles

configuration management of a windows msysgit bash environment.


## Dependencies

Windows, ConEmu, msysgit bash ("Git Bash").

Install Git Bash first.

Run a bash shell using git bash. I use ConEmu. It's the best. Tried console2, but ConEmu is better.

## Setup

Clone this repo somewhere.
Copy your dotfiles (or any of your configuration) to these relative directories:

### src/USERPROFILE

whatever `echo $USERPROFILE` shows for you. Probably something like `C:\Users\lawrence`. I've got things like `.bashrc` there. The first time, copy these to `src/USERPROFILE`. 

### src/PROGRAMW6432

same as above, whatever PROGRAMW6432 expands to (usually C:\Program Files). put stuff in here that has the same relative path, like:

C:\Program Files\ConEmu\ConEmu.xml -> src/PROGRAMW6432/ConEmu/ConEmu.xml

### src/PROGRAMFILES

this is your C:\Program Files (x86), most likely

## Usage

### to_repo.sh 

to update the repo with your local host files. Once you have files in this repo (setup above), this will scan the src/ directories, and for every file found in this repo, it will look for the matching file on the host, and try to copy it to this repo.

Note, if this is working, it will overwrite the file in this repo (which is the point)

### to_host.sh

copy from the repo to the host.

use `-d` for a dry run to see what would be copied but not do anything