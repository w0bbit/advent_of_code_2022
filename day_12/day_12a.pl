use v5.36;
use warnings;
use Mojo::Util qw(dumper);

# should be 361

# just setting up the grid for now
my @grid;
my $x = 0;
open (my $INPUT, '<', (@ARGV));
while (my $line = <$INPUT>) {
  chomp $line;
  my @vals = split '', $line;
  for my $y (0..@vals-1) {
    if ($vals[$y] eq 'S') {
      push @grid, {'S' => [$x, $y]};
    } elsif ($vals[$y] eq 'E') {
      push @grid, {'E' => [$x, $y]};
    } else {
      my $alt = ord($vals[$y]) - 97;
      push @grid, {$alt => [$x, $y]};
    }
  }
  $x++;
}
close $INPUT;

my @visited;
my @routes;

# each @grid item is {altitude => [x, y]}
for my $loc (@grid) {
  for (keys %$loc) {
    say "$_ => [${$$loc{$_}}[0], ${$$loc{$_}}[1]]";
  }
}

# test coords around current location to identify valid ones
# i.e., add or subtract 1 from x coord, do same for y coord, then check that alt is not more than 1 higher than the current alt
