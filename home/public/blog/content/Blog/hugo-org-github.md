+++
title = "Publishing a blog on Github with Org and Hugo"
author = ["George M Jones"]
publishDate = 2020-08-16
lastmod = 2023-12-06T05:45:25-05:00
tags = ["geek", "blogging", "org", "emacs", "HOWTO"]
categories = ["blog"]
draft = false
+++

If you ever thought to yourself, "Gee, Emacs Org mode is a great
outlining and authoring tool, and I wish there were a powerful
and simple way use it to publish static websites on github or in
S3 buckets, I wish my blog could look as slick ast
<https://eludom.github.io/>" your're in luck, All but the
_simple_ part.  Here are some of the references I used.

Post 19 of #100DaysToOffload <https://100daystooffload.com/>

<!--more-->


## <span class="section-num">1</span> Potential ox-hugo sites to copy {#potential-ox-hugo-sites-to-copy}


### <span class="section-num">1.1</span> The Art Of Not Asking Why {#the-art-of-not-asking-why}

I started by looking for sample web sites to copy by perusing
the sites on this list
<https://ox-hugo.scripter.co/doc/examples/>

I found the following

Site
: <https://joshrollinswrites.com/>

Source
: <https://github.com/jarss/TAONAW/tree/master>

Josh has been great in answering the odd question.  His blog is
interesting too !!!  He accepts paypal...


## <span class="section-num">2</span> General Info on Hugo, Ox-Hugo and github pages {#general-info-on-hugo-ox-hugo-and-github-pages}

Then I did some reading (this is where the _not simple_ part
comes in) on the following sites

hugo getting started
: <https://gohugo.io/getting-started/quick-start/>

hosting a blog on github pages
: <https://gohugo.io/hosting-and-deployment/hosting-on-github/>

github pages
: <https://pages.github.com/>

HOWTO with Hugo and github pages
: <https://medium.com/swlh/hosting-a-hugo-blog-on-github-pages-with-travis-ci-e74a1d686f10>

Org mode hugo exporter
: <https://ox-hugo.scripter.co/>
    -   I'll probably go here, but it seems like a bit much to start...
    -   Maybe learn the un-automated way first?

About Hugo
: <https://people.umass.edu/weikaichen/post/emacs-ox-hugo/>

About blogging with Hugo
: <https://www.shanesveller.com/blog/2018/02/13/blogging-with-org-mode-and-ox-hugo/>


## <span class="section-num">3</span> The results {#the-results}

You're looking at the results: <https://eludom.github.io/>, this
and other posts.  It took a couple deep dives to understand it,
but I think I more-or-less have it, and it is a very seamless
integration wtih Org-Mode, which for some of us closes the deal
even if there is pain involved


## <span class="section-num">4</span> Bonus: Twitter cards {#bonus-twitter-cards}

And for bonus points I did reading on how to add twitter card
support to ox-hugo bog posts, e.g., so you can write your post
and have twitter or other sites (such as [Mastadon](https://mastodon.social/about)) that
understand the format pull the title, intro and possibly an
image to post in the web sit.


### <span class="section-num">4.1</span> Twitter Cards: HOWTO, the short story {#twitter-cards-howto-the-short-story}

Short version: if you drop `twitter_cards.html` in
`layouts/partials/` of your blog, you then just write your
blog, publish it, and past the URL into the <https://cards-dev.twitter.com/validator>
to make sure it's going to work when posted


### <span class="section-num">4.2</span> Twitter Cards: More than you ever wanted to know, the long story. {#twitter-cards-more-than-you-ever-wanted-to-know-the-long-story-dot}

Twitter Cards
: <https://sproutsocial.com/insights/twitter-cards/>

Twitter cards in ox-hugo
: <https://ox-hugo.scripter.co/doc/org-toc/>

Twitter cards in Hugo
: <https://gohugo.io/templates/internal/>

Twitter cards partials for Hugo
: <https://gohugohq.com/partials/twitter-cards-partials-for-hugo/>

Ttitter card, ox-hugo discussion
: <https://discourse.gohugo.io/t/solved-help-with-twitter-card-image/14067>

about hugo partials
: <https://gohugo.io/templates/partials/>


## <span class="section-num">5</span> How to publish: files, settings, process {#how-to-publish-files-settings-process}

And, finally the gory details of actually publishing.

These are raw/WIP notes, but mostly right.  They actually
publish this blog.


### <span class="section-num">5.1</span> Important Files and Directories {#important-files-and-directories}

/home/gmj/public/github/ox-hugo-blogs/blog/curious.org
: The one file to rule them all
    o This is the blog.  All articles live in this one file as
    separate org trees.   This is the "source".

HUGO_BASE_DIR=/home/gmj/public/github/ox-hugo-blogs/blog
: The root of my blog
    o This is the root/source for the blog.  It gets pushed to
    git@github.com:eludom/blog.git (fetch)

`${HUGO_BASE_DIR}/content/`
: Where local content (markdown) goes,
    e.g. `content/posts/steve.md`

`${HUGO_BASE_DIR}/docs/`
: Where the content to publish (html) goes,


### <span class="section-num">5.2</span> Settings and Organization {#settings-and-organization}


#### <span class="section-num">5.2.1</span> Set EXPORT_HUGO_SECTION {#set-export-hugo-section}

In the .org file that is the blog, set EXPORT_HUGO_SECTION
to be "Blog" (or in whichever section you want posts to land,
default is "posts")

This is inherited lower level headers in org so

```text
** Blog
   :PROPERTIES:
   :EXPORT_HUGO_SECTION: Blog
   :EXPORT_FILE_NAME:
   :EXPORT_HUGO_PUBLISHDATE:
   :END:
```

covers things in

```text
* Content
** Blog
*** Work Stuff
*** PUBLISHED Choosy Programmers Choose GIF :Wilhite:CompuServe:GIF:History:Computers:Emacs:Programming:
```


### <span class="section-num">5.3</span> Processes {#processes}


#### <span class="section-num">5.3.1</span> Drafting {#drafting}

<!--list-separator-->

- <span class="org-todo todo TODO">TODO</span>  start hugo in root directory

    `hugo server -D`

<!--list-separator-->

- <span class="org-todo todo TODO">TODO</span>  Edit curious.org

    Add an entry like this

    ```text
    *** WIP Walled Gardens
        :PROPERTIES:
        :EXPORT_HUGO_SECTION: Blog
        :EXPORT_FILE_NAME: walled-gardens
        :EXPORT_HUGO_PUBLISHDATE: 2020-08-11
        :END:

        This is a brain dump on something like 40 years experience with
        "social media" of various forms.
    ```

    EXPORT_HUGO_SECTION
    : probably not needed if inherited from
        higher level headline

    EXPORT_FILE_NAME
    : The file name for this post.   Could be date.

    EXPORT_HUGO_PUBLISHDATE
    : Set to the date this post should be
        "live".  Can be used to schedule "future" posts.


    IMPORTANT
    : Posts with a status of TODO are drafts.  WIP or
        PUBLISHED are "live"


    EVEN MORE IMPORTANT
    : _A valid Hugo post subtree is an Org
        subtree that has the EXPORT_FILE_NAME property set._  ox-hugo
        only exports valid subtrees to markdown.  You can draft to your
        hearts content in subtrees that do not have EXPORT_FILE_NAME set
        (and maybe export the subtree to text or html to view)

<!--list-separator-->

- <span class="org-todo todo TODO">TODO</span>  Save

    With point in the newly created or updated subtree, save the file.

<!--list-separator-->

- <span class="org-todo todo TODO">TODO</span>  view at <http://localhost:1313/>

    view the drafts <http://localhost:1313/>
    View the result in your browser


#### <span class="section-num">5.3.2</span> Publishing {#publishing}

<!--list-separator-->

-  run hugo

    In the HUGO_BASE_DIR run `hugo`.  The results will be written to
    "doc/".

<!--list-separator-->

-  push to github

    -   I host on github.io.

    <!--listend-->

    ```text
          cd doc
          git add -A
          git commit -m"name of new post"
          git push
    ```


#### <span class="section-num">5.3.3</span> make sure post is live, looks right {#make-sure-post-is-live-looks-right}

-   Go to site: <https://eludom.github.io/>
-   It often takes a minute or so after push for things to show up
    on the web site.  You might have to refresh


#### <span class="section-num">5.3.4</span> Add and push the source {#add-and-push-the-source}

```text
        cd ..
        git status .
        git add [new files]
        git commit -m"name of new post"
```

-   be sure not to add docs/, as that is pushed a a subtree.
-   possibly move the docs/ tree so that is not subsidiary to the root


## <span class="section-num">6</span> Conclusion {#conclusion}

"I mean, why not just use blogger.com or Wordpress"?  Been
there done that.

Companies come and go.  I ought to know.  I started my career
working at CompuServe.  The forums where apparently finally
deleted on 2017.  History was lost.

There are issues of control.  There are the issues of using
tools I like, not the GUI or "download my app" du jour with
tracking, ads, monetization, bloat and more.
