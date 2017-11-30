-module(file_word_analysis).
-export([analyse_file/1]).

% todo adjust read_ahead
analyse_file(Filename) ->
    {ok, Device} = file:open(Filename, [raw, {read_ahead, 50}]),
    try process_file(Device)
    after
        file:close(Device)
    end.

process_file(Device) ->
    file:write_file("res.txt", io_lib:fwrite("~p.\n", [analyse_file(file:read_line(Device), Device, #{})])).

analyse_file(eof, _, Results) -> Results;
analyse_file({ok, Line}, Device, Results) ->
    NewResults = analyse_line(Line, []),
    analyse_file(file:read_line(Device), Device, merge(Results, NewResults, maps:keys(NewResults))).

merge(Results, #{}, []) -> Results;
merge(Results, NewResults, [CurrentKey|NextKeys]) ->
    {Value, Map} = maps:take(CurrentKey, NewResults),
    merge(maps:put(CurrentKey, maps:get(CurrentKey, Results, 0) + 1, Results), Map, NextKeys).

analyse_line(Line, Result) ->
    extract_words(Line, #{}, []).

% todo: use real characters
% todo: prevent code duplication
% todo: prevent empty slots
extract_words([], ResultsMap, CurrentWord) -> ResultsMap;
extract_words([NextCharacter | UnprocessedLine], ResultsMap, CurrentWord) when
        NextCharacter =:= 32;
        NextCharacter =:= 44 ->
    extract_words(UnprocessedLine, delimiter(ResultsMap, CurrentWord), []);
extract_words([NextCharacter | UnprocessedLine], ResultsMap, CurrentWord) ->
    NewCurrentWord = CurrentWord ++ [NextCharacter],
    extract_words(UnprocessedLine, ResultsMap, NewCurrentWord).

delimiter(ResultsMap, []) -> ResultsMap;
delimiter(ResultsMap, CurrentWord) -> maps:put(string:lowercase(CurrentWord), maps:get(CurrentWord, ResultsMap, 0) + 1, ResultsMap).