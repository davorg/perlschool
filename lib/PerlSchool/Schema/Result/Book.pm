use utf8;
package PerlSchool::Schema::Result::Book;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PerlSchool::Schema::Result::Book

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

=head1 TABLE: C<book>

=cut

__PACKAGE__->table("book");

=head1 ACCESSORS

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 subtitle

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 author

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 slug

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 pubdate

  data_type: 'date'
  is_nullable: 0

=head2 blurb

  data_type: 'varchar'
  is_nullable: 0
  size: 1000

=head2 image

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 amazon_isin

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 leanpub_slug

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 examples

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=cut

__PACKAGE__->add_columns(
  "title",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "subtitle",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "author",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "slug",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "pubdate",
  { data_type => "date", is_nullable => 0 },
  "blurb",
  { data_type => "varchar", is_nullable => 0, size => 1000 },
  "image",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "amazon_isin",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "leanpub_slug",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "examples",
  { data_type => "varchar", is_nullable => 1, size => 30 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-25 16:41:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MlBwavmULSP5+s2q2Lg+Vg

use Moo;
with 'MooX::Role::JSON_LD';

sub json_ld_type { 'Book' };

sub json_ld_fields { [
  { name => sub {
    $_[0]->subtitle ? $_[0]->title . ' - ' . $_[0]->subtitle : $_[0]->title}
  },
  { bookFormat => sub { 'EBook' } },
  { author => sub { {
    name => $_[0]->author,
    '@type' => 'Person',
  } } },
  { datePublished => sub { $_[0]->pubdate->strftime('%Y-%m-%d') }},
  { publisher => sub { {
    name => 'Perl School Publishing',
    '@type' => 'Organization',
  } } },
]}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
