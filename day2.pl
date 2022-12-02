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
    my ($you, $me) = split(/ /, $input);
    #print("$me, $you\n");
    my $state = "Loss";
    if ( ($you eq 'A' && $me eq 'X') || ($you eq 'B' && $me eq 'Y') ||
        ($you eq 'C' && $me eq 'Z') ) {
        $roundScore += 3;
        $state = "Draw";
    } elsif ( ($you eq 'A' && $me eq 'Y') || ($you eq 'B' && $me eq 'Z') ||
        ($you eq 'C' && $me eq 'X') ) {
        $roundScore += 6;
        $state = "Win";
    }
    switch($me) {
        case "X" { $roundScore += 1 }
        case "Y" { $roundScore += 2 }
        case "Z" { $roundScore += 3 }
    }
    $finalScore += $roundScore;
    print("You: $you, Me: $me, Outcome: $state, Score: $roundScore\n");
}
print("Total Score: $finalScore\n");
