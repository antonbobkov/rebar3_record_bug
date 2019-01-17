-module(sample).

-include_lib("eunit/include/eunit.hrl").

-export([
	 do_stuff/1
	]).

-include("record.hrl").

do_stuff(SampleRecord) ->
    ?debugVal(SampleRecord),

    ?debugVal(SampleRecord#sample_record.one),
    ok.

