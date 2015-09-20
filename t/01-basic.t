use v6;
use Test;
use File;
plan 1;

File.open: "t/test.txt", :w, -> $fh {
    $fh.say("hello");
};

is slurp("t/test.txt"), "hello\n";


