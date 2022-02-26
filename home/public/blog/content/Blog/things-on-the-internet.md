+++
title = "What is that thing on the Internet, and is it bad?"
author = ["George Jones"]
publishDate = 2020-09-19
lastmod = 2022-02-26T08:43:11-05:00
tags = ["cybersecurity", "secuity", "privacy", "perspective", "100DaysToOffload"]
categories = ["blog"]
draft = false
+++

<div class="ABSTRACT">

When talking about Internet assets we often confuse "What is it?", "Is
it bad?" and "What should I do about it?".  This write-up intends to
show why it is important to keep those questions and answers to them
separate.

</div>

<a id="figure--pic:elephant"></a>

{{< figure src="/ox-hugo/elephant.jpeg" caption="<span class=\"figure-number\">Figure 1: </span>[The Shape of the Elephant](https://images.squarespace-cdn.com/content/v1/547e053ae4b04768d95052b5/1449545907243-AHKE1H7G260OO4WJ9L3C/ke17ZwdGBToddI8pDm48kA4OTh10Ye8gZQM8UPYYQJFZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpxpL5WijoIxxArGLpk2nP4rt_mQiHA3qkdw2IvdSifHurtFUlA4zHqOnDqw0hNJllc/image-asset.jpeg?format=750w)" >}}

Post 27 of #100DaysToOffload <https://100daystooffload.com/>

<!--more-->


## <span class="section-num">1</span> Questions to ask {#questions-to-ask}

When identifying Internet-based assets, there are a series of basic
questions[^fn:1] that need to answered:

-   What is it?
-   How do I know?
-   How certain am I?
-   Is it "bad"?
    -   depends on who you are
    -   depends on time
-   What can I do about it?


## <span class="section-num">2</span> An Example: Web servers serving pages with flash {#an-example-web-servers-serving-pages-with-flash}

One example can be used to illustrate the point: web servers
serving content with Adobe Flash
(<https://en.wikipedia.org/wiki/Adobe_Flash>).

Flash is an older web technology that has known security
vulnerabilities, is deprecated (Adobe to stop supporting it on
12/31/2020) and has been replace by HTML5.

Let's classify it using the questions above, assuming we have
scanned a web site and pulled back the HTML body of the main page
via an HTTP GET request:

What is it?
: A web server serving pages with flash.


How do I know?
: We see files with `.swf` extensions embedded in
    javascript returned as part of the web page, e.g.

<!--listend-->

```text
    var swfpath="/e/data/images/pixviewer.swf
```

How certain am I?
: Your signatures may vary.  There are other
    strings you can look for such as:

<!--listend-->

```text
application/x-shockwave-flash
```

```text
http://www.macromedia.com/go/getflashplayer
```

You might start with a google search for

```text
intext:http://www.macromedia.com/go/getflashplayer
```

It's just a question of how much time you want to put into
developing the signature.  For some things (HTML) there is a lot
of ambiguity. For others (TCP, HTTP, SNMP, SSH...) the protocol
will not work if the transactions are not well defined.
Identification of less well defined protocols is ad hoc based on
heuristics.  Identification of well defined protocols is more
certain. See below.

Is it "bad"? It depends.
: Once we've answered the "what is it"
    question, you can begin to address the "is it bad" question and
    possibly it's corollary "how bad is it?" (not addressed here).
    Lets return to our flash example.  It turns out Chinese web sites
    are a large current (2020-09-17) source of flash on the web.  A
    security products vendor also uses a lot of flash on their login
    page.
    -   **'Is it bad?' depends on who you are**
        1.  Chinese government? Maybe you WANT people to download
            vulnerable software to enhance your ability to monitor
            citizens activity.
        2.  Chinese human rights activist? You probably don't want known
            vulnerable software on your computer.
        3.  Security vendor?  Forcing your security minded customers to
            download and run known vulnerable software as part of logging
            into your security web site is, at best, bad form.

    -   **'Is it bad?' "Is it bad" "depends on time**
        When did vulnerabilities in the product become widely known (e.g. a CVE
        published)?  When was "proof of concept" exploit code available?
        When are_were patches_upgrades available? ...

    -   **'Is it bad?' depends on where you are**
        Are you at work on a laptop supplied by your employer who has a policy against
        accessing web sites that use flash?  Are you at home or in a lab
        doing web vulnerability research on a "throwaway" machine...


What can I do about it?
: Lastly, and probably most importantly,
    the question is "What can I do about it?".  Are there steps I
    can/should take to fix things that are "bad"?  Patch? Upgrade?
    Choose a different security vendor...?


## <span class="section-num">3</span> Keep each issue separate, think about them independently {#keep-each-issue-separate-think-about-them-independently}

It is important to keep the answers to these questions separate.
For instance saying "write some software to find bad things on web
servers" presupposes a common definition of "bad", which, as we've
seen above can be highly contextual.

It would be far better to keep them separate.   For instance, define
a taxonomy (see below) to say "what is this"?   Then separately
devise ways to answer the "is it bad" question for separate
environments (countries, organizations, individuals ...)


## <span class="section-num">4</span> Taxonomies, Ontologies and ASCII Art, Oh My !!! {#taxonomies-ontologies-and-ascii-art-oh-my}

The outline above lists the basic questions.  It is possible that
there will be a need for a deeper dive/more complete classification.
For instance, revisiting **what is it?** for the web server with
flash, we might come up with this taxonomy:

```text
  + open port                      WELL DEFINED, CERTAIN IDENTIFICATION
    + tcp
      + tls                                        ^
        + web server                               |
           + microsoft                             |
             + iis                                 |
               + 7.3                               |
                 + services                        |
                   + flash                         v
                 + frameworks
                    + dotnet       LESS DEFINED, LESS CERTAIN IDENTIFICATION
```

Taxonomies help in classifying, understanding and communicating
about things, for instance taxonomies (and Latin names) have been
used in Biology for hundreds of years.  More recently, the
cybersecurity world started standardizing vulnerability naming as
CVE.


## <span class="section-num">5</span> Conclusion {#conclusion}

When thinking about Internet assets, writing software to detect and
classify/fingerprint assets and deciding what to call "bad", keep
the preceding questions in mind and try to keep the questions
separate.


## <span class="section-num">6</span> Disclaimer {#disclaimer}

The opinions expressed here are mine, and not those of my employer.
In fact, they may not even be mine.  I may have changed my mind.  I
may have grown beyond a particular opinion.  I may be trolling you.
I may be engaging in Socratic dialog to tear down your beliefs.  I
may be tearing down my own beliefs. γνῶθι σεαυτόν!

[^fn:1]: Note that these are not randomly chosen questions.  They map
    fairly directly to some of the basic questions of epistemology, morals
    and ethics.
