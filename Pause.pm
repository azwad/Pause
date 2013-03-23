package Pause;
use strict;
use warnings;
use feature qw( say );
use base qw( Exporter);
use Devel::ArgNames;

our @EXPORT = qw( pause excute skip choice choice2 type);

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
	my $num = $#array;
	my $num2;
	if ($num >= 9){
		$num2 = 9;
	}else {
		$num2 = $num;
	}
	my $regex = qr/[0-$num2]/;

	while (1) {
		my $ans = <STDIN>;
		chomp( $ans );
		unless ($ans =~ /$regex/){
			say "type which in (1..$num)";
			next;
		}
		return $array[$ans] if ( $array[$ans] );
		say "type  which in (1..$num)";
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

1;


