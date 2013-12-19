package FilterGenerator::Model::FilterManager;
use strict;
use warnings;
use FilterGenerator::Model::FilterManager::DB;
use JSON::XS;

sub new {
    my $class = shift;
    my $self = {
        db => FilterGenerator::Model::FilterManager::DB->new
    };
    return bless $self, $class;
}

sub all_data {
    my ($self) = @_;
    my @all_data = $self->{db}->search('filter');
    return [ map {
        my $param = decode_json $_->param;
        my @filter_names = keys %$param;
        +{
            id         => $_->id,
            created_at => $_->created_at,
            filter_names =>  join ', ', @filter_names
        };
    } @all_data ];
}

sub search_by_id {
    my ($self, $id) = @_;
    my $data = $self->{db}->single('filter', { id => $id });
    return $data;
}

sub add_new_parameter {
    my ($self, $param) = @_;
    return 0 unless $param;
    my $id = int(rand(255)) . '_' . time();
    $self->{db}->insert('filter', {
        id    => $id,
        param => $param,
    });
    return 1;
}

1;
