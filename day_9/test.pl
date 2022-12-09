#! /usr/bin/perl

# Advent of Code 2022 Day 9 Part 1, by Smylers
# Count where the tail has been

use utf8;
use v5.14;
use warnings;
use Syntax::Keyword::Junction any => {-as => 'one_of'};
use List::Util qw<any>;

my @head = my @tail = (0, 0);
my %visited = ("@tail" => 1);
while (<>)
{
  my ($cmd, $count) = split;
  my $dim = ($cmd eq one_of 'L', 'R') ?  0 : 1;
  my $Δ   = ($cmd eq one_of 'L', 'U') ? -1 : 1;
  for (1 .. $count)
  {
    $head[$dim] += $Δ;
    # Only need to move the tail if the head is over 1 away in any dimension:
    if (any { abs $head[$_] - $tail[$_] > 1 } keys @head)
    {
      # Move all dimensions in the direction of the head:
      $tail[$_] += $head[$_] <=> $tail[$_] for keys @head;
      $visited{"@tail"}++;
    }
  }
}
say scalar keys %visited;