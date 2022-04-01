************************************************************************
file with basedata            : mf34_.bas
initial value random generator: 675475446
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  32
horizon                       :  236
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     30      0       30        0       30
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          3           6   7  11
   3        3          3          12  19  21
   4        3          2           5   9
   5        3          3          14  15  18
   6        3          3           8  10  26
   7        3          1          10
   8        3          3           9  17  19
   9        3          1          21
  10        3          2          17  24
  11        3          3          13  23  24
  12        3          3          16  20  27
  13        3          2          19  29
  14        3          1          30
  15        3          1          16
  16        3          2          22  26
  17        3          3          18  20  31
  18        3          1          27
  19        3          1          25
  20        3          1          28
  21        3          3          22  24  27
  22        3          1          25
  23        3          3          25  26  30
  24        3          2          28  31
  25        3          1          31
  26        3          1          28
  27        3          1          29
  28        3          1          29
  29        3          1          32
  30        3          1          32
  31        3          1          32
  32        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     5       0    9    6    9
         2     7       0    1    6    9
         3     8       2    0    4    8
  3      1     6       4    0    9    4
         2     8       0    6    9    4
         3     8       3    0    8    3
  4      1     4       0    8    9    8
         2     6       5    0    8    7
         3     8       0    7    8    5
  5      1     2       7    0    9    5
         2     2       8    0    7    5
         3     8       0    7    6    5
  6      1     1       0    5    9   10
         2     3       8    0    4    8
         3     8       0    4    3    6
  7      1     2       0    8    8    8
         2     6       0    7    6    4
         3     8       0    7    5    3
  8      1     6       4    0    6    6
         2     8       4    0    4    5
         3    10       0    9    2    4
  9      1     3       0    4    8    8
         2     4      10    0    6    6
         3     9       9    0    5    4
 10      1     5       4    0    5    6
         2     6       0   10    4    5
         3     8       0    6    3    5
 11      1     3       3    0    7    3
         2     7       3    0    6    3
         3     9       0    4    6    2
 12      1     3      10    0    9    8
         2     5       9    0    6    7
         3     9       0    4    3    4
 13      1     1       0    7    6    5
         2     6       7    0    5    5
         3     7       0    3    4    4
 14      1     3       7    0    8    9
         2     5       4    0    7    8
         3     6       3    0    6    7
 15      1     1       0    6    7    4
         2     2       0    6    3    4
         3     4       5    0    3    4
 16      1     3       2    0    5    9
         2     7       1    0    5    8
         3     7       0    6    3    8
 17      1     5       0    6    9    5
         2     5       5    0    7    5
         3     7       0    6    4    4
 18      1     2       0    6    6    8
         2     7       8    0    6    7
         3     8       8    0    5    4
 19      1     3       6    0    9    9
         2     8       5    0    8    7
         3    10       5    0    7    5
 20      1     1       0    9    9   10
         2     8       0    9    8   10
         3    10       7    0    5   10
 21      1     6       0    8    8    6
         2     7       0    7    6    5
         3    10       2    0    5    3
 22      1     2       0    6    4    3
         2     4       0    4    3    2
         3     6       8    0    2    2
 23      1     3       4    0    9   10
         2     5       0    9    4   10
         3    10       2    0    3    9
 24      1     3      10    0    9    6
         2     5      10    0    7    5
         3     7      10    0    4    4
 25      1     2       0    8   10    6
         2     3       0    6    7    5
         3     6       0    5    6    4
 26      1     1       7    0    6    9
         2     4       7    0    2    8
         3     4       0    3    4    7
 27      1     5      10    0    9    6
         2     8       0    2    7    6
         3     9       0    1    4    5
 28      1     2       0    6    9    9
         2     3       8    0    9    8
         3     5       5    0    9    6
 29      1     4       8    0    8    5
         2     6       0    4    7    4
         3     9       0    4    4    2
 30      1     3       7    0    5    8
         2     6       6    0    5    5
         3     9       1    0    5    3
 31      1     1       6    0   10    8
         2     6       6    0    9    7
         3     9       0   10    8    7
 32      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   23   22  164  163
************************************************************************