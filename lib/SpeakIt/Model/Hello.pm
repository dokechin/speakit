package SpeakIt::Model::Hello;
use utf8;

sub new {
    bless { name => "boo"},shift;
}

sub get_name {
    my $self = shift;
    return $self->{name};;
}
1;