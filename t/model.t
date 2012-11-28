use Mojo::Base -strict;
use SpeakIt::Model::User;
use SpeakIt::DB;
#use Test::More tests => 3;

my $db => SpeakIt::DB->new(connect_info => 
        ['DBI:mysql:database=speakit:127.0.0.1', 'speakit', 'atamishi', 
            {mysql_enable_utf8 => 1}
    ]);

my $user = SpeakIt::Model::User->new($db);
$user->add_user({user_id => 'hoge', password =>'hogehoge'});


