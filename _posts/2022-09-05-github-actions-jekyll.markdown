---
layout: post
title: "GitHub Pages + Jekyll 4 with Github Actions!"
date: 2022-09-05 10:20:26 -07:00
---

I've been wondering for a while why the GitHub Pages gem hadn't been updated to Jekyll 4, which contains many
changes that I've really wanted in the past. It turns out that GitHub has a new [GitHub Actions workflow] that is
intended to replace the black-box pipeline that was the default, allowing for using other static site generators
or really any arbitrary code to produce a Pages site. I'm really excited for this change, and hope to experiement
with other ways of creating sites besides Jekyll in the future.

However, this site doesn't have any good reason to switch to another generator right now, so I've simply updated it to
use the new Actions workflow and updated to Jekyll 4. A preliminary check of the site appears to show no issues, but
please let me know if you find any!

[GitHub Actions workflow]: https://github.blog/2022-08-10-github-pages-now-uses-actions-by-default/
