#!/usr/bin/perl
use strict;
use warnings;
use Pause;
use feature 'say';

pause;

my $sample_test = sub {
	
	my $name = type('type file name');

	say "type: file name is '$name'";

	my %hash = (
		1 => 'yellow',
		2 => 'black',
		a => 'pink',
		b => 'white',
		cc => 'red',
		0 => 'blue',
	);

	my $ans = choice(\%hash);

	say "choice :$hash{$ans}";

	my @array = qw(yellow black pink white red blue);

	$ans = choice2(@array);

	say "choice2 :$ans";

	$ans = choice3(@array);

	say "choice3 :$ans";

	my @ans = select(@array);

	say "select:@ans";

	my $number = typenum('input number');
	
	say "typenum: $number";
	
	my $str = 'test end';

	return $str;

};

execute($sample_test);




