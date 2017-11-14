-module(pi).
-export([calculate_pi/1]).

% first parameter: number of rounds
calculate_pi(Precision) when
    is_integer(Precision),
    Precision >= 0 ->
calculate_pi(0, 0, 1, Precision, null, 4).

calculate_pi(_, _, _, Precision, IntSamePi, IntSamePi) when
    is_integer(Precision),
    is_integer(IntSamePi),
    Precision >= 0 ->
IntSamePi / math:pow(10, Precision);

calculate_pi(LatestPi, RoundNo, CurrentSign, Precision, _, IntLatestPi) when
    is_number(LatestPi),
    is_integer(RoundNo),
    RoundNo >= 0,
    (CurrentSign =:= 1) or (CurrentSign =:= -1),
    is_integer(Precision),
    Precision >= 0,
    is_integer(IntLatestPi) ->
NewPi = LatestPi + CurrentSign * 4 * (1 / (1 + RoundNo * 2)),
calculate_pi(NewPi, RoundNo + 1, -1 * CurrentSign, Precision, IntLatestPi, round(NewPi * math:pow(10, Precision))).