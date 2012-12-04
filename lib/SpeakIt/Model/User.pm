package SpeakIt::Model::User;
use strict;
use warnings;
use String::Random;
use DateTime;


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

sub register_mail {
    my $self = shift;
    my $mail = shift;
    
    $self->{db}->insert('mailauth', {mail=>$mail, key => get_key() });

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

sub get_key{
  my $rand_str = String::Random->new->randregex('[A-Za-z0-9]{32}');
  return $rand_str;
}




1;
