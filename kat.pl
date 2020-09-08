use charnames qw(katakana);
use Encode;
my $hello = "\272\243\306\374\244\317\241\242\300\244\263\246";
my $hello_uni = decode("euc-jp", $hello);
print $hello_uni;
print "\n";
print "\N{sa}\N{i}\N{mo}\N{n}\n";

open OUT, ">$hello_uni" or die $!;
print OUT encode("euc-jp",$hello_un);
