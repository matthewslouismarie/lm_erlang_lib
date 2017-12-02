-module(fanalysis).
-export([open/2]).

%% @todo Adjust read_ahead.
open(Filename, SortBy) when
    SortBy =:= sort_by_count;
    SortBy =:= sort_by_word ->
    ResultMap = analyze_file(Filename),
    SortedResultList = sort_result(maps:to_list(ResultMap), SortBy),
    file:write_file("result.txt", io_lib:fwrite("~p.\n", [SortedResultList])).

sort_result(ResultList, sort_by_word) ->
    lists:keysort(1, ResultList);
sort_result(ResultList, sort_by_count) ->
    lists:reverse(lists:keysort(2, ResultList)).

analyze_file(Filename) ->
    {ok, File} = file:open(Filename, [raw, {read_ahead, 50}]),
    try analyze_file(file:read_line(File), File, #{}) of
        ResultMap -> ResultMap
    after
        file:close(File)
    end.

analyze_file(eof, _, Result) ->
    Result;
analyze_file({ok, Line}, File, Result) ->
    NewResult = analyse_line(Line, []),
    analyze_file(file:read_line(File), File, combine_results(Result, NewResult, maps:keys(NewResult))).

combine_results(Result, #{}, []) -> Result;
combine_results(Result, NewResult, [CurrentKey|NextKeys]) ->
    {_, Map} = maps:take(CurrentKey, NewResult),
    combine_results(maps:put(CurrentKey, maps:get(CurrentKey, Result, 0) + 1, Result), Map, NextKeys).

analyse_line(Line, _) ->
    extract_words(Line, #{}, []).

%% @todo Use real characters.
extract_words([], ResultMap, _) -> ResultMap;
extract_words([NextCharacter | UnprocessedLine], ResultMap, CurrentWord) when
        NextCharacter < 65;
        NextCharacter > 90,
        NextCharacter < 97;
        NextCharacter > 122 ->
    extract_words(UnprocessedLine, add_word_to_result(ResultMap, CurrentWord), []);
extract_words([NextCharacter | UnprocessedLine], ResultMap, CurrentWord) ->
    NewCurrentWord = CurrentWord ++ [NextCharacter],
    extract_words(UnprocessedLine, ResultMap, NewCurrentWord).

add_word_to_result(ResultMap, []) ->
    ResultMap;
add_word_to_result(ResultMap, CurrentWord) ->
    maps:put(string:lowercase(CurrentWord), maps:get(CurrentWord, ResultMap, 0) + 1, ResultMap).