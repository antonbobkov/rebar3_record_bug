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


Here is the output when I do the instuctions above

```
anton@4b81e4f4644d:~$ git clone https://github.com/antonbobkov/rebar3_record_bug.git tst_bug
Cloning into 'tst_bug'...
remote: Enumerating objects: 48, done.
remote: Counting objects: 100% (48/48), done.
remote: Compressing objects: 100% (31/31), done.
remote: Total 48 (delta 6), reused 41 (delta 5), pack-reused 0
Unpacking objects: 100% (48/48), done.
```
```
anton@4b81e4f4644d:~$ cd tst_bug/
```
```
anton@4b81e4f4644d:~/tst_bug$ rebar3 eunit
===> Verifying dependencies...
===> Compiling rebar_bug
===> Performing EUnit tests...
/home/anton/tst_bug/test/sample_test.erl:11:<0.161.0>: SampleRecord = {sample_record,1,undefined,2}
/home/anton/tst_bug/src/sample.erl:12:<0.161.0>: SampleRecord = {sample_record,1,undefined,2}
/home/anton/tst_bug/src/sample.erl:14:<0.161.0>: SampleRecord # sample_record . one = 1
.

Top 1 slowest tests (0.020 seconds, 35.7% of total time):
  sample_test:my_test/0: module 'sample_test'
    0.020 seconds

Finished in 0.056 seconds
1 tests, 0 failures
```
```
anton@4b81e4f4644d:~/tst_bug$ emacs src/record.hrl
```
```
anton@4b81e4f4644d:~/tst_bug$ rebar3 eunit
===> Verifying dependencies...
===> Compiling rebar_bug
===> Performing EUnit tests...
/home/anton/tst_bug/test/sample_test.erl:11:<0.123.0>: SampleRecord = {sample_record,1,undefined,2}
/home/anton/tst_bug/src/sample.erl:12:<0.123.0>: SampleRecord = {sample_record,1,undefined,2}
F
Failures:

  1) sample_test:my_test/0: module 'sample_test'
     Failure/Error: {error,
                        {badrecord,sample_record},
                        [{sample,do_stuff,1,
                             [{file,"/home/anton/tst_bug/src/sample.erl"},
                              {line,14}]},
                         {sample_test,my_test,0,
                             [{file,
                                  "/home/anton/tst_bug/test/sample_test.erl"},
                              {line,13}]}]}
     Output:


Top 1 slowest tests (0.016 seconds, 29.1% of total time):
  sample_test:my_test/0: module 'sample_test'
    0.016 seconds

Finished in 0.055 seconds
1 tests, 1 failures
===> Error running tests
```
```
anton@4b81e4f4644d:~/tst_bug$ rm -rf _build/
```
```
anton@4b81e4f4644d:~/tst_bug$ rebar3 eunit
===> Verifying dependencies...
===> Compiling rebar_bug
===> Performing EUnit tests...
/home/anton/tst_bug/test/sample_test.erl:11:<0.161.0>: SampleRecord = {sample_record,1,2}
/home/anton/tst_bug/src/sample.erl:12:<0.161.0>: SampleRecord = {sample_record,1,2}
/home/anton/tst_bug/src/sample.erl:14:<0.161.0>: SampleRecord # sample_record . one = 1
.

Top 1 slowest tests (0.020 seconds, 36.4% of total time):
  sample_test:my_test/0: module 'sample_test'
    0.020 seconds

Finished in 0.055 seconds
1 tests, 0 failures
```
