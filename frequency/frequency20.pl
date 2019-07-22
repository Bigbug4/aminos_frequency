#!/usr/bin/perl
use strict;
use warnings;
# This program aims to count the single amino frequency in each peptide.

open(IN, "$ARGV[0]");
open(OUT, ">$ARGV[1]");
my @amino = qw(A C D E F G H I K L M N P Q R S T V W Y);
my %count;
my %freq;

while(my $pep=<IN>){
    my %count;
    my %freq;      
    print OUT "Peptides:$pep";
    chomp($pep);
    my @list = split("",$pep);

    foreach (@list){
      ++$count{$_};
      }

    foreach my $a (@amino){  
      if (exists $count{$a}){
        $freq{$a}=$count{$a}/($#list+1);
	}
     else{
       $count{$a}=0;	
       $freq{$a}=0; 
 	}
       print OUT "amino:$a times:$count{$a} frequency:$freq{$a} \n";
    }
    print OUT "\n";
}
		
close IN;
close OUT;
