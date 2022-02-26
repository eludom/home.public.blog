+++
title = ".bashrc as literate programming"
author = ["George Jones"]
publishDate = 2020-12-05
lastmod = 2022-02-26T08:55:33-05:00
tags = ["geek", "howto", "emacs", "100DaysToOffload"]
categories = ["blog"]
draft = false
+++

## <span class="section-num">1</span> Knuth gets annoyed at his publishers, \\(\TeX\\) is born. {#knuth-gets-annoyed-at-his-publishers-tex-is-born-dot}

Back in the late 70s Donald Knuth who was (and still is) publishing a
seminal series of Computer Science text books got annoyed at the
typesetting, layouts and font choices he was being presented by
publishers.   So he did what any self-respecting hacker who happened
to be Donald Knuth would do: he created his own typesetting system
called \\(\TeX\\) which (along with \\(\LaTeX\\) which borrowed heavily from SCRIBE)
is something of a standard to this day in academic publishing.

Because, you know, why is it unreasonable to expect publishers to
render simple equations, right?

\begin{multline\*}
\vec{E}\_{\mathrm{tot}}=
  q\cdot k\_{b}\cdot \dfrac{r}{r^3}
  \left\lgroup
    \frac{\hat{r}-\left(\dfrac{d}{2\cdot r}\right)\hat{d}}
         {\biggl(1+\left(\dfrac{d}{2\cdot r}\right)^2-
                   \left(\dfrac{d}{r}\right)\hat{r}\cdot\hat{d}\cdot\cos(\theta)
          \biggr)^{3/2}}
  \right.
  \\\\
  \left.
    {}-
    \frac{\hat{r}+\left(\dfrac{d}{2\cdot r}\right)\hat{d}}
         {\biggl(1+\left(\dfrac{d}{2\cdot r}\right)^2+
                   \left(\dfrac{d}{r}\right)\cdot\hat{r}\cdot\hat{d}\cdot\cos(\theta)
          \biggr)^{3/2}}
  \right\rgroup
\end{multline\*}

<style>.org-center { margin-left: auto; margin-right: auto; text-align: center; }</style>

<div class="org-center">

<https://tex.stackexchange.com/questions/371644/how-to-write-this-long-equation>

</div>

But wait, there's more.

<!--more-->


## <span class="section-num">2</span> Literate Programming {#literate-programming}

In addition to writing his own typesetting system, he came up with the
concept of _Literate Programming_ at the same time.   The basic idea
is that you write for humans to read (e.g. text books) with a
side-effect of outputting code (for machines to execute).   It is the
ultimate in software documentation.   The code and the description are
an integrated whole with different processes, "tangle", to produce code
and "weave"[^fn:1], to produce output for humans

I've been influenced by the concept of _Literate Programming_ ever
since I installed the original TeX (and LaTex) on CompuServe's DEC10s.


## <span class="section-num">3</span> The children of tangle and weave - Org, Babel, Jupyter and Zepplin {#the-children-of-tangle-and-weave-org-babel-jupyter-and-zepplin}

Fast forward a few decades.  Carsten Dominick creates org mode for
Emacs to organize, well, everything which, of course, has a back end
to output .tex files.   Eric Schulte then has the bright ideas of
creating org-babel, which allows small (or not so small) blocks of
code to be imbedded in org files and executed with their output
becoming part of the document.   Literate programming, here were are,
again....oh, and it's a tool for doing reproducible scientific
research as well where the data, code, descriptions of experiments and
results/conclusions are all one document:

<https://www.jstatsoft.org/article/view/v046i03>

Jupyter and Zeppelin notebooks provide similar functionality today for
Python, Spark, Scala and the data science community, but Knuth was
there 40 years ago.


## <span class="section-num">4</span> George gets annoyed at a complicated .bashrc, .bashrc.org is born {#george-gets-annoyed-at-a-complicated-dot-bashrc-dot-bashrc-dot-org-is-born}

Which brings me to my own humble annoyances which are not likely to
change the course of science or academic publishing...

As a nearly lifelong emacs user I am mildly annoyed any time I have to do
something that can't be done in emacs in general, and have been
particularly annoyed at the growing complexity of my `.bashrc` file
which could not be organize and documented in org mode....until now.


## <span class="section-num">5</span> EmacsConf 2020 talk: README Driven Design {#emacsconf-2020-talk-readme-driven-design}

A talk at EmacsConf 2020 reminded me that Org mode can be used
directly for literate programming.

Test Driven Design (TDD) had been a concept for a while: write
your tests first, once your code passes, you're done.  Find a
bug, write a new test, code until it passes.

"README Driven Design" continues in the same vein.  Often
programmers will wait to the end to write their documentation,
install notes, user guide etc.  What this talk advocates is to
use literate programming and to _start_ the README.org, which,
given Org babel, could be the whole application, including TDD
scripts.  See. Emacs does subsume all, did you notice how TDD
just got swallowed up without missing a step?  See the blog post
summarizing the talk at
[http://adamard.com/literate_programming.html](http://adamard.com/literate_programming.html)


## <span class="section-num">6</span> 1 - My .bashrc as literate programming {#1-my-dot-bashrc-as-literate-programming}

What follows are three different versions of my (457 line)
`.bashrc` file.

The first is the version for-human-consumption, complete with
comments, descriptions, useful font highlighting and actual text
blocked out. In Knuth's terms, this is the "weave" output.

The second is the .bashrc that actually gets executed by bash.
This is the "tangle" output.

The last is the org mode source from which both preceding
versions used as input.


### <span class="section-num">6.1</span> 1.1 - My .bashrc - weave output for humans {#1-dot-1-my-dot-bashrc-weave-output-for-humans}

Here is the human-readable .bashrc file with comments, etc.


#### <span class="section-num">6.1.1</span> About this .bashrc file {#about-this-dot-bashrc-file}

<!--list-separator-->

-  Intro

    This is George Jones' .bashrc file as an literate programming file in
    emacs org mode using babel blocks.

<!--list-separator-->

-  To generate the actual .bashrc

    This .bashrc.org file must be processed to generate the actual
    .bashrc It can be processed interactively to generate .bashrc via
    org-babel-tangle-file or from the command line as

    ```text
      emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file ".bashrc.org")'
    ```

    Permanent changes must be made to the .org version, as the actual
    .bashrc will be overwritten when the .org version is "compiled"

<!--list-separator-->

-  Debugging

    In most bash files I do

    ```text
      set -e
      set -u
    ```

    but there are problems setting it in .bashrc.   An error then causes
    you to exit the shell entirely (not what you want), and there are
    several constructs that cause warnings due to undefined variables
    (these can/probably should be fixd)

    Set

    ```text
      export DEBUG=1
    ```

    to enable debugging output from the debug helper function.


#### <span class="section-num">6.1.2</span> The actual executable .bashrc {#the-actual-executable-dot-bashrc}

<!--list-separator-->

-  Helper functions

    I define a few syslog-ish helper functions to print warnings,
    errors, etc.

    ```shell
      #PROG=`basename "$0" | tr -d '\n'`  # normal setting
      PROG="bashrc" # setting for bashrc due to errors

      function info()  { echo ${PROG}\: info: "$@" 1>&2; }
      function warn()  { echo ${PROG}\: warning: "$@" 1>&2; }
      function error() { echo ${PROG}\: error: "$@" 1>&2; }
      function debug() { [[ -v DEBUG ]] && echo ${PROG}\: debug: "$@" 1>&2 || true ; }
      function die()   { echo ${PROG}\: fatal: "$@" 1>&2 && exit 1; }
    ```

<!--list-separator-->

-  Set a reasonable default prompt

    Here I set a reasonable default prompt that includes timestamp,
    username, host and current directory:

    ```shell
    export PS1="\# [\t] \u@\h \W/ $ "
    ```

<!--list-separator-->

-  Misc aliases

    Define various aliases that I use

    ```shell
      alias rm='	rm -i'
      alias ag='	alias | grep -i'
      alias eg='	printenv | grep -i'
      alias hg='	history | grep -i'
      alias ht='	history | tail'
      alias fpg='	find . -print | egrep -i'
      alias egi='	egrep -i'
      alias psg='	/bin/ps -auxww | grep'
      alias p8='	ping -c 3 8.8.8.8' # make sure routing works
      alias pp='	ping -c 3 port111.com' # make sure dns and routing work
      alias locate='locate -r'
    ```

<!--list-separator-->

-  cd commands that use/print the directory stack

    These aliases support pushd_popd_dirs like functionality while
    listing one directory per line

    I like to keep a "stack" of directories so I can work on one thing
    then "pop" back to where I was.   `pushd` an `popd` support this,
    and `dirs` lists the directories, but I prefer to have them listed
    one per line.

    ```shell
      function dirl() {
          # "DIR"ectory "L"ist directory stack, one per line
          # Usage: dirl

          for d in `dirs`; do echo $d; done
      }

      function dirc() {
          # "DIR"ectory "C"onnect - connect to directory and list stack
          # Usage: dirc [DIR

          pushd ${1:-"$HOME"} > /dev/null
          dirl
      }

      function dirp () {
          # "DIR"ectory "P"op - pop N entries off the directory stack
          # Usage: dirp [N]
          #
          # OLD:
          #   alias  dirp='popd > /dev/null && dirl'
          for i in `seq ${1:-"1"}`; do
              debug "dirl: popd. i is $i"
              popd > /dev/null;
          done
          dirl
      }

      alias cd=pushd
    ```

<!--list-separator-->

-  Misc functions

    ```shell

      function gf() {
      # grep-find: grep for patterins in files via find
      #
      # Usage: gf patterns [files [days]]
      #
      # Examples:
      #   gf findMeAnywhere
      #   gf findMeInTextFiles '*.txt'
      #   gf findMeInTextFiles .txt
      #   gf BEGIN\|END .org 30

      local files=""
      local days="365"

      set -o noglob

      # First arg is pattern(s) for egrep
      if [ -z ${1+x} ]; then
        echo 'gf needs string(s) to search for ' 1>&2
        info "Usage: gf patterns [files [days]]"
        return 1
      fi

      # Second arg (if present) is files for find.  No globbing, so "*.txt" OK
      if [ ! -z ${2+x} ]; then
        if [[ "$2" =~ ^\. ]]; then
          # Special case: treat ".foo" as "*.foo"
          # Avoids needing to quote on command line
          files="-name *$2"
        else
          files="-name ${2}"
        fi
      fi

      # $3 (if present) is find -mtime arg, default 365
      if [ ! -z ${3+x} ]; then
        days="${3}"
      fi

      # set -x
      find . -type f -mtime -${days} $files -exec egrep --color -H -i "${1}" \{\} \;
      # set +x

      set +o noglob
      }
    ```

<!--list-separator-->

-  Bash history functions and settings

    ```shell

      # Preserve history across sesssions
      #
      # http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
      #
      export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
      export HISTSIZE=100000                   # big big history
      export HISTFILESIZE=100000               # big big history
      shopt -s histappend                      # append to history, don't overwrite it

      # Save and reload the history after each command finishes
      export PROMPT_COMMAND="history -a; history -c; history -r;"


      function hgt() {
          # hgt == "history grep (for arg) tail"
          #echo "Histroy Grep tail"

          if [ -z ${1+x} ]; then
              echo 'hgt needs an argument' 1>&2
              return 1
          fi

          history | grep -i "$1" | tail
          return 0
      }
    ```

<!--list-separator-->

-  Set the hostnane, timezone and local

    Set HOSTNAME if ~/etc/hostname exists

    ```shell
       if [ -e ${HOME}/etc/hostname ]; then
           export HOSTNAME=`cat ${HOME}/etc/hostname`
       elif [ -e /etc/hostname ]; then
           export HOSTNAME=`cat /etc/hostname`
       else
           export HOSTNAME="unknown"
       fi

       # Set timezone if ~/bin/tz.sh exists

       # NEW, if neeeed?
       #
       # https://linuxize.com/post/how-to-set-or-change-timezone-in-linux/
       #
       # OLD:
       #
       # if [ -e ~/bin/tz.sh ]; then
       #     echo Setting timezone.
       #     source ~/bin/tz.sh # should be in ~/rc.local
       # fi

       # STILL NEEDED?
       #
       # Set local for numeric output
       LOCAL=`locale -a | grep -i en_us | head -1`
       if [[ "$LOCAL" != "" ]]; then export LC_NUMERIC="$LOCAL"; fi
    ```

<!--list-separator-->

-  Set up ssh agent

    Add keys by hand if needed via

    ```text
       ssh-add ~/.ssh/id_*
    ```

    ```shell
       if [ -e ~/bin/sshagent ]; then
           source ~/bin/sshagent
       fi
    ```

<!--list-separator-->

-  Copy stdin to clipboard

    ```shell
       if [[ "$OSTYPE" == "linux-gnu"* ]]; then
         alias 2clip='xclip -selection c'
         alias 3clip='printf %s "$(cat /dev/stdin)" | xclip -selection c'  # no final \n
       elif [[ "$OSTYPE" == "darwin"* ]]; then
         alias 2clip='pbcopy'
       fi
    ```

<!--list-separator-->

-  Path functions

    These path\* functions add and remove elements to PATH.
    They insure that entries are unique.
    They allow you to place a path first or last in the order (e.g.
    so that `~/bin` comes before `/usr/local/bin`)

    ```shell
      pathrm() {
          # remove an item from the path
          if [ -d "$1" ]; then
              removeThis="`echo $1 | sed -e 's#/#\\\/#'g`"
              newPath=`echo $PATH | awk -v RS=: -v ORS=: "/$removeThis/ {next} {print}" | sed 's/[ :]*$//g'`
              export PATH=$newPath
          fi
      }


      pathlast() {
          # add path to the end if not there
          if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
              export PATH="${PATH:+"$PATH:"}$1"
          fi
      }


      pathfirst() {
          # add path to the front if not there
          if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
              export PATH="$1:${PATH}"
          fi
      }

      path() {
        # show path
        echo $PATH
      }

      # show path, one entry per line
      alias pathcat="echo $PATH | sed 's/:/\n/g'"


      # Be sure we have a few specific paths if they exist

      pathlast $HOME/bin
      pathlast /usr/local/bin
      pathlast /opt/bin
    ```

<!--list-separator-->

-  source ~/rc.local/\*.sh to do non-general bash setup

    Execute any .sh files in ~/rc.local/\*.sh

    This allows me to split out setup for aliases and commands that
    only get used on certian systems or in certian contexts (git, go,
    mail, blog..)

    ```shell

       if [ -d ${HOME}/rc.local ]; then
           for rcfile in $(find ${HOME}/rc.local -name \*.sh); do
               debug running localrc ${rcfile}
               source ${rcfile}
           done
       fi
    ```

<!--list-separator-->

-  Invoking emacs

    ```shell
       alias emacs='setsid emacs'

       # from http://stuff-things.net/2014/12/16/working-with-emacsclient/

       if [ -z "$SSH_CONNECTION" ]; then
           export EMACSCLIENT=emacsclient
           alias ec="$EMACSCLIENT -c -n"
           export EDITOR="$EMACSCLIENT -c"
           export ALTERNATE_EDITOR=""
       else
           export EDITOR=$(type -P emacs || type -P ed)
       fi
       export VISUAL=$EDITOR
    ```

<!--list-separator-->

-  ls aliases

    ```shell

       # coloring for ls functions

       if [[ "$OSTYPE" == "linux-gnu" ]]; then
           color="--color";
       else
           color=""
       fi

       BIN_LS=/bin/ls
       alias ls='	ls '$color' -a'


       # Long List Reverse Tail
       function llrt() { ls -lrt $color ${*:-}; }

       # Long List Time
       function llt() { ls -lt $color ${*:-}; }

       # Long List Time, More
       function lltm() { ls -lt $color ${*:-} | more; }

       # Long List Time, Less
       function lltl() { ls -alt $color ${*:-} | more; }

       # Long List Time, Head
       function llth() { ls -lt $color ${*:-} | head; }

       # Long List Time, Tail
       function lltt() { ls -alt $color ${*:-} | tail; }


       # List Sort Size
       function lss() { ls -a1s $color ${*:-} | sort -n; }

       # List Sort Size Reverse
       function lssr() { ls -a1s $color ${*:-} | sort -nr; }
    ```

<!--list-separator-->

-  Aliases for viewing the newest file in a directoy

    ```shell

       function nf ()
       {
           # list the newest file in the current directory
           NF=`find ${1:-.} -maxdepth 1 -type f -print0 | xargs -0 ls -1t  |  head -1;`;
           echo ${NF:-/dev/null} | sed "s/ /\\\ /g"
       }


       # new file tail file
       function nftf { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs tail -f  ; }

       # new file tail
       function nft { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs tail  ; }

       # new file head
       function nfh { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs head  ; }

       # new file less
       function nfl { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs less  ; }

       # new file cat
       function nfc { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs cat  ; }

       # new file ls
       function nfls { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs ls -A1t  ; }

       # new file ls -l
       function nflsl { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs
       ls -Atl  ; }
    ```

<!--list-separator-->

-  viewing files

    Notes on setting up file/mime type associations can be found at

    <https://unix.stackexchange.com/questions/77136/xdg-open-default-applications-behavior>

    So, to make emacs (what else?) the default for MIME type
    `text/plain` ...

    ```text
       locate -r 'emacs.*\.desktop'
       xdg-mime default emacs.desktop text/plain
    ```

    ```shell
       if [[  ! -z "`which xdg-open`" ]]; then alias open='xdg-open '; fi
    ```

<!--list-separator-->

-  All done

    ```shell
       touch $HOME/.bashrc-ran
       debug ".bashrc done"
    ```


### <span class="section-num">6.2</span> 1.2 - My .bashrc - tangle output for computers {#1-dot-2-my-dot-bashrc-tangle-output-for-computers}

Here is the actual .bashrc file for bash(1) to consume

```bash
#PROG=`basename "$0" | tr -d '\n'`  # normal setting
PROG="bashrc" # setting for bashrc due to errors

function info()  { echo ${PROG}\: info: "$@" 1>&2; }
function warn()  { echo ${PROG}\: warning: "$@" 1>&2; }
function error() { echo ${PROG}\: error: "$@" 1>&2; }
function debug() { [[ -v DEBUG ]] && echo ${PROG}\: debug: "$@" 1>&2 || true ; }
function die()   { echo ${PROG}\: fatal: "$@" 1>&2 && exit 1; }

export PS1="\# [\t] \u@\h \W/ $ "

alias rm='	rm -i'
alias ag='	alias | grep -i'
alias eg='	printenv | grep -i'
alias hg='	history | grep -i'
alias ht='	history | tail'
alias fpg='	find . -print | egrep -i'
alias egi='	egrep -i'
alias psg='	/bin/ps -auxww | grep'
alias p8='	ping -c 3 8.8.8.8' # make sure routing works
alias pp='	ping -c 3 port111.com' # make sure dns and routing work
alias locate='locate -r'

function dirl() {
    # "DIR"ectory "L"ist directory stack, one per line
    # Usage: dirl

    for d in `dirs`; do echo $d; done
}

function dirc() {
    # "DIR"ectory "C"onnect - connect to directory and list stack
    # Usage: dirc [DIR

    pushd ${1:-"$HOME"} > /dev/null
    dirl
}

function dirp () {
    # "DIR"ectory "P"op - pop N entries off the directory stack
    # Usage: dirp [N]
    #
    # OLD:
    #   alias  dirp='popd > /dev/null && dirl'
    for i in `seq ${1:-"1"}`; do
        debug "dirl: popd. i is $i"
        popd > /dev/null;
    done
    dirl
}

alias cd=pushd

function gf() {
# grep-find: grep for patterins in files via find
#
# Usage: gf patterns [files [days]]
#
# Examples:
#   gf findMeAnywhere
#   gf findMeInTextFiles '*.txt'
#   gf findMeInTextFiles .txt
#   gf BEGIN\|END .org 30

local files=""
local days="365"

set -o noglob

# First arg is pattern(s) for egrep
if [ -z ${1+x} ]; then
  echo 'gf needs string(s) to search for ' 1>&2
  info "Usage: gf patterns [files [days]]"
  return 1
fi

# Second arg (if present) is files for find.  No globbing, so "*.txt" OK
if [ ! -z ${2+x} ]; then
  if [[ "$2" =~ ^\. ]]; then
    # Special case: treat ".foo" as "*.foo"
    # Avoids needing to quote on command line
    files="-name *$2"
  else
    files="-name ${2}"
  fi
fi

# $3 (if present) is find -mtime arg, default 365
if [ ! -z ${3+x} ]; then
  days="${3}"
fi

# set -x
find . -type f -mtime -${days} $files -exec egrep --color -H -i "${1}" \{\} \;
# set +x

set +o noglob
}

# Preserve history across sesssions
#
# http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
#
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r;"


function hgt() {
    # hgt == "history grep (for arg) tail"
    #echo "Histroy Grep tail"

    if [ -z ${1+x} ]; then
        echo 'hgt needs an argument' 1>&2
        return 1
    fi

    history | grep -i "$1" | tail
    return 0
}

if [ -e ${HOME}/etc/hostname ]; then
    export HOSTNAME=`cat ${HOME}/etc/hostname`
elif [ -e /etc/hostname ]; then
    export HOSTNAME=`cat /etc/hostname`
else
    export HOSTNAME="unknown"
fi

# Set timezone if ~/bin/tz.sh exists

# NEW, if neeeed?
#
# https://linuxize.com/post/how-to-set-or-change-timezone-in-linux/
#
# OLD:
#
# if [ -e ~/bin/tz.sh ]; then
#     echo Setting timezone.
#     source ~/bin/tz.sh # should be in ~/rc.local
# fi

# STILL NEEDED?
#
# Set local for numeric output
LOCAL=`locale -a | grep -i en_us | head -1`
if [[ "$LOCAL" != "" ]]; then export LC_NUMERIC="$LOCAL"; fi

if [ -e ~/bin/sshagent ]; then
    source ~/bin/sshagent
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias 2clip='xclip -selection c'
  alias 3clip='printf %s "$(cat /dev/stdin)" | xclip -selection c'  # no final \n
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias 2clip='pbcopy'
fi

pathrm() {
    # remove an item from the path
    if [ -d "$1" ]; then
        removeThis="`echo $1 | sed -e 's#/#\\\/#'g`"
        newPath=`echo $PATH | awk -v RS=: -v ORS=: "/$removeThis/ {next} {print}" | sed 's/[ :]*$//g'`
        export PATH=$newPath
    fi
}


pathlast() {
    # add path to the end if not there
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    fi
}


pathfirst() {
    # add path to the front if not there
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1:${PATH}"
    fi
}

path() {
  # show path
  echo $PATH
}

# show path, one entry per line
alias pathcat="echo $PATH | sed 's/:/\n/g'"


# Be sure we have a few specific paths if they exist

pathlast $HOME/bin
pathlast /usr/local/bin
pathlast /opt/bin

if [ -d ${HOME}/rc.local ]; then
    for rcfile in $(find ${HOME}/rc.local -name \*.sh); do
        debug running localrc ${rcfile}
        source ${rcfile}
    done
fi

alias emacs='setsid emacs'

# from http://stuff-things.net/2014/12/16/working-with-emacsclient/

if [ -z "$SSH_CONNECTION" ]; then
    export EMACSCLIENT=emacsclient
    alias ec="$EMACSCLIENT -c -n"
    export EDITOR="$EMACSCLIENT -c"
    export ALTERNATE_EDITOR=""
else
    export EDITOR=$(type -P emacs || type -P ed)
fi
export VISUAL=$EDITOR

# coloring for ls functions

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    color="--color";
else
    color=""
fi

BIN_LS=/bin/ls
alias ls='	ls '$color' -a'


# Long List Reverse Tail
function llrt() { ls -lrt $color ${*:-}; }

# Long List Time
function llt() { ls -lt $color ${*:-}; }

# Long List Time, More
function lltm() { ls -lt $color ${*:-} | more; }

# Long List Time, Less
function lltl() { ls -alt $color ${*:-} | more; }

# Long List Time, Head
function llth() { ls -lt $color ${*:-} | head; }

# Long List Time, Tail
function lltt() { ls -alt $color ${*:-} | tail; }


# List Sort Size
function lss() { ls -a1s $color ${*:-} | sort -n; }

# List Sort Size Reverse
function lssr() { ls -a1s $color ${*:-} | sort -nr; }

function nf ()
{
    # list the newest file in the current directory
    NF=`find ${1:-.} -maxdepth 1 -type f -print0 | xargs -0 ls -1t  |  head -1;`;
    echo ${NF:-/dev/null} | sed "s/ /\\\ /g"
}


# new file tail file
function nftf { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs tail -f  ; }

# new file tail
function nft { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs tail  ; }

# new file head
function nfh { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs head  ; }

# new file less
function nfl { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs less  ; }

# new file cat
function nfc { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs cat  ; }

# new file ls
function nfls { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs ls -A1t  ; }

# new file ls -l
function nflsl { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs
ls -Atl  ; }

if [[  ! -z "`which xdg-open`" ]]; then alias open='xdg-open '; fi

touch $HOME/.bashrc-ran
debug ".bashrc done"
```


### <span class="section-num">6.3</span> 1.3 - My .bashrc - The org mode source file {#1-dot-3-my-dot-bashrc-the-org-mode-source-file}

Here is the .bash.org input file

```org
#+title: .bashrc
#+date: <2020-12-06 03:13:07 Sunday>
#+author: George M Jones
#+email: gmj@pobox.com
#+options: ':nil *:t -:t ::t <:t H:3 \n:nil ^:nil arch:headline
#+options: author:t broken-links:nil c:nil creator:nil
#+options: d:(not "LOGBOOK") date:t e:t email:nil f:t inline:t num:2
#+options: p:nil pri:nil prop:nil stat:t tags:t tasks:t tex:t
#+options: timestamp:t title:t toc:t todo:t |:t
#+language: en
#+select_tags: export
#+exclude_tags: noexport
#+creator: Emacs 28.0.50 (Org mode 9.4)


* About this .bashrc file
** Intro
   This is George Jones' .bashrc file as an literate programming file in
   emacs org mode using babel blocks.

** To generate the actual .bashrc
   This .bashrc.org file must be processed to generate the actual
   .bashrc It can be processed interactively to generate .bashrc via
   org-babel-tangle-file or from the command line as

   #+begin_example
  emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file ".bashrc.org")'
   #+end_example

   Permanent changes must be made to the .org version, as the actual
   .bashrc will be overwritten when the .org version is "compiled"

** Debugging

  In most bash files I do

  #+begin_example
  set -e
  set -u
  #+end_example

  but there are problems setting it in .bashrc.   An error then causes
  you to exit the shell entirely (not what you want), and there are
  several constructs that cause warnings due to undefined variables
  (these can/probably should be fixd)

  Set

  #+begin_example
  export DEBUG=1
  #+end_example

  to enable debugging output from the debug helper function.

* The actual executable .bashrc
** Helper functions
   I define a few syslog-ish helper functions to print warnings,
   errors, etc.

   #+begin_src shell :tangle .bashrc :noweb no-export
  #PROG=`basename "$0" | tr -d '\n'`  # normal setting
  PROG="bashrc" # setting for bashrc due to errors

  function info()  { echo ${PROG}\: info: "$@" 1>&2; }
  function warn()  { echo ${PROG}\: warning: "$@" 1>&2; }
  function error() { echo ${PROG}\: error: "$@" 1>&2; }
  function debug() { [[ -v DEBUG ]] && echo ${PROG}\: debug: "$@" 1>&2 || true ; }
  function die()   { echo ${PROG}\: fatal: "$@" 1>&2 && exit 1; }
   #+end_src

** Set a reasonable default prompt

   Here I set a reasonable default prompt that includes timestamp,
   username, host and current directory:

 #+begin_src shell :tangle .bashrc :noweb no-export
export PS1="\# [\t] \u@\h \W/ $ "
 #+end_src

** Misc aliases

   Define various aliases that I use

   #+begin_src shell :tangle .bashrc :noweb no-export
  alias rm='	rm -i'
  alias ag='	alias | grep -i'
  alias eg='	printenv | grep -i'
  alias hg='	history | grep -i'
  alias ht='	history | tail'
  alias fpg='	find . -print | egrep -i'
  alias egi='	egrep -i'
  alias psg='	/bin/ps -auxww | grep'
  alias p8='	ping -c 3 8.8.8.8' # make sure routing works
  alias pp='	ping -c 3 port111.com' # make sure dns and routing work
  alias locate='locate -r'
   #+end_src

** cd commands that use/print the directory stack

   These aliases support pushd/popd/dirs like functionality while
   listing one directory per line

   I like to keep a "stack" of directories so I can work on one thing
   then "pop" back to where I was.   =pushd= an =popd= support this,
   and =dirs= lists the directories, but I prefer to have them listed
   one per line.


   #+begin_src shell :tangle .bashrc :noweb no-export
  function dirl() {
      # "DIR"ectory "L"ist directory stack, one per line
      # Usage: dirl

      for d in `dirs`; do echo $d; done
  }

  function dirc() {
      # "DIR"ectory "C"onnect - connect to directory and list stack
      # Usage: dirc [DIR

      pushd ${1:-"$HOME"} > /dev/null
      dirl
  }

  function dirp () {
      # "DIR"ectory "P"op - pop N entries off the directory stack
      # Usage: dirp [N]
      #
      # OLD:
      #   alias  dirp='popd > /dev/null && dirl'
      for i in `seq ${1:-"1"}`; do
          debug "dirl: popd. i is $i"
          popd > /dev/null;
      done
      dirl
  }

  alias cd=pushd
   #+end_src

** Misc functions

   #+begin_src shell :tangle .bashrc :noweb no-export

  function gf() {
  # grep-find: grep for patterins in files via find
  #
  # Usage: gf patterns [files [days]]
  #
  # Examples:
  #   gf findMeAnywhere
  #   gf findMeInTextFiles '*.txt'
  #   gf findMeInTextFiles .txt
  #   gf BEGIN\|END .org 30

  local files=""
  local days="365"

  set -o noglob

  # First arg is pattern(s) for egrep
  if [ -z ${1+x} ]; then
    echo 'gf needs string(s) to search for ' 1>&2
    info "Usage: gf patterns [files [days]]"
    return 1
  fi

  # Second arg (if present) is files for find.  No globbing, so "*.txt" OK
  if [ ! -z ${2+x} ]; then
    if [[ "$2" =~ ^\. ]]; then
      # Special case: treat ".foo" as "*.foo"
      # Avoids needing to quote on command line
      files="-name *$2"
    else
      files="-name ${2}"
    fi
  fi

  # $3 (if present) is find -mtime arg, default 365
  if [ ! -z ${3+x} ]; then
    days="${3}"
  fi

  # set -x
  find . -type f -mtime -${days} $files -exec egrep --color -H -i "${1}" \{\} \;
  # set +x

  set +o noglob
  }
 #+end_src

** Bash history functions and settings
   #+begin_src shell :tangle .bashrc :noweb no-export

  # Preserve history across sesssions
  #
  # http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
  #
  export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
  export HISTSIZE=100000                   # big big history
  export HISTFILESIZE=100000               # big big history
  shopt -s histappend                      # append to history, don't overwrite it

  # Save and reload the history after each command finishes
  export PROMPT_COMMAND="history -a; history -c; history -r;"


  function hgt() {
      # hgt == "history grep (for arg) tail"
      #echo "Histroy Grep tail"

      if [ -z ${1+x} ]; then
          echo 'hgt needs an argument' 1>&2
          return 1
      fi

      history | grep -i "$1" | tail
      return 0
  }
   #+end_src

** Set the hostnane, timezone and local
   Set HOSTNAME if ~/etc/hostname exists

   #+begin_src shell :tangle .bashrc :noweb no-export
   if [ -e ${HOME}/etc/hostname ]; then
       export HOSTNAME=`cat ${HOME}/etc/hostname`
   elif [ -e /etc/hostname ]; then
       export HOSTNAME=`cat /etc/hostname`
   else
       export HOSTNAME="unknown"
   fi

   # Set timezone if ~/bin/tz.sh exists

   # NEW, if neeeed?
   #
   # https://linuxize.com/post/how-to-set-or-change-timezone-in-linux/
   #
   # OLD:
   #
   # if [ -e ~/bin/tz.sh ]; then
   #     echo Setting timezone.
   #     source ~/bin/tz.sh # should be in ~/rc.local
   # fi

   # STILL NEEDED?
   #
   # Set local for numeric output
   LOCAL=`locale -a | grep -i en_us | head -1`
   if [[ "$LOCAL" != "" ]]; then export LC_NUMERIC="$LOCAL"; fi
   #+end_src

** Set up ssh agent
   Add keys by hand if needed via

   #+begin_example
   ssh-add ~/.ssh/id_*
   #+end_example

   #+begin_src shell :tangle .bashrc :noweb no-export
   if [ -e ~/bin/sshagent ]; then
       source ~/bin/sshagent
   fi
   #+end_src

** Copy stdin to clipboard

   #+begin_src shell :tangle .bashrc :noweb no-export
   if [[ "$OSTYPE" == "linux-gnu"* ]]; then
     alias 2clip='xclip -selection c'
     alias 3clip='printf %s "$(cat /dev/stdin)" | xclip -selection c'  # no final \n
   elif [[ "$OSTYPE" == "darwin"* ]]; then
     alias 2clip='pbcopy'
   fi
   #+end_src

** Path functions
  These path* functions add and remove elements to PATH.
  They insure that entries are unique.
  They allow you to place a path first or last in the order (e.g.
  so that =~/bin= comes before =/usr/local/bin=)

  #+begin_src shell :tangle .bashrc :noweb no-export
  pathrm() {
      # remove an item from the path
      if [ -d "$1" ]; then
          removeThis="`echo $1 | sed -e 's#/#\\\/#'g`"
          newPath=`echo $PATH | awk -v RS=: -v ORS=: "/$removeThis/ {next} {print}" | sed 's/[ :]*$//g'`
          export PATH=$newPath
      fi
  }


  pathlast() {
      # add path to the end if not there
      if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
          export PATH="${PATH:+"$PATH:"}$1"
      fi
  }


  pathfirst() {
      # add path to the front if not there
      if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
          export PATH="$1:${PATH}"
      fi
  }

  path() {
    # show path
    echo $PATH
  }

  # show path, one entry per line
  alias pathcat="echo $PATH | sed 's/:/\n/g'"


  # Be sure we have a few specific paths if they exist

  pathlast $HOME/bin
  pathlast /usr/local/bin
  pathlast /opt/bin
  #+end_src

** source ~/rc.local/*.sh to do non-general bash setup
   Execute any .sh files in ~/rc.local/*.sh

   This allows me to split out setup for aliases and commands that
   only get used on certian systems or in certian contexts (git, go,
   mail, blog..)

   #+begin_src shell :tangle .bashrc :noweb no-export

   if [ -d ${HOME}/rc.local ]; then
       for rcfile in $(find ${HOME}/rc.local -name \*.sh); do
           debug running localrc ${rcfile}
           source ${rcfile}
       done
   fi
   #+end_src

** Invoking emacs
   #+begin_src shell :tangle .bashrc :noweb no-export
   alias emacs='setsid emacs'

   # from http://stuff-things.net/2014/12/16/working-with-emacsclient/

   if [ -z "$SSH_CONNECTION" ]; then
       export EMACSCLIENT=emacsclient
       alias ec="$EMACSCLIENT -c -n"
       export EDITOR="$EMACSCLIENT -c"
       export ALTERNATE_EDITOR=""
   else
       export EDITOR=$(type -P emacs || type -P ed)
   fi
   export VISUAL=$EDITOR
   #+end_src

** ls aliases
   #+begin_src shell :tangle .bashrc :noweb no-export

   # coloring for ls functions

   if [[ "$OSTYPE" == "linux-gnu" ]]; then
       color="--color";
   else
       color=""
   fi

   BIN_LS=/bin/ls
   alias ls='	ls '$color' -a'


   # Long List Reverse Tail
   function llrt() { ls -lrt $color ${*:-}; }

   # Long List Time
   function llt() { ls -lt $color ${*:-}; }

   # Long List Time, More
   function lltm() { ls -lt $color ${*:-} | more; }

   # Long List Time, Less
   function lltl() { ls -alt $color ${*:-} | more; }

   # Long List Time, Head
   function llth() { ls -lt $color ${*:-} | head; }

   # Long List Time, Tail
   function lltt() { ls -alt $color ${*:-} | tail; }


   # List Sort Size
   function lss() { ls -a1s $color ${*:-} | sort -n; }

   # List Sort Size Reverse
   function lssr() { ls -a1s $color ${*:-} | sort -nr; }

   #+end_src

** Aliases for viewing the newest file in a directoy
   #+begin_src shell :tangle .bashrc :noweb no-export

   function nf ()
   {
       # list the newest file in the current directory
       NF=`find ${1:-.} -maxdepth 1 -type f -print0 | xargs -0 ls -1t  |  head -1;`;
       echo ${NF:-/dev/null} | sed "s/ /\\\ /g"
   }


   # new file tail file
   function nftf { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs tail -f  ; }

   # new file tail
   function nft { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs tail  ; }

   # new file head
   function nfh { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs head  ; }

   # new file less
   function nfl { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs less  ; }

   # new file cat
   function nfc { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs cat  ; }

   # new file ls
   function nfls { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs ls -A1t  ; }

   # new file ls -l
   function nflsl { NF=`nf ${1:-.}`; debug NF $NF;  echo "$NF" | xargs
   ls -Atl  ; }
   #+end_src

** viewing files
   Notes on setting up file/mime type associations can be found at

   https://unix.stackexchange.com/questions/77136/xdg-open-default-applications-behavior

   So, to make emacs (what else?) the default for MIME type
   =text/plain= ...

   #+begin_example
   locate -r 'emacs.*\.desktop'
   xdg-mime default emacs.desktop text/plain
   #+end_example

   #+begin_src shell :tangle .bashrc :noweb no-export
   if [[  ! -z "`which xdg-open`" ]]; then alias open='xdg-open '; fi
   #+end_src

** All done
   #+begin_src shell :tangle .bashrc :noweb no-export
   touch $HOME/.bashrc-ran
   debug ".bashrc done"
   #+end_src
```

Congratulations for reading this far.   Go forth and write literate programs.

Posts 38 of #100DaysToOffload <https://100daystooffload.com/>.

[^fn:1]: This was about 10 years before the world wide web ... maybe
    Berners-Lee got some inspiration on the name from Knuth? Or Sir Walter
    Scott: "‘Oh what a tangled web we weave/When first we practice to deceive"
