use v5.36;
use warnings;
use Data::Dumper;

sub {

  open (my $INPUT, '<', (@ARGV));
  
  my $height = 0;
  my $width = 0;
  my @matrix;
  my @tr_matrix;

  while (my $line = <$INPUT>) {
    chomp $line;

    $height++;
    $width = length $line;

    my @line = split '', $line;
    push @matrix, \@line;

  }

########################################
########################################
########################################

  ROW: for my $i (1..@matrix-2) {
    my @line = @{$matrix[$i]};
    my $highest_so_far = $line[0];
    
    for my $j (1..@line-2) {
      if ($line[$j] eq 'V') {
        next ROW;
      }
      if ($line[$j] > $highest_so_far) {
        $highest_so_far = $line[$j];
        ${$matrix[$i]}[$j] = 'V';
      }
    }

    $highest_so_far = $line[@line-1];
    for (my $j = @line-2; $j > 0; $j--) {
      if ($line[$j] eq 'V') {
        next ROW;
      }
      if ($line[$j] > $highest_so_far) {
        $highest_so_far = $line[$j];
        ${$matrix[$i]}[$j] = 'V';
      }
    }

  }


  for (@matrix) {
    say @$_;
  }

  say '--------------';

  # https://perlmaven.com/transpose-a-matrix
  for my $row (0..@matrix-1) {
    for my $col (0..@{$matrix[$row]}-1) {
      $tr_matrix[$col][$row] = $matrix[$row][$col];
    }
  }

  @matrix = @tr_matrix;

  TR_ROW: for my $i (1..@matrix-2) {
    my @line = @{$matrix[$i]};
    my $highest_so_far = $line[0];
    
    for my $j (1..@line-2) {
      if ($line[$j] eq 'V') {
        next TR_ROW;
      }
      if ($line[$j] > $highest_so_far) {
        $highest_so_far = $line[$j];
        ${$matrix[$i]}[$j] = 'V';
      }
    }

    $highest_so_far = $line[@line-1];
    for (my $j = @line-2; $j > 0; $j--) {
      if ($line[$j] eq 'V') {
        next TR_ROW;
      }
      if ($line[$j] > $highest_so_far) {
        $highest_so_far = $line[$j];
        ${$matrix[$i]}[$j] = 'V';
      }
    }
  }

  my $count = (2 * $height) + (2 * $width) - 4;
  for my $line (@matrix) {
    for (@$line) {
      if ($_ eq 'V') {
        $count++;
      }
    }
  }

  say $count;


}->()