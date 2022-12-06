use v5.36;
use warnings;
use feature qw(signatures);

say sub ($n) {
  open (my $INPUT, '<', 'input.txt');
  my @data = split '', <$INPUT>;
  close $INPUT;

  # sliding window to convert every $n chars into set
  for (my $i = 0; $i < @data-$n; $i++) {
    my %set = map {$_ => 1} @data[$i..$i+$n-1];

    # 'marker' is found when set length is $n (unique chars)
    return $i+$n if %set == $n;
  }

# day 1: 1582 ($n = 4)
# day 2: 3588 ($n = 14)
}->()