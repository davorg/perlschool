use utf8;
package PerlSchool::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-25 16:41:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YMFCxB8Kw6j+Z8UUhMtWjQ

sub get_schema {
  my $class = shift;
  my ($db) = @_;

  $db //= $ENV{PERLSCHOOL_DB_FILE};

  die "I don't know which database to use\n" unless defined $db;

  return $class->connect("dbi:SQLite:$db");
}


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
