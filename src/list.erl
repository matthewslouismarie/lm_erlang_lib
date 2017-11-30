-module(list).
-export([unique_items/1]).

unique_items(A) ->
unique_items(A, [], 0).

% TODO: Hamlet

% A: list to sort
% B: unique items found so far
% C: number of unique items found so far
unique_items([], B, C) ->
[B, C];
unique_items(A, B, C) ->
[H|T] = A,
UNIQUE = not lists:member(H, B),
case UNIQUE of
    true -> unique_items(T, [H] ++ B, C + 1);
    false -> unique_items(T, B, C)
end.