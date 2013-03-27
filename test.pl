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

my %hash2 = (
	qq => 'a',
	2 => 'b',
	wew => 'c',
	99 => 'five',
	01 => 'five',
	a => 'five',
);

$ans = choice(\%hash2);

say $hash2{$ans};

my @array = qw(a b web 3 tset);

$ans = choice2(@array);

say $ans;

my @array2 = qw(1 2 3 4 5 6 7  8 9 10);

$ans = choice2(@array2);

say $ans;

my $name = type('type file name');

say $name;

$ans = choice3(@array);

say $ans;



