use utf8;
package Brass::DocSchema::Result::Doc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Brass::DocSchema::Result::Doc

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

=head1 TABLE: C<doc>

=cut

__PACKAGE__->table("doc");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 topic_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 review

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 owner

  data_type: 'integer'
  is_nullable: 1

=head2 classification

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "topic_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "review",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "owner",
  { data_type => "integer", is_nullable => 1 },
  "classification",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 classification

Type: belongs_to

Related object: L<Brass::DocSchema::Result::Classification>

=cut

__PACKAGE__->belongs_to(
  "classification",
  "Brass::DocSchema::Result::Classification",
  { id => "classification" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 topic

Type: belongs_to

Related object: L<Brass::DocSchema::Result::Topic>

=cut

__PACKAGE__->belongs_to(
  "topic",
  "Brass::DocSchema::Result::Topic",
  { id => "topic_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 versions

Type: has_many

Related object: L<Brass::DocSchema::Result::Version>

=cut

__PACKAGE__->has_many(
  "versions",
  "Brass::DocSchema::Result::Version",
  { "foreign.doc_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-06-12 22:54:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Diyqpu1WOOws+RgOQzytqg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;