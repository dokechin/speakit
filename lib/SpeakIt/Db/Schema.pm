package SpeakIt::DB::Schema;
use Teng::Schema::Declare;

table {
    name 'user';
    pk 'user_id';
    columns qw( user_id password mail create_at);
};

1;
