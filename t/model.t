use SpeakIt::Model::User;
use SpeakIt::DB;
use Test::More tests => 5;

my $db = SpeakIt::DB->new(connect_info => 
        ['DBI:SQLite::memory:', '', '', 
            {sqlite_unicode  => 1}
    ]);

$db->dbh->do('create table user (
  user_id text primary key,
  password text not null,
  mail text not null unique,
  key text not null unique,
  active integer,
  created_at datetime
)');


my $user = SpeakIt::Model::User->new($db);
$user->add_user({user_id => 'hoge', password =>'hogehoge'});

ok $user->login('hoge','hogehoge') == 1 , 'login ok';
ok $user->login('hoge','ageage') == 0 , 'login ng';
ok $user->login('age','ageage') == 0 , 'login ng';
ok $user->login(undef,undef) == 0 , 'login ng';

ok $user->get_key =~ /[A-Za-z0-9]{32}/ , 'key string pattern';



