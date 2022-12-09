use v5.36;
use warnings;

my @grid;
my $count = 0;
open (my $INPUT, '<', (@ARGV));
while (my $line = <$INPUT>) {
  chomp $line;
  my @temp;
  my @line = split '', $line;
  for my $i (0..@line-1) {
    my %hash = (
      val => $line[$i],
      vind => $i,
      hind => $count,
    );
    push @temp, \%hash;
  }
  push @grid, \@temp;
}
close $INPUT;

for my $i (0..@grid-1) {
  my $line;
  for my $j (0..@{$grid[$i]}-1) {
    $line .= ${$grid[$i]}[$j]{'val'};
  }
  say $line;
}