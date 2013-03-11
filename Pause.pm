package Pause;
use strict;
use warnings;
use feature qw( say );
use lib qw(/home/toshi/perl/lib);
use base qw( Exporter);
use Devel::ArgNames;

our @EXPORT = qw( pause excute skip choice choice2);

sub pause {
	say "are you ready? (y/n)?";
	while (1){
		my $ans = <STDIN>;
		chomp( $ans );
		if ($ans eq 'y'){
			last;
		}elsif($ans eq 'n'){
			die 'you are smart!';
		}else{
			say "type (y or n)";
			next;
		}
	}
}

sub excute {
	my $code_ref = shift;
	my @arg_name = arg_names();
	say $arg_name[0];
	my @args = @_;
	say "do you excute? (y/n)?";
	while (1){
		my $ans = <STDIN>;
		chomp( $ans );
		if ($ans eq 'y'){
			say 'excute program';
			$code_ref->(@args);
			last;
		}elsif($ans eq 'n'){
			say "don't excute!";
			last;
		}else{
			say "type (y or n)";
			next;
		}
	}
	return 1;
}


sub skip {
	my $code_ref = shift;
	say "skip anyway";
}

sub choice {
	my $hash = shift;
	my @array = sort keys %$hash;
	say "select below keys";
	say "keys: items";
	for (@array) {
		say "$_ :$hash->{$_}";
	}
	while (1) {
		my $ans = <STDIN>;
		chomp $ans;
		return $ans if (grep {$_ eq $ans } @array);
		say "type which in (@array)";
	}
}


sub choice2 {
	my @array = @_;
	unshift @array, undef;
	say "select below keys";
	say "keys: items";
	for ( my $i=1; $i <= $#array; $i++) {
		say "$i :$array[$i]";
	}
	while (1) {
		my $ans = <STDIN>;
		chomp $ans;
		my $num = $#array;
		unless ($ans =~ /[1..$num]/){
			say "type which in (1..$num)";
			next;
		}
		return $array[$ans] if ( $array[$ans] );
		say "type  which in (1..$#array)";
	}
}

1;




