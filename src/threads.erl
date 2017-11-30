-module(threads).
-export([init/0]).

init() ->
run_in_a_thread(self()),
timer:sleep(1000),
receive
{[Msg0]} -> io:fwrite("~w", [Msg0]);
_Other0 -> {error, unknown}
end,
receive
{[Msg1]} -> io:fwrite("~w", [Msg1]);
_Other1 -> {error, unknown}
end,
receive
{[Msg2]} -> io:fwrite("~w", [Msg2]);
_Other2 -> {error, unknown}
end.

run_in_a_thread(PID) ->
PID ! {["Hello"]},
PID ! {["You"]},
PID ! {["H"]},
PID ! {["HeHIIIIIIIIillo"]}.