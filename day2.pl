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
    my $roundScore = 0;
    my $input = $_;
    chomp($input);
    my ($you, $outcome) = split(/ /, $input);
    switch($outcome) {
        case "X" {
            switch($you) {
                case "A" {
                    $roundScore += 3;
                }
                case "B" {
                    $roundScore += 1;
                }
                case "C" {
                    $roundScore += 2;
                }
            }
        }
        case "Y" {
            switch($you) {
                case "A" {
                    $roundScore += 1;
                }
                case "B" {
                    $roundScore += 2;
                }
                case "C" {
                    $roundScore += 3;
                }
            }
            $roundScore += 3;
        }
        case "Z" {
            switch($you) {
                case "A" {
                    $roundScore += 2;
                }
                case "B" {
                    $roundScore += 3;
                }
                case "C" {
                    $roundScore += 1;
                }
            }
            $roundScore += 6;
        }
    }
    print("Oponent: $you, Outcome: $outcome, Points: $roundScore\n");
    $finalScore += $roundScore;
}
print("Total Score: $finalScore\n");
