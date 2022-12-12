use v5.36;
use warnings;
use Mojo::Util qw(dumper);

# just setting up the grid for now
my @grid;
my $x = 0;
open (my $INPUT, '<', (@ARGV));
while (my $line = <$INPUT>) {
  chomp $line;
  my @vals = split '', $line;
  for my $y (0..@vals-1) {
    if ($vals[$y] eq 'S') {
      push @grid, {'S' => [0, 0]};
    } elsif ($vals[$y] eq 'E') {
      push @grid, {25 => [$x, $y]};
    } else {
      my $alt = ord($vals[$y]) - 97;
      push @grid, {$alt => [$x, $y]};
    }
  }
  $x++;
}
close $INPUT;

# each @grid item is {altitude => [x, y]}
for (@grid) {
  say dumper $_;
}