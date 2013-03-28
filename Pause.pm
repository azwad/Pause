package Pause;
use strict;
use warnings;
use feature qw( say );
use base qw( Exporter);
use Devel::ArgNames;

our @EXPORT = qw( pause execute skip choice choice2 type typenum choice3 select);

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

sub execute {
	my $code_ref = shift;
	my @arg_name = arg_names();
	say $arg_name[0];
	my @args = @_;
	my $value;
	say "do you execute? (y/n)?";
	while (1){
		my $ans = <STDIN>;
		chomp( $ans );
		if ($ans eq 'y'){
			say 'excute program';
			$value = $code_ref->(@args);
			last;
		}elsif($ans eq 'n'){
			say "don't execute!";
			return $value = undef;
			last;
		}else{
			say "type (y or n)";
			next;
		}
	}
	return $value;
}


sub skip {
	my $code_ref = shift;
	say "skip anyway";
}

sub choice {
	my $hash = shift;
	my @array = sort keys %$hash;
	say "select below keys";
	say "keys: values";
	for (@array) {
		say "$_ :$hash->{$_}";
	}
	while (1) {
		my $ans = <STDIN>;
		chomp( $ans );
		return $ans if (grep {$_ eq $ans } @array);
		say "type which in (@array)";
	}
}


sub choice2 {
	my @array = @_;
	unshift @array, undef;
	say "select below keys";
	say "keys: values";
	for ( my $i=1; $i <= $#array; $i++) {
		say "$i :$array[$i]";
	}

	while (1) {
		my $ans = <STDIN>;
		chomp( $ans );
		unless ($ans =~ /[0-9]/){
			say "type which in (1..$#array)";
			next;
		}
		return $array[$ans] if ( $array[$ans] );
		say "type  which in (1..$#array)";
	}
}

sub type {
	my $word = shift;
	INPUT: while (1){
		say $word;
		my $name = <STDIN>;
		chomp( $name );
		say "is it OK? : $name";
		say "type (y or n)";
		while (1) {
			my $ans = <STDIN>;
			chomp( $ans );
			if ($ans eq 'y'){
				last;
			}elsif($ans eq 'n'){
				next INPUT;
			}else{
				say "type (y or n)";
				next;
			}
		}
		return $name;
	}
}

sub typenum {
	my $word = shift;
	INPUT: while (1){
		say $word;
		my $num = <STDIN>;
		chomp( $num );
		unless ($num =~ /^[0-9]+$/){
			say "type number";
			next;
		}
		say "is it OK? : $num";
		say "type (y or n)";
		while (1) {
			my $ans = <STDIN>;
			chomp( $ans );
			if ($ans eq 'y'){
				last;
			}elsif($ans eq 'n'){
				next INPUT;
			}else{
				say "type (y or n)";
				next;
			}
		}
		return $num;
	}
}

sub choice3 {
	my @array = @_;
	unshift @array, undef;
	push @array, 'else(type words)';
	say "select below keys";
	say "keys: values";
	for ( my $i=1; $i <= $#array; $i++) {
		say "$i :$array[$i]";
	}

	while (1) {
		my $ans = <STDIN>;
		chomp( $ans );
		unless ($ans =~ /[0-9]/){
			say "type which in (1..$#array)";
			next;
		}
		if ($ans == $#array) {
			my $name = Pause::type("type word");
			return $name;
		}
		return $array[$ans] if ( $array[$ans] );
		say "type  which in (1..$#array)";
	}
}

sub select {
	my @array = @_;
	unshift @array, undef;
	say "select numbers within a space like '2 4'";
	say "keys: values";
	for ( my $i=1; $i <= $#array; $i++) {
		say "$i :$array[$i]";
	}

	INPUT: while (1) {
		my $ans = <STDIN>;
		chomp( $ans );
		if ($ans =~ /^\s+$/) {
			say "select numbers which in (1..$#array) like '2 4'";
			next INPUT;
		}

		my @ans = ();
		@ans = split(" ",$ans);

		for (@ans) {
			unless ($_ =~ /^[0-9]$/){
				say "select numbers which in (1..$#array) like '2 4'";
				next INPUT;
			}
		}
		my @ansers;

		for (@ans) {
			if ( $array[$_] ){
				push @ansers, $array[$_];
			}else{
				say "select numbers which in (1..$#array) like '2 4'";
				next INPUT;
			}
		}
		return @ansers;
	}
}

1;
