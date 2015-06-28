use utf8;
package Brass::IssueSchema::Result::Priority;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Brass::IssueSchema::Result::Priority

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

=head1 TABLE: C<priority>

=cut

__PACKAGE__->table("priority");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 issue_priorities

Type: has_many

Related object: L<Brass::IssueSchema::Result::IssuePriority>

=cut

__PACKAGE__->has_many(
  "issue_priorities",
  "Brass::IssueSchema::Result::IssuePriority",
  { "foreign.priority" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 issues

Type: has_many

Related object: L<Brass::IssueSchema::Result::Issue>

=cut

__PACKAGE__->has_many(
  "issues",
  "Brass::IssueSchema::Result::Issue",
  { "foreign.priority_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-06-26 14:35:03
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wmenhZPUnctJZ6fFPQLz7g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;