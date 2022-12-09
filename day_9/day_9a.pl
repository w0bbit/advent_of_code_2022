use v5.36;
use warnings;

=pod
say "@$H_coord"; 
say "@$T_coord";

for (@visited_coords) {
  say "@$_";
}
=cut

push my @directions, <>;

my ($H_coord, $T_coord) = ([0,0], [0,0]);
my @H_visited_coords = ([0,0]);
my @T_visited_coords = ([0,0]);

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

    # TODO: tail movement logic here

    $move++;

    say "$_ => HEAD: @$H_coord; TAIL: @$T_coord"; 
    push @H_visited_coords, [@$H_coord[0], @$H_coord[1]];
  }

  if (@$H_coord[0] - @$T_coord[0] > 1 && @$H_coord[1] - @$T_coord[1]) {

  }


}

# say scalar @H_visited_coords;
my %set = map {$_ => 1} @H_visited_coords;
my $H_locations = scalar keys %set;
say "\nHead has been to $H_locations spots.";

