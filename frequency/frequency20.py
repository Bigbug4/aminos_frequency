#/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Mon Jul  8  2019

@author: bigbug
"""
import sys

with open('D:\\VB\\scripts\\Feature_extraction\\frequency\\aaa.txt', 'r') as f:
    peptides = f.readlines()
    
aminos = 'A C D E F G H I K L M N P Q R S T V W Y'
amino = aminos.split(' ') 
amino_count = dict()
amino_frequecy = {}

ipath = 'D:/VB/scripts/Feature_extraction/frequency/sequence_features20raw.txt'
jpath = 'D:/VB/scripts/Feature_extraction/frequency/sequence_features20.txt'


with open(ipath, 'w+') as f:    
    for a in amino:
        f.write(a+"\t")
    f.write("\n")
    
    for peptide in peptides:
        for a in amino:
            amino_count[a] = peptide.count(a)
            length = len(peptide)
            amino_frequecy[a] = amino_count[a] / length
            f.write(str(amino_frequecy[a])+"\t")
        f.write("\n")
    
    
with open(jpath, 'w+') as f:    
    for a in amino:
        f.write("  "+a+"   ")
    f.write("\n")
    
    for peptide in peptides:
        for a in amino:
            amino_count[a] = peptide.count(a)
            length = len(peptide)
            amino_frequecy[a] = amino_count[a] / length
            f.write('{:.2f}'.format(amino_frequecy[a])+"  ")
        f.write("\n")