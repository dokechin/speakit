package SpeakIt::DB::Schema;
use Teng::Schema::Declare;
use DateTime::Format::MySQL;

table {
    name 'user';
    pk 'user_id';
    columns qw( user_id password mail create_at);

    inflate 'create_at' => sub {
        DateTime::Format::MySQL->parse_datetime(shift);
    };
    deflate 'create_at' => sub {
        DateTime::Format::MySQL->format_datetime(shift);
    };
};


table {
    name 'mailauth';
    columns qw( mail key create_at expired_at);

    inflate 'create_at' => sub {
        DateTime::Format::MySQL->parse_datetime(shift);
    };
    deflate 'create_at' => sub {
        DateTime::Format::MySQL->format_datetime(shift);
    };

    inflate 'expired_at' => sub {
        DateTime::Format::MySQL->parse_datetime(shift);
    };
    deflate 'expired_at' => sub {
        DateTime::Format::MySQL->format_datetime(shift);
    };

};


1;
