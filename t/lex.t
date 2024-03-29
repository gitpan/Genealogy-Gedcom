use strict;
use warnings;

use Test::More;

# ------------------------------------------------

sub BEGIN { use_ok('Genealogy::Gedcom::Reader::Lexer'); }

# ------------------------------------------------

sub process
{
		my($file_name, $expected_count) = @_;

		#diag "File $file_name. Known item count:  $expected_count";

		my($lexer) = Genealogy::Gedcom::Reader::Lexer -> new
		(
	 	input_file   => $file_name,
	 	logger  => '',
	 	report_items => 0,
	 	strict       => 1,
		);

		my($result) = $lexer -> run;
		my(@item)   = @{$lexer -> items};

		ok(scalar @item == $expected_count, "$file_name really does contain $expected_count items");

} # End of process.

# ------------------------------------------------

process('data/royal.ged',  3668);
process('data/sample.1.ged', 29);
process('data/sample.2.ged', 45);
process('data/sample.3.ged', 87);
process('data/sample.4.ged', 51);

done_testing;
