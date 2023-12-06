+++
title = "Of Typewriters, Scribe, LaTeX, Org mode, Hugo and Paper"
author = ["George M Jones"]
publishDate = 2020-12-06
lastmod = 2023-12-06T05:45:34-05:00
tags = ["geek", "history", "blogging", "emacs", "100DaysToOffload"]
categories = ["blog"]
draft = false
+++

## <span class="section-num">1</span> What is this and why was it written? {#what-is-this-and-why-was-it-written}

This is my personal history of putting
words-on-page-or-screen-or-blog-entry covering the period from
the late 1970s to present (2020-12-05).

It was written (partially) at the request of [JTR](https://helpdeskheadesk.net/about/) from
whom I borrowed a Hugo blog theme.  Thanks JTR.

I was writing a post where I wanted to include the \\(\TeX\\) symbol
in the post, which is perfectly possible in emacs org mode where
\\(\TeX\\) and \\(\LaTeX\\) are first class citizens, but it wasn't
working.

The blog exports to markdown via the [ox-hugo](https://ox-hugo.scripter.co/) Org exporter back
end (lost yet?)  which [Hugo](https://gohugo.io/) then translates to HTML which can
then be previewed locally with Hugo's own web server and then
pushed to the live site, in my case, this site using git push.

I pinged JTR who, it turns out had little experience with
\\(\LaTeX\\) and so was not able to help.  Along the way, he asked
me

> Is there more you can tell me about use case for it? In other words,
> can I get you to vent some more about this, it's interesting.

<!--more-->

So here is some venting. I can always vent. And, in case you were wondering, the
solution is to put

```html
      <script type="text/javascript"
      src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
      </script>
```

at the bottom of `layout/partials/head.html` before `</head>` in
the modified [Hugo hyde theme](https://themes.gohugo.io/hyde-hyde/) I borrowed from JTR.


## <span class="section-num">2</span> Some History {#some-history}

> Marley was dead, to begin with...

No. No. No.

> It was a dark and stormy night...

Wrong.

OK, how about this:


## <span class="section-num">3</span> Dad - Typewriters {#dad-typewriters}

> In high school I wrote out my paper assignments by hand and then my
> Dad typed them for me, at least until I took typing and got up to
> 30wpm.  White-out can be your friend :-)

Better.

> As high school progressed I and my friends started using the
> HP-2000E in the computer lab on [ASR 33 Teletypes](https://en.wikipedia.org/wiki/Teletype_Model_33) (`/dev/tty`
> anyone?) that printed your input and the computers responses on
> a role of paper.  We may have printed a few stories or other
> prose, but mostly it was BASIC listings.
>
> Towards the end of high school, I remember eyeing the school
> secretary's IBM Selectric typewriter because we knew it could be
> converted to a printer...(Apple II's were all the rage then
> ...)


## <span class="section-num">4</span> Brian Reid - Scribe {#brian-reid-scribe}

So, [Scribe](https://en.wikipedia.org/wiki/Scribe_(markup_language)).  So in the late 70's at Carnegie-Mellon, Brian Reid
stepped into the long tradition of Computer Science geeks scratching
their own itch, developing one of the first mark-up languages
that allowed the author to describe a document structurally
(chapters, paragraph, et cetera.), and to target different output
devices (text, laser printer, etc.), and to externalize styles,
presaging the later CSS style sheets.

Reid killed several birds with one stone.  Scribe was the
subject of his PhD Thesis, it formatted his PhD thesis (and
many others for a few years), and was sold to Unilogic sparking
the first software copyright problems between CMU and students,
wining Reid the ACM Grace Hopper Award, and, of course,
criticism from Richard Stallman[^fn:1] for not making it available for
free...some people :-)

I wound up using Scribe on the Ohio State DECsystem-20 and then
being the SCRIBE administrator for the department of Mechanical
Engineering for a year or two.  As I had access to
then-world-class formatting and typesetting facilities, Dad was
no longer typing my papers :-)


## <span class="section-num">5</span> Donald Knuth - [TeX](https://en.wikipedia.org/wiki/TeX) {#donald-knuth-tex}

Meanwhile, on the other side of the country (on a dark and
stormy night?), [Donald Knuth](https://en.wikipedia.org/wiki/Donald_Knuth) was (and still is) engaged in
writing his foundational series of Computer Science textbooks,
_The Art of Computer Programming_&nbsp;[^fn:2].  But he was not happy with
the appearance of the typesetting from his publisher, so, being
Donald Knuth, he set out to write his own
formatting and type-setting program c.a. 1978.  The result was
\\(\TeX\\). Along with [TeX](https://en.wikipedia.org/wiki/TeX)  he developed Metafont, a language for
describing fonts from which we get the Computer Modern fonts.

The current \\(\TeX\\) release is 3.14159265.   Each subsequent
release adds a digit of \\(\pi\\).   Metafont is at  2.7182818 and
approaching _e_ with each release.

I installed the Pascal based TeX82 on the DEC10's at
CompuServe sometime around 1986.


## <span class="section-num">6</span> Donald Knuth - Literate Programming {#donald-knuth-literate-programming}

Not content with having won the Turning award in 1974 (4 years
prior), with creating a typesetting system that is used to this
day for a large fraction of academic publishing, alongside
\\(\TeX\\) he came up with the concept of [Literate Programming](https://en.wikipedia.org/wiki/Literate_programming), the
basic idea of which is you are writing a program both for humans
and machines.  The language was called WEB[^fn:3].   The basic
process is to run "weave" to generate output for humans (say, a
volume of the _The Art of Computer Programming_) and to run
"tangle" to generate output (code) for machines.

We see elements of this today in Jupyter and Zeppelin notebooks,
and for those of the Emacs-Org-mode faith, as the mix of [Org
Mode](https://orgmode.org/) and [Org Babel](https://orgmode.org/worg/org-contrib/babel/intro.html).  See the paper by Domnick, Shculte etc on
reproducible research: <https://www.jstatsoft.org/article/view/v046i03>

Org directly supports a form "tangle" today.


## <span class="section-num">7</span> Guy Steele - the 1 degree of separation {#guy-steele-the-1-degree-of-separation}

Guy Steele who later went on to have a lot to do with Java (and
standardizing C) seems to have been the 1-degree-of-separation
point for Emacs, TeX, and possibly SCRIBE.  As recently
as <https://emacsconf.org/2020/>, Stallman credits Steele with
helping invent Emacs.  Per Wikipedia, Steele spent the summer of
78 at Stanford and later implemented a back-end for TeX at MIT.
By 1980 or so (per my wife who knew him there) he was at CMU and
Tartan Labs as Reid was finishing off SCRIBE and his thesis.
The Stanford-Berkeley-MIT-CMU crowed was (is?) a small world.
James Gosling (Java, [GosMacs](https://en.wikipedia.org/wiki/Gosling_Emacs) 1981) was also kicking around CMU
before moving off to Sun.


## <span class="section-num">8</span> Leslie Lamport - Latex {#leslie-lamport-latex}

So, \\(\TeX\\) was cool and all, but it was very low level, and in
some ways difficult to work with.  People had seen SCRIBE.  So
at some point in the mid-80s, as SCRIBE was on its way to
proprietary-software-oblivion, [Leslie Lamport](https://en.wikipedia.org/wiki/Leslie_Lamport) created \\(\LaTeX\\).

\\(\LaTeX\\) is, from my point of view, a set of SCRIBE-like macros
on top of \\(\TeX\\).  Very useful.

And because creators gonna create....along the way Lamport and
Oren Patashink created [BibTeX](https://en.wikipedia.org/wiki/BibTeX) which is to this day one of the
most common ways to keep a list of bibliographic references that
can be cited in your papers.

If you're curious what all this looks like, I keep my resume in
.tex format[^fn:4]. You can see it here
<http://www.port111.com/george/resume/> along with the .bib file
for citations and .tex input.


## <span class="section-num">9</span> Bill Gates and the nameless corporate droids[^fn:5] - WYSIAYG Editors {#bill-gates-and-the-nameless-corporate-droids-wysiayg-editors}

What You See Is All You Get (WYSIAYG) also known as What You See
Is What You Get (WISIWYG) editors let you move pixels around on
the screen and print exactly what you see.  With no training at
all in printing, typesetting, aesthetics, or design you can make
wildly inconsistent and incoherent decisions about the visual
appearance of your document, in fact, you (and your boss and
your marketing department) can focus on that from the start to
the exclusion of stringing together coherent thoughts.

I'm pretty sure SCRIBE and \\(\LaTeX\\) form the basis of my
antipathy to the WYSIWIG editors that started to come along
(mass market).  When writing documents you should think first
about what you are saying, the structure of your document, your
arguments and your story line before you worry (if all) about
making a font just the right size and color so you can make your
power point.  Formatting should be the afterthought, and no
more than choosing the right style sheet.  Brian Reed got that
right.


## <span class="section-num">10</span> Sir "Almost not appearing in this blog post" - RUNOFF and nroff {#sir-almost-not-appearing-in-this-blog-post-runoff-and-nroff}

A couple honorable mentions that I did in fact use a good bit
along the way are [DEC RUNOFF](https://en.wikipedia.org/wiki/TYPSET_and_RUNOFF) (DEC 10s, VMS) and [nroff](https://en.wikipedia.org/wiki/Nroff) (unix).

nroff comes in handy when you want to write man(1) pages.


## <span class="section-num">11</span> Tim Berners-Lee - The Web {#tim-berners-lee-the-web}

There was a time before the web.  There were things written and
published before the web.  But since the early 90s it's been the
800-pound gorilla in the living room.

There were other hyptertext systems before it.  Apple's
HyperCard.  The GNU/Emacs info system.  There was, in fact, a
whole academic conference on hypertext systems at which early
versions of HTML/HTTP were scorned.

But NCSA Mosaic happened, Netscape happened ([Marc Andreessen](https://en.wikipedia.org/wiki/Marc_Andreessen)).
The NCSA, Netscape and Apache servers happened.  For various
reasons, the World Wide Web took off in ways that gopher never
did and [Gemini](https://gemini.circumlunar.space/) probably never will.  Stodgy XML editors were
rebranded as exciting new HTML editors.

I attended the 2nd International Conference on Mosaic and the
Web, met Berners-Lee, and implemented a never-released web
browser that worked through CompuServe's WinCIM which would have
allowed dial-up users without an IP stack such as SLIP or PPP
(most users at that time) to access the web.  But marketing
people.  They were not sure this web thing was going to catch
on....


## <span class="section-num">12</span> Carsten Dominick - Org Mode - "Your Life in Plain Text" {#carsten-dominick-org-mode-your-life-in-plain-text}

Your blog post is text.  Your email it text.  Your slack (IRC)
messages are text.  Your documents are text.  Your calendar and
agenda are text.  Your shopping lists are text.  You TODO lists
are text.  Musical scores are texts.  Poems are text.  ASCII art
is text.  Source code is text.  Data is text (json).  The web is
text (once you strip out all the graphics, videos, java and
javascript...) At different levels YOU are text.  Your DNA
sequence is a text.  The story of your life is a text.

There was a period in the late 90s and early 2000s where Emacs
(the text editor) kind of went into a lull.  Then two things
happened: package managers (ELPA, MELPA, basically "apps" for
emacs) and org mode.

Org mode is a game changer.  It's going to take me to my grave
or senility where I forget the meta-alt-control-shift-escape
sequences needed to make the magic happen, whichever comes first.
People are learning an arcane 44-year old editor just to use org
mode (and the growing list of packages being built in/with round
it).

Org started as a simple text outline tool.  It enabled Abraham
Lincoln to write a short, pithy, and memorable speech:

```org
* Hook
  Four score and seven years ago our fathers
  - brought forth on this continent, a new nation,
    o conceived in Liberty,
    o and dedicated to the proposition
      + that all men are created equal.
** Body
   Now we are engaged in a great civil war, testing whether that
   nation, or any nation so conceived and so dedicated, can long
   endure...
*** Conclusion
    ...that government of the people, by the people, for the people,
    shall not perish from the earth.
```

OK, maybe not.

Carsten Dominick, the creator of Org, is an academic
(Astronomy professor), he built in support for \\(\LaTeX\\) from the
beginning.  To use \\(\LaTeX\\) in Org, you simply write latex
and math equations exactly as you would for "normal" \\(\LaTeX\\).
If the back-end exporter (e.g. the \\(\LaTeX\\) exporter or the HTML
exporter) support \\(\LaTeX\\), you just get your nicely formatted
output for free

\begin{multline\*}
p(x) = x^8+x^7+x^6+x^5
\end{multline\*}

Org documents can be easily exported to text (of course),
\\(\LaTeX\\), HTML, .ODF (Microsoft Word compatible) and scores of
others.  Same input.  2 or 3 keystrokes.  Different output.

Org naively supports TODO lists, outlines, agendas, planning (GTD
and similar systems), note taking/knowledge capture, contact
management, calendaring, spreadsheet-like calculations, literate
programming and the list goes on.

Same basic interface.  Same commands.  Not a mouse-over, click or
graphical interface in sight (unless you want it) Just text, all
the way down.

And since it's just text, it can be handled with source code
management tools (git) and of course your favorite text editor.

There are mobile clients ([see Orgzly](https://github.com/orgzly/orgzly-android)) so you can simply push org
text files to your phone with Dropbox or Syncthing and use them
for TODO lists, quick note taking and journal entries, shopping
lists, contact management, schedules, etc.

Oh, and ASCII art is a thing...

```text
                                         /  \ "I'll see you on __
                 /\                     /   /  the text side  /  \
                /  \                   /       of the moon"  /   /
 -------R------/    \                _/_____       _______  /
 -------G-----/    --\-----W------- /       \ / \ /       \/
 -------B----/        \            |   Org   |   |  Mode   |
            /          \            \_______/     \_______/
           -------------
```
<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 1:</span>
  Text Colored Glasses
</div>


## <span class="section-num">13</span> Johnny Cash - "I've seen 'em come and go, and I've seen 'em die.." {#johnny-cash-i-ve-seen-em-come-and-go-and-i-ve-seen-em-die-dot-dot}

-   CompuServe
-   Prodigy
-   BIX
-   GEnie
-   AIM
-   AOL
-   MySpace
-   Google+
-   [Killed By Google](https://killedbygoogle.com/)

    My father spent 25 years working for the Ohio Historical
    Society running the microfilm department.  A lot of that time
    was spent preserving the last remaining copies of 19th and
    20th newspapers that somebody found in Aunt Millie's attic at
    her estate sale.  Save for that, the daily history of Findlay,
    Cadiz, Yellow Springs, Lima and Barberton would have been
    completely lost.  He was preserving important texts.  He was
    preserving, in some cases, the only record of people's lives.
    People's lives matter.

    I began my professional career at CompuServe.  CompuServe had
    vibrant forums where there was lots of interaction, growth and
    history made.  All with text exchanges.   A couple years ago,
    most of that history was flushed because "there was no
    business case for preserving it."

    Companies come and go.  They should not be trusted to preserve
    important texts or to decide which texts are important.  Today
    Facebook and Twitter are censoring content.  How long will
    they be in business? When will they dump text you care about?

    Karl Voit has spelled this out very well in a blog post: [Don't
    Contribute Anything Relevant in Web Forums Like Reddit](https://karl-voit.at/2020/10/23/avoid-web-forums/)

    I am systematically moving my texts off "Big Internet".
    Facebook went (mostly in 2016, completely in 2020).  I've
    stopped posting to Twitter.  Dropbox is gone.  Github (which
    hosts this blog) is next.  Google in progress.  I helped
    create this world, but it's time for a course correction.
    Centralization and mediation of human interaction by
    organizations with nothing but a advertising-driven profit
    motive[^fn:6] is a problem.  We need to move to systems that
    put people first.

    Having recently joined the Mastadon community Fosstodon that
    focuses on Free and Open Source Software, I believe we are
    living in an incredible time where the tools we need for a
    federated, decentralized, ad-free, people-centric world are
    being created...all without even jumping on the
    crypto-currency bandwagon :-).  There are extant/emerging
    solutions for authoring, messaging, social networking,
    distributed source code control and many more.  Herein lies
    another long post, but to me this "feels" very like the early
    days of GNU and Linux.


## <span class="section-num">14</span> Steve Francia - Hugo {#steve-francia-hugo}

One last entry in the things-I-have-used-to-write lineup.  The
Hugo static web site generator is bringing you this blog.

The production of this blog combines many of the technologies
and processes already discussed:

org mode
: The actual source for this blog is a "normal"
    emacs org mode buffer which is exported via the ox-hugo
    backend


\\(\LaTeX\\)
: The ox-hugo exporter deals seamlessly
    with almost all org features, including \\(\LaTeX\\)[^fn:7],
    footnotes, _emphasis_, etc.


Web
: Once the markdown is produced, Hugo does what it does.
    It uses style sheets, templates, themes etc to render the blog
    as HTML served up via a local web server for texting and to be
    pushed to the "live" web serer for production.


Focus on the content
: And all of this is in the "don't worry
    what it looks like, just focus on the content" mode.  With 4
    keystrokes I exported a copy of this post to `.ODT` format so
    my son could review it in word.  A different 4 keystokes
    exports to text or HTML.  I let the back-ends "do the right
    thing" to make it "look good" in the target format.


git
: Once the results are satisfactory, they are "pushed to
    production" via `git push`.  Problems?  Need to back out?
    It's git.   Multiple authors?  It's git.

I described this process in way too much detail already
elsewhere in my blog post on [publishing a blog on Github with
Org and Hugo](https://eludom.github.io/blog/hugo-org-github/).


## <span class="section-num">15</span> George Jones - OK, but did George actually write anything worth reading? {#george-jones-ok-but-did-george-actually-write-anything-worth-reading}

You've read this far on a long blog post :-)

I may have written some things, well, a lot of things.  You can
decide if they are worth reading.

[https://tools.ietf.org/html/rfc3871](https://tools.ietf.org/html/rfc3871)
: RFC3871 was a
    starry-eyed attempt at getting large network equipment vendors
    to, you know, stop using telnet (with plain-text passwords in
    the clear) for management of inconsequential computers like
    the routers that make up the Internet backbone.  It used yet
    another cool text formatting tool, [xml2rfc](https://xml2rfc.tools.ietf.org/).  In my opinion we
    lost the war, e.g. getting security features in important
    devices ... and well ... IOT devices are here now, many using
    the same least-cost TCP/IP stacks that are full of the same
    problems, see
    <https://en.wikipedia.org/wiki/Ripple20>
    and not
    up-gradable.  It looks like the [IETF OPSEC Working Group](https://tools.ietf.org/wg/opsec/charters) that
    that document spawned is still going, pumping out documents,
    and, I'm sure, in the words of Marshall Rose, there have been
    "[Many fine lunches and dinners](http://www.faqs.org/rfcs/rfc3160.html)"


Links to a few pubs, talks, papers, etc
: Because 20 year old
    index.html files never die <http://www.port111.com/george/#pubs>


## <span class="section-num">16</span> Back to paper {#back-to-paper}

I used to have a saying:

> If it requires paper, it's the wrong interface.

I'm backtracking on that.  I journal, on paper, most mornings.
I'm finding that there is a level of creativity, spontaneity and
a kind of catharsis that happens when putting things on paper.
I make non-linear connections that would never be made at a
keyboard.

I'm not sure what that's saying.  Stay open?  Be willing to
re-consider things you've discarded?   There will be no follows.
No likes.  No re-shares.  No chance of going viral.  But its
where I find my thoughts.  Things have come full circle.


## <span class="section-num">17</span> Final thoughts {#final-thoughts}

I hope this has been at least an in interesting read.  I hope it
has provided at least some idea of where we are and how we got
here in terms of technology for putting thoughts on "paper".


## <span class="section-num">18</span> And now, a word from our sponsor... {#and-now-a-word-from-our-sponsor-dot-dot-dot}

\begin{array}{\*{20}c} {x = \frac{{ - b \pm \sqrt {b^2 - 4ac} }}{{2a}}} & {{\rm{when}}} & {ax^2 + bx + c = 0} \\\ \end{array}

[^fn:1]: This was several years before the start of the GNU project.
[^fn:2]: Knuth's _The Art Of Computer Programming_ is available on
    github.  I'm not going to provide a link because when I went there and
    tried to view the site it crashed my browser and nearly froze my
    computer.  My guess is Knuth just did something that was perfectly
    sensible from a theoretical view (maybe creating a 50 gig PDF), but
    which mere software chokes on.  Computer Science classic texts as DOS
    attacks?  Another unintended side effect.  I wonder if [MITRE ATT&amp;CK](https://attack.mitre.org/)
    has mapped that threat yet?
[^fn:3]: And, yes, Tim Berners-Lee was in academic circles then and
    could not have helped knowing about Knuth's WEB ... score naming
    the Word Wide Web as a side effect of a side effect for Knuth?
[^fn:4]: Actually, it's in in an .org format with custom elisp code
    that implements cpp style ifdef logic for producing different
    output for the short resume, the long resume, linkedin, etc. off
    the same source, that creates latex on export which is then run
    through tex and friends to produce a pdf, but shhh.  Pay no
    attention to that man behind the curtain.
[^fn:5]: "Bill Gates and the Nameless Corporate Droids" sounds like a
    fine name for a band, right up there with "The Dead Kennedys"
[^fn:6]: Oppressive governments and various other not-so-friendly
    motivations fall here as well.
[^fn:7]: once the `layout/partials/head.html` was fixed

    Posts 39, 40 and 41 of #100DaysToOffload
    <https://100daystooffload.com/>.  This one was a production. It counts
    for 3.
