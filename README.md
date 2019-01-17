Relevant files are:

```
src/record.hrl
src/sample.erl
test/sample_test.erl
```

How to recreate the bug:

- Run `rebar3 eunit`. There are no errors.
- Comment out line 4 in src/record.hrl
- Run `rebar3 eunit`. There is an error.
- Run `rm -rf _build`.
- Run `rebar3 eunit`. There are no errors.

