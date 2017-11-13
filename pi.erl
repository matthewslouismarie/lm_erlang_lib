-module(pi).
-export([calculate_pi/1]).

% first parameter: number of rounds
calculate_pi(Precision) ->
calculate_pi(0, 0, 1, Precision, null, 4).
    

% @todo add guards
calculate_pi(_, _, _, Precision, IntSamePi, IntSamePi) ->
IntSamePi / math:pow(10, Precision);
calculate_pi(LatestPi, NumberOfRounds, CurrentSign, Precision, _, IntLatestPi) ->
NewPi = LatestPi + CurrentSign * 4 * (1 / (1 + NumberOfRounds * 2)),
calculate_pi(NewPi, NumberOfRounds + 1, -1 * CurrentSign, Precision, IntLatestPi, trunc(NewPi * math:pow(10, Precision))).