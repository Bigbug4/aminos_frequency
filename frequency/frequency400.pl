#!/usr/bin/perl
use strict;
use warnings;
# This program aims to count the double aminos frequency in each peptide.

open(IN, "$ARGV[0]");
open(OUT, ">$ARGV[1]");
my @amino = qw(C D E F G H I K L M N P Q R S T V W Y A);
my %dipep;

foreach my $a1(@amino){
    foreach my $a2(@amino){
        ++$dipep{$a1.$a2};
	}
    }

while(my $pep=<IN>){
   my %count;
   my %freq;
   print OUT "Peptides:$pep"; 
   chomp($pep);
   my @list =split("", $pep);
  foreach (keys %dipep){
     $count{$_}=$pep =~ s/$_/$_/g;
   # $count{$_}=`echo $pep |grep "$_" |wc -l`;
   # chomp($count{$_});
   }
   my @key =sort {$a cmp $b} keys %dipep;
   foreach my $a (@key){  
     if($count{$a} > 0){
      $freq{$a}=$count{$a}/($#list+1);
      }
     else {
      $freq{$a}=0;
      } 
      print OUT "aminos:$a times:$count{$a} frequency:$freq{$a}\n";
    }
    print OUT "\n";
}
		
close IN;
close OUT;
