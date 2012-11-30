package SpeakIt::Model::User;
use strict;
use warnings;

sub new {
    my $pkg = shift;
    my $hash= {
    db   => shift
    };

    bless $hash,$pkg;
}

sub add_user {
    my $self = shift;
    my $row = $self->{db}->insert('user', shift);
    
}

sub login {
    my $self = shift;
    my $user_id = shift;
    my $password = shift;
    my $row = $self->{db}->single('user', {user_id => $user_id});
    if (defined $row && $row->password eq $password) {
        return 1;
    }
    else{
        return 0;
    }

}
1;
