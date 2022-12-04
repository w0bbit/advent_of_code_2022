use v5.36;
use warnings;

sub {

    # sum var
    my $total = 0;

    open (my $INPUT, '<', 'input.txt');
    while (my $line = <$INPUT>) {
        chomp $line;

        # parsing out startpoints and endpoints for number lists
        my ($first, $second) = split ',', $line;
        my ($first_a, $first_b) = split '-', $first;
        my ($second_a, $second_b) = split '-', $second;

        # creating arrays from startpoints and endpoints
        my @first_range = ($first_a..$first_b);
        my @second_range = ($second_a..$second_b);

        # using a hash to eliminate duplicate values
        my %combo_range;
        for (@first_range, @second_range) {
            $combo_range{$_} = undef;
        }

        # converting hash to array with unique values
        my @combo_range = sort keys %combo_range;

        # vars to represent lengths of arrays
        my $combined_len = @first_range + @second_range;
        my $overlap_len = scalar @combo_range;

        # increment total of range without duplicates is less than range with duplicates
        # because there would only be duplicates if the ranges overlap
        $total++ if $combined_len > $overlap_len;

    }
    close $INPUT;

    # 854
    say $total;

}->()