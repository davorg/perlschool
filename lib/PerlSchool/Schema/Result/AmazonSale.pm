use utf8;
package PerlSchool::Schema::Result::AmazonSale;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PerlSchool::Schema::Result::AmazonSale

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

=head1 TABLE: C<amazon_sales>

=cut

__PACKAGE__->table("amazon_sales");

=head1 ACCESSORS

=head2 book_id

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 amazon_site_code

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 2

=head2 year

  data_type: 'int'
  is_nullable: 0

=head2 month

  data_type: 'int'
  is_nullable: 0

=head2 ebook_units

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 paperback_units

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 koll_borrows

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 kenp_reads

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "book_id",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "amazon_site_code",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 2 },
  "year",
  { data_type => "int", is_nullable => 0 },
  "month",
  { data_type => "int", is_nullable => 0 },
  "ebook_units",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "paperback_units",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "koll_borrows",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "kenp_reads",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);

=head1 RELATIONS

=head2 amazon_site_code

Type: belongs_to

Related object: L<PerlSchool::Schema::Result::AmazonSite>

=cut

__PACKAGE__->belongs_to(
  "amazon_site_code",
  "PerlSchool::Schema::Result::AmazonSite",
  { code => "amazon_site_code" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 book

Type: belongs_to

Related object: L<PerlSchool::Schema::Result::Book>

=cut

__PACKAGE__->belongs_to(
  "book",
  "PerlSchool::Schema::Result::Book",
  { id => "book_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2021-04-06 10:50:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Fz804EIaLW9fN4Ti6497Vw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
