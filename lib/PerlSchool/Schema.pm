use utf8;
package PerlSchool::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_components("Schema::ResultSetNames");

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07053 @ 2025-11-21 11:03:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qASV7kw/PsPiA2EBK2IQTA

sub get_schema {
  my $class = shift;
  my ($db) = @_;

  $db //= $ENV{PERLSCHOOL_DB_FILE};

  die "I don't know which database to use\n" unless defined $db;

  return $class->connect("dbi:SQLite:$db");
}


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
