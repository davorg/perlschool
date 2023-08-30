use utf8;
package PerlSchool::Schema::Result::Author;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PerlSchool::Schema::Result::Author

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<author>

=cut

__PACKAGE__->table("author");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 bio

  data_type: 'varchar'
  is_nullable: 1
  size: 1000

=head2 sortname

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "bio",
  { data_type => "varchar", is_nullable => 1, size => 1000 },
  "sortname",
  { data_type => "varchar", is_nullable => 1, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 books

Type: has_many

Related object: L<PerlSchool::Schema::Result::Book>

=cut

__PACKAGE__->has_many(
  "books",
  "PerlSchool::Schema::Result::Book",
  { "foreign.author_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2021-04-06 10:50:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XrCL7rzJUrOm9+SxIr/CMQ

use Moo;
with 'MooX::Role::JSON_LD';

sub json_ld_type { 'Person' };

sub json_ld_fields { [qw( name ) ]}

sub is_perlschool_author {
  my $self = shift;

  return $self->books->search({ is_perlschool_book => 1 })->count;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
