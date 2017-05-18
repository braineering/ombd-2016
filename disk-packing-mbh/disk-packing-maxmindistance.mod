#===============================================================================
# DISK PACKING (Model)
#
# Find the positions of N points inside the unit square
# in such a way that their minimum pairwise distance d is maximized.
#===============================================================================
reset;

#===============================================================================
# PARAMETERS
#===============================================================================
param N >= 0; # Number of disks

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var X {i in 1..N} >=0, <=1; # Disks center (X coordinate)
var Y {i in 1..N} >=0, <=1; # Disks center (Y coordinate)
var d <=1; # Disks distance

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize distance: d; # Maximize distance

#===============================================================================
# BOUNDS
#===============================================================================
subject to noMinOfd {i in 1..N, j in 1..N: j>i}:
  sqrt((X[i]-X[j])**2 + (Y[i]-Y[j])**2) >=d;
