use v5.36;
use warnings;
use Data::Dumper;

sub {

  # converting input into grid of hashes with tree height and visibility bool
  my @grid;
  open (my $INPUT, '<', (@ARGV));
  while (my $line = <$INPUT>) {
    chomp $line;
    my @row;
    for my $val (split '', $line) {
      my %tree_info = (
        'ht' => $val,
        'vis' => 0,
      );
      push @row, \%tree_info;
    }
    push @grid, \@row;
  }
  close $INPUT;

  for my $i (1..@grid-2) {

    # checking visibility from the left
    my @row = @{$grid[$i]};

    my $max_so_far = ${$row[0]}{'ht'};
    for my $j (1..@row-2) {
      my %prev = %{$row[$j-1]};
      my %curr = %{$row[$j]};
      if ($curr{'ht'} > $max_so_far) {
        $max_so_far = $curr{'ht'};
        ${${$grid[$i]}[$j]}{'vis'} = 1;
      }
    }

    # checking visibility from the right
    @row = reverse @row;
    $max_so_far = ${$row[0]}{'ht'};
    for my $j (1..@row-2) {
      my %prev = %{$row[$j-1]};
      my %curr = %{$row[$j]};
      if ($prev{'ht'} < $curr{'ht'}) {
        $max_so_far = $curr{'ht'};
        ${${$grid[$i]}[$j]}{'vis'} = 1;
      }
    }

  }

  # transpose grid
  my @tr_grid;

  # https://perlmaven.com/transpose-a-matrix
  for my $row (0..@grid-1) {
    for my $col (0..@{$grid[$row]}-1) {
      $tr_grid[$col][$row] = $grid[$row][$col];
    }
  }

  @grid = @tr_grid;

  for my $i (1..@grid-2) {

    # checking visibility from the left
    my @row = @{$grid[$i]};
    my $max_so_far = ${$row[0]}{'ht'};
    for my $j (1..@row-2) {
      my %prev = %{$row[$j-1]};
      my %curr = %{$row[$j]};
      if ($curr{'ht'} > $max_so_far) {
        $max_so_far = $curr{'ht'};
        ${${$grid[$i]}[$j]}{'vis'} = 1;
      }
    }

    # checking visibility from the right
    @row = reverse @row;
    $max_so_far = ${$row[0]}{'ht'};
    for my $j (1..@row-2) {
      my %prev = %{$row[$j-1]};
      my %curr = %{$row[$j]};
      if ($prev{'ht'} < $curr{'ht'}) {
        $max_so_far = $curr{'ht'};
        ${${$grid[$i]}[$j]}{'vis'} = 1;
      }
    }

  }

  my $count = 0;

  for my $row (@grid) {
    my @row = @$row;
    for my $tree (@row) {
      my %tree = %$tree;
      if ($tree{'vis'}) {
        $count++;
      }
    }
  }

  my $edge_trees = scalar @grid * 4 - 4;
  # say $count + $edge_trees;

}->()