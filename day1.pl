#!/usr/bin/perl
# IF you don't use strict warnings, you are crazy
use strict;
use warnings;

## Read the input and create an array

my $file = 'input';

open(FH, $file);

my $maxElf = 0;
my $maxCal = 0;

my @elves = ();
my $elf = 0;
while (<FH>) {
    my $input = $_;
    if (!$elves[$elf]) {
        $elves[$elf] = 0;
    }
    if ($input =~ m/\d/ ) {
        chomp($input);
        $elves[$elf] += $input;
        if ($elves[$elf] >= $maxCal) {
            $maxCal = $elves[$elf];
            $maxElf = $elf;
        }
        #print("$input ");
    } else {
        #print("\nElf:$elf: Total:$elves[$elf]\n");
        $elf++;
        next;
    }
}
my @sorted = sort { $b cmp $a } @elves;
my $ct = 0;
my $topThree = 0;
while ($ct < 3) {
    $topThree += shift(@sorted);
    $ct++;
    #print ("$topThree\n");
}
$maxElf++;
print("\nElf with the most Cals:$maxElf, Cal Count: $maxCal\n");
print("Top Three: $topThree\n");
