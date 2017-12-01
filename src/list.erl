-module(list).
-export([analyze/2]).

analyze(A, Format) ->
Items = unique_items(A, #{}),
display(maps:keys(Items), Items, Format).

display([], Items, _) ->
    io:fwrite("Total number of items: ~w.\n", [maps:size(Items)]),
    Items;
display([CurrentKey|NextKeys], Items, Format) when
        Format =:= "w";
        Format =:= "c" ->
    io:fwrite("~"++Format++" => ~w \n", [CurrentKey, maps:get(CurrentKey, Items)]),
    display(NextKeys, Items, Format).

unique_items([], FinalResultMap) ->
FinalResultMap;

unique_items([NextItem | RemainingItems], ResultMap) ->
    CurrentCount = maps:get(NextItem, ResultMap, 0),
    NewResultMap = maps:put(NextItem, CurrentCount + 1, ResultMap),
    unique_items(RemainingItems, NewResultMap).