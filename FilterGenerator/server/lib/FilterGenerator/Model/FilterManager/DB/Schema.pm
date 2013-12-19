package FilterGenerator::Model::FilterManager::DB::Schema;
use strict;
use warnings;
use DBIx::Skinny::Schema;
use DateTime;

install_table filter => schema {
    pk qw/id/;
    columns qw/
        id
        param
        created_at
    /;
    trigger pre_insert => sub {
        my ($class, $args) = @_;
        my $now = DateTime->now(time_zone => 'Asia/Tokyo');
        $args->{created_at} ||= $now->ymd('-') . ' ' . $now->hms(':');
    };
};

1;
