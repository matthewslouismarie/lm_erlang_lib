# lm_erlang_lib
An OTP library.

## How to run without rebar3
    $ cd src
Then, compile and run any script. E.g.
    $ c(pi).
    $ pi:calculate_pi(5).

## How to run with rebar3
First, install rebar3.
    $ git clone https://github.com/erlang/rebar3.git
    $ cd rebar3
    $ ./bootstrap
Afterwards, add the rebar3 folder to your PATH variable on Windows, or create an
alias for it on Linux.

To compile and run it:
    $ rebar3 shell
Then enter the command you want. E.g.
    $ pi:calculate_pi(5).

## To generate documentation:
    $edoc:application(lm_erlang_lib, []).