use SpeakIt::Model::User;
use SpeakIt::DB;
use Test::More tests => 6;

#my $db = SpeakIt::DB->new(connect_info => 
#        ['DBI:SQLite::memory:', '', '', 
#            {sqlite_unicode  => 1}
#    ]);

#$db->dbh->do('create table user (
#  user_id text primary key,
#  password text not null,
#  mail text not null unique,
#  key text not null unique,
#  active integer,
#  created_at datetime
#)');


my $db = SpeakIt::DB->new(connect_info => 
        ['DBI:mysql:database=speakit:127.0.0.1', 'speakit', 'atamishi', 
            {mysql_enable_utf8 => 1}
    ]);

my $user = SpeakIt::Model::User->new($db);
$user->add_user({user_id => 'hoge', password =>'hogehoge', mail=>'hoge@hoge.com'});

eval{
    $user->add_user({user_id => 'hoge', password =>'hogehoge',mail=>'hoge@hoge.com'});
    };
if ($@ =~ /unique|Duplicate/ ){
    pass;
}
else{
    fail;
}

ok $user->login('hoge','hogehoge') == 1 , 'login ok';
ok $user->login('hoge','ageage') == 0 , 'login ng';
ok $user->login('age','ageage') == 0 , 'login ng';
ok $user->login(undef,undef) == 0 , 'login ng';

ok $user->get_key =~ /[A-Za-z0-9]{32}/ , 'key string pattern';

my $row = $user->register_mail('hoge@hoge');

$db->delete('user', {user_id =>'hoge'});
$db->delete('mailauth', {mail =>'hoge@hoge'});

