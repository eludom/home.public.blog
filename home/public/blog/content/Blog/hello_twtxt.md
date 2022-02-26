+++
title = "Hello twtxt"
author = ["George Jones"]
publishDate = 2020-10-17
lastmod = 2022-02-26T07:52:11-05:00
tags = ["social", "HOWTO", "100DaysToOffload", "geek"]
categories = ["blog"]
draft = false
+++

And in the to-simple-to-be-true category...

> twtxt is a decentralised, minimalist microblogging service for hackers.

<https://twtxt.readthedocs.io/en/latest/user/intro.html>

```text
 $ twtxt tweet "Is there anybody out there, just nod if you can hear me"
```

<!--more-->

Install twtxt

```text
pip3 install twtxt
```

Configure twtxt

```text
twtxt config
...
 $ cat ~/.config/twtxt/config
[twtxt]
nick = gmj
twtfile = /home/gmj/twtxt.txt
twturl = http://www.port111.com/george/twtxt.txt
disclose_identity = True
character_limit = 140
character_warning = 140

[following]
twtxt = https://buckket.org/twtxt_news.txt
adiabatic = https://www.frogorbits.com/twtxt.txt
beyond = https://enotty.dk/beyond.txt
jcolag = https://john.colagioia.net/twtxt.txt
vain = https://www.uninformativ.de/twtxt.txt
prologic = https://twtxt.net/user/prologic/twtxt.txt
antonio = https://twtxt.net/user/antonio/twtxt.txt
```

Post some tweets

```text
$ twtxt tweet  This is incredible.  Simple.  Text.  Decentralized :-\)
$ twtxt tweet  There is life after twitter.  https://eludom.github.io/blog/goodbye-twitter/
$ twtxt tweet Thanks @prologic
```

Push my twtxt.txt file to the server (dropbox, github, s3 buckets, etc
would do...anything with a public URL)

```text
scp twtxt.txt gmj@port111.com:~/public_html/george/twtxt.txt
```

Follow someone:

```text
twtxt follow prologic https://twtxt.net/user/prologic/twtxt.txt
```

Read your timeline

```text
$ twtxt timeline
```

Some of the docs

<https://twtxt.readthedocs.io/en/latest/user/usage.html>

<https://twtxt.readthedocs.io/en/latest/index.html>

And if you want a browser based interface that does threading, etc
(BUT requires a login...)

<https://twtxt.net/>

Day 32 of #100DaysToOffload.
