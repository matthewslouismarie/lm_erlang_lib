-module(pi).
-export([calculate_pi/1]).

% https://stackoverflow.com/a/27792212
even(X) when X >= 0 -> (X band 1) == 0.

% first parameter: number of rounds
calculate_pi(A) ->
calculate_pi(A, 4).

% first parameter: number of rounds left
% second parameter: latest calculated value of pi
% third parameter: latest calculated value of pi rounded up to the 5th decimal
% fourth parameter: before-latest calculated value of pi rounded up to the 5th decimal
calculate_pi(0, A) -> A;
calculate_pi(A, B) ->
    case even(A) of
        true -> calculate_pi(A-1, B + 4 * (1 / (1 + A * 2)));
        false -> calculate_pi(A-1, B - 4 * (1 / (1 + A * 2)))
    end.