#!/usr/bin/perl
use strict;
use warnings;
use Pause;
use feature 'say';
pause;
my %hash = (
	1 => 'a',
	2 => 'b',
	3 => 'c',
	5 => 'five',
);

my $ans = choice(\%hash);

say $hash{$ans};

my @array = qw(a b c d tokyo);

$ans = choice2(@array);

say $ans;


