# Lattice Checker

The goal of this project is to check if the given Directed graph is a Lattice or not.

## Input format

This program takes input from the file `input.txt`.

**Input format:**
```
n
a b
c d
...
```
where n is the no. of nodes in the graph.

Other lines indicate the edges.

Line `a b` implies `a <= b`, i.e a directed edge `a to b` is formed in the graph.

All nodes should follow this rule, 0 <= a, b, c, d < n

For convience, we output this graph in the file `image.dot` which can visualized easily on the site https://dreampuf.github.io/GraphvizOnline/

## Procedure

To run the program, use the following command

```
g++ lattice-checker.cpp -o lattice-checker && ./lattice-checker < input.txt
```

Note: This code should run on all gcc versions >= 6.3

## Authors
- Anupam Saini - CS17BTECH11003
- Vijay Tadikamalla - CS17BTECH11040
