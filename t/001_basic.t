#!perl -w
use Test::More;

{
    package Foo;
    use Mouse;
    use MouseX::StrictConstructor;

    has [qw(foo bar)] => (is => 'rw');
}

isa_ok(Foo->new(foo => 1, bar => 2), 'Foo');

eval {
    Foo->new(foo => 1, bar => 2, baz => 3);
};
like $@, qr/\b Foo \b/xms;
like $@, qr/\b baz \b/xms;

done_testing;
