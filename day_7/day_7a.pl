use v5.36;
use warnings;

say sub {

  # tracks size of all dirs
  my %dir_sizes;

  # represents working directory branch
  my @dir_branch = ('/');

  open(my $INPUT, '<', 'input.txt');
  while (my $line = <$INPUT>) {
    chomp $line;

    # setting present working directory
    my $pwd = $dir_branch[-1];

    # each dir name is added as key in hash with default zero val
    # tracks file sizes for each dir
    if ($line =~ /^\$\scd\s(\w+)/) {
      my $dir_name = "$dir_branch[-1]/$1/";
      $dir_name =~ s/\/{2,}/\//g;
      push @dir_branch, $dir_name;
      ($pwd, $dir_sizes{$dir_name}) = ($dir_name, 0);
    } 

    # resetting pwd to previous when 'cd ..'
    if ($line =~ /\.\./) {pop @dir_branch}

    # add file size in hash to pwd and other dirs in same branch
    if ($line =~ /^(\d+).+/) {
      for my $branch (@dir_branch) {$dir_sizes{$branch} += $1}
    }
  }
  close $INPUT;

  # sum var
  my $total = 0;

  # sum file sizes le 100000
  for my $size (values %dir_sizes) {
    if ($size <= 100000) {$total += $size}
  }

  # 1243729
  "Total size of files 100000 and under is $total";

}->()