use v6;
use Test;
use File;
plan 1;

File.open: "t/lsof.txt", :w, -> $fh {
    $fh.say("hello");
};

my $open-count = qqx{lsof -p $*PID | grep t/lsof.txt | wc -l}.chomp;

is $open-count, 0, "t/lsof.txt is closed!";
