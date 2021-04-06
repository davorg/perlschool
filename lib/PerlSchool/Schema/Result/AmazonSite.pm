use utf8;
package PerlSchool::Schema::Result::AmazonSite;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PerlSchool::Schema::Result::AmazonSite

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

=head1 TABLE: C<amazon_site>

=cut

__PACKAGE__->table("amazon_site");

=head1 ACCESSORS

=head2 code

  data_type: 'char'
  is_nullable: 1
  size: 3

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 currency

  data_type: 'char'
  is_nullable: 1
  size: 3

=head2 sort_order

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "code",
  { data_type => "char", is_nullable => 1, size => 3 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "currency",
  { data_type => "char", is_nullable => 1, size => 3 },
  "sort_order",
  { data_type => "int", is_nullable => 1 },
);

=head1 RELATIONS

=head2 amazon_sales

Type: has_many

Related object: L<PerlSchool::Schema::Result::AmazonSale>

=cut

__PACKAGE__->has_many(
  "amazon_sales",
  "PerlSchool::Schema::Result::AmazonSale",
  { "foreign.amazon_site_code" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2021-02-06 00:01:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dv+pSM3W0qY0xorfvibLTA

sub uri_for_asin {
  my $self = shift;
  my ($asin) = @_;

  return 'https://amazon.' . $self->domain . "/dp/$asin";
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
