package FilterGenerator::Model::FilterManager::DB;
use strict;
use warnings;
use DBIx::Skinny;
use Data::Section::Simple qw(get_data_section);
use constant {
    DB    => 'filter_generator',
    TABLE => 'filter',
    HOST  => 'localhost',
    PORT  => ''
};

sub new {
    my $class = shift;
    my $dsn = sprintf('DBI:mysql:%s:%s:%s', DB, HOST, PORT);
    my $self = $class->SUPER::new({
        dsn      => $dsn,
        username => 'root',
        password => ''
    });
    my $filter_table = get_data_section('filter');
    $self->dbh->do($filter_table);
    return bless($self, $class);
}

sub exists {
    my ($self, $table, $column, $cond) = @_;
    return ($self->count($table, $column, $cond)) ? 1 : 0;
}

1;

__DATA__

@@ filter
CREATE TABLE IF NOT EXISTS `filter` (
    `id`     char(128) NOT NULL,
    `param` text,
    `created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY(`id`)
) ENGINE=InnoDB, CHARSET=utf8;
