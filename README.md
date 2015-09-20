[![Build Status](https://travis-ci.org/shoichikaji/perl6-file.svg?branch=master)](https://travis-ci.org/shoichikaji/perl6-file)

NAME
====

File - open files with block like Ruby

SYNOPSIS
========

    use File;

    File.open: "foo.txt", :w, -> $fh {
      $fh.say("hello, world.");
    }; # automatically close $fh

DESCRIPTION
===========

File provides `open` method, which executes the block arguement with the filehandle and close it automatically.

In Perl5, filehandles are closed at the end of a scope, but in Perl6, they are not closed, and you are responsible for that.

COPYRIGHT AND LICENSE
=====================

Copyright 2015 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
