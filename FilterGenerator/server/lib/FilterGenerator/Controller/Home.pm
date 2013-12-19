package FilterGenerator::Controller::Home;
use strict;
use warnings;
use Mojo::Base 'Mojolicious::Controller';
use utf8;
use Encode;
use Data::Dumper;

sub index {
    my ($self) = @_;
    my $all_data = $self->app->filter_manager->all_data;
    $self->tmpl('home/home.tmpl')->assign('all_data' => $all_data)->render;
}

sub read_filter_parameter {
    my ($self) = @_;
    my $id = $self->param('id');
    my $filter = $self->app->filter_manager->search_by_id($id);
    $self->render(text => ($filter) ? decode('utf-8', $filter->param) : '');
}

sub save_filter_parameter {
    my ($self) = @_;
    my $response = $self->app->filter_manager->add_new_parameter($self->req->body);
    $self->render(text => $response);
}

1;
