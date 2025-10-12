+++
title = "Selfhosting a Hugo blog with mysocket.io"
author = ["George M Jones"]
publishDate = 2021-11-12
lastmod = 2025-10-12T09:55:23-04:00
tags = ["geek", "blogging", "org", "emacs", "HOWTO"]
categories = ["blog"]
draft = true
+++

...that time when you realize your blog is hosted on a web site who's
sole purpose is to support coding, and they plaster the motto

> "Learn Git and Github without any code!"

all over their site, and you realize that its been
taken over by marketing clones ... and it's time to do your
geekly exit stage left and self host on a raspberry pi or something...

This is a HOWTO of the things I did to migrate my HUGO blog off github
onto a self-hosted raspberry pi using mysocket.io.

The original setup is described here [BROKEN LINK: Blog/hugo-org-github.pre-processed.org]

<!--more-->


## <span class="section-num">1</span> Do normal development with local hugo server {#do-normal-development-with-local-hugo-server}

In =${HUGO_BASE_DIR}

`gmj@ed blog [master] $ hugo server -v -D`

browse to http//localhost:1313 to see updates in realtime.


## <span class="section-num">2</span> Update config.toml {#update-config-dot-toml}

In `${HUGO_BASE_DIR}/config.toml` update the following:

```text
# baseurl = "https://eludom.github.io/"
baseurl = "http://curious.galthub.com/

#homepage = "eludom.github.io"
homepage = "curious.galthub.com"
```


## <span class="section-num">3</span> run hugo to regenerate docs {#run-hugo-to-regenerate-docs}

The `docs/` directory will be the root of your webserver

```text
gmj@ed blog [master] $ hugo
Building sites …

                   | EN
-------------------+------
  Pages            | 210
  Paginator pages  |   0
  Non-page files   |   0
  Static files     |  78
  Processed images |   0
  Aliases          |   0
  Sitemaps         |   1
  Cleaned          |   0

Total in 2718 ms
gmj@ed blog [master] $ find . -mtime -^C
gmj@ed blog [master] $ hugo server -v -D^C
gmj@ed blog [master] $ find . -mtime -5 | head
.
./.#curious.org
./curious.org
./docs/index.html
./docs/404.html
./docs/robots.txt
./docs/about/index.html
./docs/about/index.xml
./docs/sitemap.xml
./docs/tags/poetry/index.html
...
```


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">4</span> Copy the files to where the web server is (if needed) {#copy-the-files-to-where-the-web-server-is--if-needed}

Which server...

```text
rsync -Cavz docs gmj@hangout:~/blog
```


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">5</span> Run local webserver {#run-local-webserver}

Run a web server with the root pointed at the `docs/` directory

```text
$ cd ~/blog/docs/
$ python3 -m http.server 1313
```


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">6</span> Set up tunnel {#set-up-tunnel}

Set up a tunnel

`$ mysocketctl connect --port 1313 --name hugo test`


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">7</span> Define CNAME {#define-cname}

...


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">8</span> Add the CNAME to the allowed domain names for the tunnel {#add-the-cname-to-the-allowed-domain-names-for-the-tunnel}

...


## <span class="section-num">9</span> DONE install apache on raspberry pi using asnible {#done-install-apache-on-raspberry-pi-using-asnible}


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">10</span> Make sure apache root is on USB thumb drive {#make-sure-apache-root-is-on-usb-thumb-drive}


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">11</span> copy/rsync blog/docs to new apache root {#copy-rsync-blog-docs-to-new-apache-root}

-   cron?
-   Or use sshfs mounting from ed to hangout?


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">12</span> redirect apache root to blog {#redirect-apache-root-to-blog}


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">13</span> set up a new mysocket tunnel for blog/apache {#set-up-a-new-mysocket-tunnel-for-blog-apache}


## <span class="org-todo todo TODO">TODO</span> <span class="section-num">14</span> set up CNAME curious.galthub.com pointing at tunnel {#set-up-cname-curious-dot-galthub-dot-com-pointing-at-tunnel}


#### <span class="section-num">14.0.1</span> Test it out {#test-it-out}

curl <http://curious.port111.com>


#### <span class="section-num">14.0.2</span> Future {#future}

<!--list-separator-->

-  archive.org?

<!--list-separator-->

-  CDN ?
