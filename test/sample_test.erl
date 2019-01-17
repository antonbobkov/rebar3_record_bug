-module(sample_test).

-include_lib("eunit/include/eunit.hrl").

-include("record.hrl").

my_test() ->

    SampleRecord = #sample_record{one = 1, three = 2},

    ?debugVal(SampleRecord),

    sample:do_stuff(SampleRecord),
    ok.
