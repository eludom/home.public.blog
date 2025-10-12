+++
title = "Source Code Distribution From Printouts to Github"
author = ["George M Jones"]
publishDate = 2020-10-10
lastmod = 2025-10-12T09:55:29-04:00
tags = ["geek", "unix", "history", "100DaysToOffload"]
categories = ["blog"]
draft = false
+++

Source code distribution has changed over the years.  Today we
all love (hate?) git, github and friends, but, believe it or not
there were ways to distribute source code even before the
Internet.  In fact, this was the world in which the GNU Public
License was created. Below are a few of the ways I've
gotten/transferred source code through the years, in something
like chronological order

<a id="figure--pic:camera"></a>

{{< figure src="/ox-hugo/code.jpg" caption="<span class=\"figure-number\">Figure 1: </span>Code on the Europython 2009 bag\" by Thomas Guest is licensed with CC BY 2.0. To view a copy of this license, visit <https://creativecommons.org/licenses/by/2.0/>" >}}

Post 31 of #100DaysToOffload <https://100daystooffload.com/>

<!--more-->

Print Outs
: Paper.  Yes, paper.  My first memories of source
    code (late 70s) include source listing of BASIC programs
    printed on ASR-33 Teletypes.  I also have memories of a large
    stack of "green bar" printouts at home (again, c.a. 78 or 79)
    that I think where the printouts of Emacs (TECO emacs, the
    original, before GNU) that my brother probably brought home
    from Carnegie-Mellon where he went as an undergrad.


Paper Tape
: The ASR-33s had paper tape punches on the side.
    You could punch your programs onto tape and read them back in.
    It was 8-bit ASCII.   At one point, I think my brother could
    read the ASCII by looking at the tape.


Cards
: Early in college (80, 81) I actually punched cards for
    a class or two.  You could duplicate cards.   No cheating on
    that programming assignment now !


BYTE Magazine
: Gamers of yore bought BYTE Magazine (and
    others), in part to get the source code listings that they
    could then type in.


ACM, Knuth
: And of course there were textbooks such as Kunths
    (to this day unfinished) "The Art of Computer Programming" and
    ACM publications.  Steve Wilhite used an algorithm published in
    ACM as part of GIF...of course anything printed was in the
    public domain, right? ... well, no.  We were all still learning
    about and in some cases defining the legal status of software
    then, right along with GNU/FSF.

<!--listend-->

USENET News
: In the late 80s, MIT project Athena periodically posted
    the source code to X-Windows to the USENET news group
    comp.sources.x.  If you were on a USENET site that "took a
    feed" of that newsgroup (usually over modems not faster than
    9600baud), to get the latest source to X, you watched the news
    group (using readnews, rn or some other "newsreader" program),
    saved off the individual pieces from each post, reassembled and
    then extracted the code.  The (large) distro was compressed and
    broken up into many pieces, and re-assembling them often
    involved the use of uudecode, shar, patch, tar, and programs to
    decompress (pretty sure gzip was not a thing yet).  Of course,
    you had to grab them before your news site expired the articles
    (spool space was limited, and space was shared with
    rec.humor.funny and other essential news groups).  Heaven help
    you if you missed one piece.  No bit-torrent for you to find
    the missing pieces.  You got one shot from one source in a
    limited time window.


UUCP
: UUCP being "unix to unix copy", you could literally
    issue a copy command of source known to live on a remote system
    something like
    ```text
    uucp cbosgd!/archive/hdb-uucp.tar.gz hdb-uucp.tar.gz
    ```
    with multi-hop paths being possible...if you knew the topology
    (pathalias !) and the filenames.


mag tape
: Then there was the time I was in Boston (visiting
    Encore computer?).   I took a blank 9-track tape, arranged to
    stop by MIT, was given a personal tour of the labs, show the
    locked room where the all-important KDC (forerunner of
    Microsoft's domain controllers) was kept, and got a copy of the
    latest Athena source (X, Kerberos, Hesiod, etc.) dumped to
    tape. This was getting software, the easy way.


DECUS tapes
: Tapes were a thing for quite a while.  early on
    users of DEC computers created and distributed "decus tapes",
    which were user-contributed collections of software.  If the
    VAX/VMS bulletin board system I created in FORTRAN-77 around
    1983 exists anywhere in the world, it's probably in the archive
    of DECUS tapes.  This is one example of collections of
    user-generated software that grew into the software archives we
    came to know later.  I think the IBM SHARE user group had
    similar collections.  The programs (games, etc) distributed
    with BSD Unix formed another set.  [DistroWatch](https://en.wikipedia.org/wiki/DistroWatch) is one web site
    in this vein today.


Floppies
: With the advent of the PC (early, mid 80s) floppies
    became a thing.  I purchased a copy of the Mark Williams C
    compiler for DOS just to get the public-domain source to
    MicroEmacs which I then ported to the Amiga.  Of course, with
    floppies came boot sector viruses and the security wars were
    on.  Later issues of BYTE sometimes shipped with floppies of
    source so you didn't have to type it in.


Email
: Yes, you could always use tar, shar(1), uuencode(1)
    and friends to email source code.   Email has been a workhorse
    for something like 40 years, not just for communication but as
    the file transfer method of last (first?) resort.


CompuServe (and other) Forums
: I ran ("SYSOPed" the
    CompuServe Unix Forum for a few years.  I think we/I may have
    invented the file suffix ".tgz" to stand for "gzip tar" archive
    (because the forums could not deal with multiple suffixes, as
    in .tar.gz).  We had source code available for download.  The
    Forums were just CompuServe's version of the local dial-up BBS
    and many other similar message/download systems.


FTP
: As Internet connectivity started becoming common (at
    least in universities, government and some larger
    corporations), a number of "well known" FTP sites where created
    (often at well connected UUCP sites) that collected and offered
    source downloads. UUNET and WUSTL (Washington Univerity at
    St. Louis) being some of the larger ones (there is still a
    version of FTP server software, wu-ftp available for Linux)


Source Code Control Systems
: As Internet connectivity became
    a thing, source code control systems such as cvs, svn,
    mercurial and friends started being used on local networks and
    it became possible to use them over the Internet.  They also
    solved a lot of the collaboration, version control and release
    management issues that are important for projects of any size.


SourceForge
: Sourceforge gets honorable mention as a
    precursor to github and friends.  In the early 2000s it hosted
    many open source projects.  I initially hosted NCAT there which
    became the Center for Internet Security's Router Audit Tool.


"My name is Legion, for we are many"
: Git is a good thing.
    Really.  Today we have github, gitlab, dropbox and thousands of
    other options for getting and sharing source code, some of
    which even work reasonably well.

The world has changed. It really is a better place. No more
trolling the USENET News feed spool.  No more trips to MIT, tape
in hand.  No more hoping ftp.uu.net has the latest version.
Go forth and hack.
