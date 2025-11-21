package PerlSchool::Schema::ResultSet::Author;

use Moose;
use MooseX::NonMoose;

extends 'DBIx::Class::ResultSet';

use v5.20;
use experimental 'signatures';

sub BUILDARGS { $_[2] }

sub sorted_authors ($self) {
  return $self->search(undef, { order_by => 'sortname' });
}

sub perlschool_authors ($self) {
  return $self->search(
    { 'books.is_perlschool_book' => 1 },
    {
      join     => 'books',   # join to the related book rows
      distinct => 1,         # don't return the same author multiple times
    },
  );
}

__PACKAGE__->meta->make_immutable;

1;
