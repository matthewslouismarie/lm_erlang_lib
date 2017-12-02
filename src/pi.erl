%% @docfile "author.edoc"
%% @doc Calculates pi with the specified decimal precision.
%% @since 1.0.0
%% @version 1.0.0
-module(pi).
-export([calculate_pi/1]).

%% @spec calculate_pi(Precision) -> integer()
%% @doc Calculates pi with the specified decimal precision.
%% @param Precision The decimal precision of the calculation (i.e. the number of
%%                  digits at the right of the dot).
%% @returns The calculated value of pi with the given precision.
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