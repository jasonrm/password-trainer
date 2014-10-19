# Password Trainer

## Purpose

Remembering complex passwords is a bit of a pain. I'd rather not write it down and carry it around while learning it. Instead, if I type it enough over the course of a few days I can get it stored in muscle memory before switching to it.

## Usage

1. Type the password you want to learn.
2. Repeat step 1

It will sometimes mask an additional character when the password has been entered correctly and will sometimes unmask a previously masked character when the wrong password is entered. The masking doesn't keep track of what has been previously masked or unmasked, so it won't always mask/unmask on correct/incorrect input. This is partially by design, but equally due to the pain of dealing with arrays in a bash script.