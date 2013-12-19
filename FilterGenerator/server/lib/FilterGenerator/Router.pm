package FilterGenerator::Router;
use strict;
use warnings;

sub dispatch {
    my $routes = shift;
    $routes->get('/')->to('home#index');
    $routes->get('/read_filter_parameter')->to('home#read_filter_parameter');
    $routes->post('/save_filter_parameter')->to('home#save_filter_parameter');
}

1;
