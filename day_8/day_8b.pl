use v5.36;
use warnings;

my @grid;
open (my $INPUT, '<', (@ARGV));
while (my $line = <$INPUT>) {
  chomp $line;
  my @line;
  push @line, split '', $line;
  push @grid, \@line;
}
close $INPUT;


my $high_score = 0;

my $x = 0;
my $y = 0;

my ($left, $right, $up, $down) = (0,0,0,0);


for my $i (0..@grid-1) { 
  # this iterates over rows
  # my $line;
  my @row = @{$grid[$i]};
  say @row;
  for my $j (0..@{$grid[$i]}-1) {
    
    my $val = ${$grid[$i]}[$j];
    # this iterates over values ($j) in a row
    # $line .= $j;
    # coords for this value:
    $x = $i;
    $y = $j;
    # say "this is $val; its 0-indexed coords are: $x, $y";

  }
  # say $line;
}
