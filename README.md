# Minitest Summarize

I love Minitest. It's really helped me not just better understand BDD, but
really dive into how the tests are run and so forth.

The source for Minitest is **_really_** easy to read and understand.

However, even despite some of my favorite output plugins making things nice,
the one thing I got tired of was the long line of dots (or [emoji][1]!) so I
decided to fix it.

Thus, this Minitest plugin.

## Description

Instead of printing out the standard Minitest output per test, this will
instead update a summary of the results, in color unless told not to use color.

## Install

```sh
gem install minitest-summarize
```

## Usage

```ruby
require 'minitest/autorun'
require 'minitest/summarize'
```

Then, when your tests are run, it'll display a summary before the results long
form results:

```text
[Passed: 30] [Failed 2] [Error: 0] [Skipped: 1]

Finished in 0.002721s, 12129.5569 runs/s, 11761.9946 assertions/s.

  1) Failure:
do some tests#test_0031_has some fails [/Users/rcarnahan/repos/minitest-summarize/spec/main_spec.rb:14]:
Expected: 1
  Actual: 0

  2) Failure:
do some tests#test_0032_has some fails [/Users/rcarnahan/repos/minitest-summarize/spec/main_spec.rb:14]:
Expected: 2
  Actual: 1

  3) Skipped:
do some tests#test_0033_has some skips [/Users/rcarnahan/repos/minitest-summarize/spec/main_spec.rb:20]:
Skip #0
```

If you do not want to use color, then you must specify that before tests are
run via the `no_color!` class method:

```ruby
Minitest::Summarize.no_color!
```

## License

MIT.

[1]: <https://github.com/tenderlove/minitest-emoji>