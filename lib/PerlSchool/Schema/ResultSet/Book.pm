package PerlSchool::Schema::ResultSet::Book;

use Moose;
use MooseX::NonMoose;

extends 'DBIx::Class::ResultSet';

use v5.20;
use experimental 'signatures';

sub BUILDARGS { $_[2] }

sub sorted_books ($self) {
  return $self->search(undef, { order_by => 'title' });
}

sub live_books ($self) {
  return $self->search({ is_live => 1 });
}

sub perlschool_books ($self) {
  return $self->search({ is_perlschool_book => 1 });
}

__PACKAGE__->meta->make_immutable;

1;
