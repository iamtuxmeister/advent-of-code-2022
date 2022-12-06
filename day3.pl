#!/usr/bin/perl
# IF you don't use strict warnings, you are crazy
use strict;
use warnings;
use Switch;

## Read the input and create an array

my $file = 'input';

open(FH, $file);

my $finalScore = 0;

while (<FH>) {
    my $input = $_;
    chomp($input);
    my $length = length($input);
    my $half = $length / 2;
    my $front = substr($input, 0, $half);
    my $back = substr($input, $half);
    my @parts = split(//, $front);
    my $priority = "0abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for my $letter (@parts) {
        #print("$letter ");
        my $index = index($back, "$letter");
        #print("$index ");
        if ($index >= 0) {
            print("letter found: $letter ");
            my $score = index($priority, $letter);
            print("$score ");
            $finalScore += $score;
            last;
        }
    }
    print("$input, $length, $half, parts: $front, $back\n");
}
print("Final Score: $finalScore\n");
close(FH);
