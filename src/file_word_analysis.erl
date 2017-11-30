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
    extract_words(Line, [], []).

extract_words([], ProcessedArray, CurrentWord) -> ProcessedArray;
extract_words([32 | UnprocessedLine], ProcessedArray, CurrentWord) ->
    extract_words(UnprocessedLine, ProcessedArray ++ [CurrentWord], []);
extract_words([NextCharacter | UnprocessedLine], ProcessedArray, CurrentWord) ->
    NewCurrentWord = CurrentWord ++ [NextCharacter],
    extract_words(UnprocessedLine, ProcessedArray, NewCurrentWord).