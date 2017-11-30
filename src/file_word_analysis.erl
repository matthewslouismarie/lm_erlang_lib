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
    read_one_line(file:read_line(Device), Device).

read_one_line(eof, _) -> [];
read_one_line({ok, Line}, Device) ->
    analyse_line(Line, []).

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
delimiter(ResultsMap, CurrentWord) -> maps:put(CurrentWord, maps:get(CurrentWord, ResultsMap, 0) + 1, ResultsMap).