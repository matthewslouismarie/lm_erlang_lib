# lm_erlang_lib

An OTP library providing utility functions to calculate pi with a custom
precision, and to analyse lists and files.

Here is the list of available functions:

 - To calculate pi with a five-decimals precision, do: `pi:pi().`.
 - To count the unique letters in a file using concurrency, do: `ccharcount:load("hamlet.txt").`.
 - To count the unique words in a file, do: `fanalysis:open("hamlet.txt", sort_by_count).` or `fanalysis:open("hamlet.txt", sort_by_word).`. (The output will be written to the file result.txt.)
 - To count the unique items in a list, do: `unique_items:analyze("This is a string", letter).` or `unique_items:analyze([4, 1, 0, 0, 9, "9"], default).`.

This is a rebar3 project. You don't need it to run the program, but it makes it
easier. It also allows you to generate the documentation for the project and to
run unit tests.

## How to run without rebar3

First, move to the src/ directory of the project.

    $ cd src

Then, compile and run any script. E.g.

    $ c(pi).
    $ pi:pi().

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

    1> pi:pi().

## How to generate documentation (require rebar3)

First, make sure to delete the folder "doc" if it already exists. Then:

    $ rebar3 edoc

## How to run tests (require rebar3)

    $ rebar3 eunit