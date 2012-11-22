package SpeakIt::Web;
use Mojo::Base 'Mojolicious';
use SpeakIt::Model::Hello;

# This method will run once at server start
sub startup {
  my $self = shift;



  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  $self->attr( hello => sub { SpeakIt::Model::Hello->new() } );

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/register')->to('register#index');
  $r->post('/register')->to('register#post');
}

1;
