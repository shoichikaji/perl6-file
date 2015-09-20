use v6;
unit class File;

method open($path, Callable $sub where $sub.arity == 1, :$chomp = True, :$enc = 'utf8', |c) {
    my $handle = IO::Handle.new(:path($path.IO));
    $handle // $handle.throw;
    $handle.open(:$chomp, :$enc, |c);
    LEAVE { $handle.close if $handle }
    $sub($handle);
}

=begin pod

=head1 NAME

File - open files with block like Ruby

=head1 SYNOPSIS

  use File;

  File.open: "foo.txt", :w, -> $fh {
    $fh.say("hello, world.");
  }; # automatically close $fh

=head1 DESCRIPTION

File provides C<open> method, which executes the block arguement with the filehandle
and close it automatically.

In Perl5, filehandles are closed at the end of a scope,
but in Perl6, they are not closed, and you are responsible for that.

=head1 COPYRIGHT AND LICENSE

Copyright 2015 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
