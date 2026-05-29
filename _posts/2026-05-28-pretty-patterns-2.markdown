---
layout: post
title: "Pretty Patterns 2"
date: 2026-05-28 23:11:22 -0700
---

_If pretty patterns are so good, why didn't they make pretty patterns 2?_

Well, I have now. Instead of loading a prebaked PNG and tiling it, the pattern is now generated procedurally wherever
I need it, during the static site generation. It bakes an SVG that is then repeated to fill the sidebar background.
The advantage of this is a lot smaller file size, and since it can be trivially inlined, it saves an extra request
and no longer flickers so badly when navigating. It also fits the vibe I was going for a lot more.

The implementation does make me think about retiring Jekyll though. I really would like to be able to write with,
y'know, actual functions 'n' stuff. Jekyll is also getting quite slow with how complex my Liquid usage is.
I would probably switch to a custom system that uses JSX/TypeScript and emits a static site from that, with
extension points. Why that over Java? Because JSX is well-integrated for writing HTML.

That's all for now. See you in another two years :)