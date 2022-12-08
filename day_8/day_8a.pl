use v5.36;
use warnings;
use feature qw(signatures);

my @grid;
open(my $INPUT, '<', (@ARGV));
while (my $line = <$INPUT>) {
  chomp $line;
  my @line;
  for (split '', $line) {
    my %hash = (
      val => $_,
      vis => 0,
    );
    push @line, \%hash;
  }
  push @grid, \@line;
}

my $count = 0;
my $max = -1;

for my $i (0..@grid-1) {
  my @row = @{$grid[$i]};
  my $line;
  for my $j (0..@row-1) {
    my %tree = %{$row[$j]};
    # $line .= $tree{'val'};
    if ($tree{'val'} > $max) {
      $max = $tree{'val'};
      $tree{'vis'} = 1;
      ${$grid[$i]}[$j]{'vis'} = 1;
      # $line .= 'V';
      $line .= $tree{'val'};
    } else {
      $line .= $tree{'val'};
    }
  }
  say $line;
  $max = -1;
}

say '-----';

for my $i (0..@grid-1) {
  my @row = reverse @{$grid[$i]};
  my $line;
  for my $j (0..@row-1) {
    my %tree = %{$row[$j]};
    # $line .= $tree{'val'};
    if ($tree{'val'} > $max) {
      $max = $tree{'val'};
      $tree{'vis'} = 1;
      ${$grid[$i]}[@row-$j-1]{'vis'} = 1;
      # $line .= 'V';
      $line .= $tree{'val'};
    } else {
      $line .= $tree{'val'};
    }
  }
  say $line;
  $max = -1;
}

say '-----';

my @transposed = ();
for my $i (0 .. $#{$grid[0]}) {
    for my $j (0 .. $#grid) {
        $transposed[$i][$j] = $grid[$j][$i];
    }
}

@grid = @transposed;

for my $i (0..@grid-1) {
  my @row = @{$grid[$i]};
  my $line;
  for my $j (0..@row-1) {
    my %tree = %{$row[$j]};
    # $line .= $tree{'val'};
    if ($tree{'val'} > $max) {
      $max = $tree{'val'};
      $tree{'vis'} = 1;
      ${$grid[$i]}[$j]{'vis'} = 1;
      # $line .= 'V';
      $line .= $tree{'val'};
    } else {
      $line .= $tree{'val'};
    }
  }
  say $line;
  $max = -1;
}


say '-----';

for my $i (0..@grid-1) {
  my @row = reverse @{$grid[$i]};
  my $line;
  for my $j (0..@row-1) {
    my %tree = %{$row[$j]};
    # $line .= $tree{'val'};
    if ($tree{'val'} > $max) {
      $max = $tree{'val'};
      $tree{'vis'} = 1;
      ${$grid[$i]}[@row-$j-1]{'vis'} = 1;
      # $line .= 'V';
      $line .= $tree{'val'};
    } else {
      $line .= $tree{'val'};
    }
  }
  say $line;
  $max = -1;
}


say '-----';

for my $row (@grid) {
  my @row = @$row;
  for my $tree (@row) {
    my %tree = %$tree;
    if ($tree{'vis'}) {
      $count++;
    }
  }
}

say $count;
