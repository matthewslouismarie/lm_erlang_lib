-module(readfile).
-export([readlines/1]).

% from https://stackoverflow.com/a/2475613/7089212

readlines(FileName) ->
    {ok, Device} = file:open(FileName, [raw, {read_ahead, 50}]),
    try get_all_lines(file:read_line(Device), Device)
      after file:close(Device)
    end.

get_all_lines(eof, _) -> [];
get_all_lines({ok, Line}, Device) -> Line ++ get_all_lines(file:read_line(Device), Device).