+++
title = "HOWTO: /bin/ed by example"
author = ["George M Jones"]
publishDate = 2020-08-28
lastmod = 2023-12-06T05:45:25-05:00
tags = ["geek", "unix", "100DaysToOffload", "HOWTO"]
categories = ["blog"]
draft = false
+++

Below I **show** an editing session that uses basic `/bin/ed` commands.

> `/bin/ed` is the standard Unix Editor

`ed` was written round 1969.  It's still here.  `grep` comes from
`/bin/ed`: `g/re/p` works as an ed command to search \*g\*lobally for a
\*re\*gular expression and \*p\*rint the matching lines.  ed commands
will be familiar to users of `sed`, as sed is the "stream editor"
with a very similar set of commands.  ed commands will be familiar to
`vi` users.  If you type ":" in vi, you get, basically, an ed prompt.
You can type ed commands (see below) and they work.  "vi" is the
"visual interface" to ed (or one of it's successors).  Though I am a
die hard `emacs` user, often when I just want to do a quick edit or take
some note I just fire up `/bin/ed` and go....


## <span class="section-num">1</span> A sample `/bin/ed` session... {#a-sample-bin-ed-session-dot-dot-dot}

<!--more-->

```text

  gmj@ed tmp [master] $ ed -p: ed-HOWTO-blog.org  # use ":" for the prompt, just like vi
  ed-HOWTO-blog.org: No such file or directory
  :# append some lines
  :a
  * Write a blog post about /bin/ed
    /bin/ed is "The standard Unix editor" ... since 1969
    It was written by Richard Stallman

  * Show some basic ed commands
    - "a" :: append
    - "p" :: print
    - "s" :: substitute
    - "w" :: write
    - "q" :: quit
    - "." :: end input
  :
  :# Whoops, Stallman did not write ed
  :# go back to line 1
  :1
  * Write a blog post about /bin/ed
  :# make sure we are at line 1
  :.=
  1
  :# find the mistake
  :/Stallman/
    It was written by Richard Stallman
  :.=
  3
  :# its on line three
  :# fix it
  :s/Richard Stallman/Ken Thompson/
  :# let's see the fix
  :p
    It was written by Ken Thompson
  :# let's see the start of the file to here
  :1,.p
  * Write a blog post about /bin/ed
    /bin/ed is "The standard Unix editor" ... since 1969
    It was written by Ken Thompson
  :# OK, looks good, but one more change
  :p
    It was written by Ken Thompson
  :s/Ken Thompson/Ken Thompson or maybe Dennis Ritchie/p
    It was written by Ken Thompson or maybe Dennis Ritchie
  :# let's see the whole file now, it's short
  :1,$p
  * Write a blog post about /bin/ed
    /bin/ed is "The standard Unix editor" ... since 1969
    It was written by Ken Thompson or maybe Dennis Ritchie

  * Show some basic ed commands
    - "a" :: append
    - "p" :: print
    - "s" :: substitute
    - "w" :: write
    - "q" :: quit
    - "." :: end input
  :# now lets grep (g/re/p) for lines that contain "ed"
  :g/ed/p
  * Write a blog post about /bin/ed
    /bin/ed is "The standard Unix editor" ... since 1969
  * Show some basic ed commands
  :# ok, this looks good.  write and quit
  :w
  288
  :q
  gmj@ed tmp [master] $
```

Post 25 #100DaysToOffload <https://100daystooffload.com/>
