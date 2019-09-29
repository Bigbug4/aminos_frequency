#/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Mon Jul  8  2019

@author: bigbug
"""
import sys
import os
os.chdir('D:/VB/scripts/Feature_extraction/frequency/')

with open(str(sys.argv[1]), 'r') as f:
    peptides = f.readlines()
    
aminos = 'A C D E F G H I K L M N P Q R S T V W Y'
amino = aminos.split(' ') 
amino_count = dict()
amino_frequecy = {}

for i in amino:
    for j in amino:
        amino_count[i+j] = 0

ipath = 'sequence_features400raw.txt'
jpath = 'sequence_features400.txt'
        
with open(ipath, 'w+') as f:    
    for a in amino_count.keys():
        f.write(a+"\t")
    f.write("\n")
    
    for peptide in peptides:
        for a in amino_count.keys():
            amino_count[a] = peptide.count(a)
            length = len(peptide)
            amino_frequecy[a] = amino_count[a] / length
            f.write(str(amino_frequecy[a])+"\t")
        f.write("\n")
    

with open(jpath, 'w+') as f:    
    for a in amino_count.keys():
        f.write(" "+a+"   ")
    f.write("\n")
    
    for peptide in peptides:
        for a in amino_count.keys():
            amino_count[a] = peptide.count(a)
            length = len(peptide)
            amino_frequecy[a] = amino_count[a] / length
            f.write('{:.2f}'.format(amino_frequecy[a])+"  ")
        f.write("\n")
    