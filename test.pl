#!/usr/bin/perl
use strict;
use warnings;
use Pause;
use feature 'say';

pause;

my $name = type('type file name');

say $name;

my %hash = (
	1 => 'yellow',
	2 => 'black',
	a => 'pink',
	b => 'white',
	cc => 'red',
	0 => 'blue',
);

my $ans = choice(\%hash);

say $hash{$ans};

my @array = qw(yellow black pink white red blue);

$ans = choice2(@array);

say $ans;

$ans = choice3(@array);

say $ans;

my @ans = select(@array);

say @ans;


