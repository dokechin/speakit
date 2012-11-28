package SpeakIt::Model::User;
use utf8;

sub new {
    my $pkg = shift;
    my $hash= {
    db   => shift
    };

    bless $hash,$pkg;
}

sub add_user {
    
    my $row = $self->{db}->insert({'user', shift});
    
}
1;