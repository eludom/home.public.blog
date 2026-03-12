    ;; h - Hugo blog
    (add-to-list 'org-capture-templates
                 '("h" "Hugo blog" entry
                   (file "~/blog/drafts/drafts.org")
                   "*** TODO %^{title}		:100DaysToOffload:

    The short story...

    ,,#+caption: [[https://FOO.COM/BAR/BAZ.JPG][\"Name of work\" by WHO is licensed under cc by 2.0]]
    ,,#+attr_html: :width 200px
    [[file:images/BAZ.JPG]]

    ,,#+hugo: more

    The long story...

    #nn of #100DaysToOffload take 2.1, https://100daystooffload.com/
    ")
                 t)
