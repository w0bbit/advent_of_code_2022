use v5.36;
use warnings;

push my @directions, <>;

my ($H_coord, $T_coord) = ([0,0], [0,0]);
my @H_visited_coords = ();
my @T_visited_coords = ();

say "\nSTART> HEAD: @$H_coord; TAIL: @$T_coord"; 
for (@directions) {
  chomp;

  my ($moves) = $_ =~ /\d+/g;
  my $move = 1;
  
  while ($move <= $moves) {
    if (/R/) {
      @$H_coord[0]++;
    } elsif (/L/) {
      @$H_coord[0]--;
    } elsif (/U/) {
      @$H_coord[1]++;
    } elsif (/D/) {
      @$H_coord[1]--;
    }

    my $x_diff = @$H_coord[0] - @$T_coord[0];
    my $y_diff = @$H_coord[1] - @$T_coord[1];
    
    if (abs($x_diff) != 0 && abs($y_diff) != 0) {
      # fix this
      @$T_coord[0] = @$H_coord[0];
    } else {
      if (abs($x_diff) > 1) {
        if ($x_diff > 0) {
          @$T_coord[0]++;
        } else {
          @$T_coord[0]--;
        }
      } elsif (abs($y_diff) > 1) {
        if ($y_diff > 0) {
          @$T_coord[1]++;
        } else {
          @$T_coord[1]--;
        }
      }
    }

    $move++;

    say "$_ => HEAD: @$H_coord; TAIL: @$T_coord; x diff: $x_diff; y diff: $y_diff"; 
    push @H_visited_coords, "@$H_coord[0], @$H_coord[1]";
    push @T_visited_coords, "@$T_coord[0], @$T_coord[1]";
  }

}


my %H_set = map {$_ => 1} @H_visited_coords;
my $H_locations = scalar keys %H_set;

my %T_set = map {$_ => 1} @T_visited_coords;
my $T_locations = scalar keys %T_set;

say '-----';
say "Tail has been to:";
for (keys %T_set) {
  say
}

say '-----';
say scalar keys %T_set, ' places';

# should be 6271