package SpeakIt::Web::Register;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
  my $self = shift;

  my $name = $self->app->hello->get_name();

  # Render template "example/welcome.html.ep" with message
  $self->render(
    message => 'Hello ' . $name);
}

# This action will render a template
sub post {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(
    message => 'Welcome to the Mojolicious real-time web framework!');
}
1;
