package FilterGenerator;
use Mojo::Base 'Mojolicious';
use FilterGenerator::Router;
use FilterGenerator::View::Template;
use FilterGenerator::Model::FilterManager;

__PACKAGE__->attr(filter_manager => sub {
    return FilterGenerator::Model::FilterManager->new;
});

# This method will run once at server start
sub startup {
    my $self = shift;
    $self->plugin('PODRenderer');
    $self->routes->namespaces(['FilterGenerator::Controller']);
    FilterGenerator::Router::dispatch($self->routes);
}

1;
