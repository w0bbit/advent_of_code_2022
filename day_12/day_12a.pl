use v5.36;
use warnings;
use Data::Dumper;

# just setting up the grid for now
my @grid;
my $x = 0;
open (my $INPUT, '<', (@ARGV));
while (my $line = <$INPUT>) {
  chomp $line;
  my @vals = split '', $line;
  for my $y (0..@vals-1) {
    push @grid, {$vals[$y] => [$x, $y]};
  }
  $x++;
}
close $INPUT;

say Dumper $_ for @grid;