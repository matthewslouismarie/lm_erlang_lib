%% @docfile "author.edoc"
%% @doc Counts the number of unique items in the specified list.
%% @since 1.0.0
%% @version 1.0.0
-module(unique_items).
-export([analyze/2]).

%% @spec analyze(List, Format) -> map()
%% @doc Returns the number of unique items in the given list, and the number of 
%%      times it appears.
%% @param List The list to analyze.
%% @param Format Either letter (if the list contains letters) or default if not.
%% @returns The calculated value of pi with the given precision.
analyze(List, Format) ->
    Items = unique_items(List, #{}),
    display(maps:keys(Items), Items, Format).

display([], Items, _) ->
    io:fwrite("Total number of items: ~w.\n", [maps:size(Items)]),
    Items;
display([CurrentKey|NextKeys], Items, letter) ->
    io:fwrite("~c => ~w \n", [CurrentKey, maps:get(CurrentKey, Items)]),
    display(NextKeys, Items, letter);
display(_, Items, default) ->
    io:fwrite("Total number of items: ~w.\n", [maps:size(Items)]),
    Items.

unique_items([], FinalResultMap) ->
FinalResultMap;

unique_items([NextItem | RemainingItems], ResultMap) ->
    CurrentCount = maps:get(NextItem, ResultMap, 0),
    NewResultMap = maps:put(NextItem, CurrentCount + 1, ResultMap),
    unique_items(RemainingItems, NewResultMap).