%% @author Andy Cobley
%% @docfile "author.edoc"
%% @doc Counts the number of different characters in the specified file using
%%      concurrency.
%% @since 1.0.0
%% @version 1.0.0
-module(ccharcount).
-export([load/1, count/3, go/2, join/2, split/2]).

%% @spec load(Filename) -> list()
%% @todo string:to_lower is obsolete
%% @doc Read a file and returns an analysis of its letter frequency.
%% @param Filename The name of the file to analyze.
%% @returns A list of tuples.
load(Filename) ->
    {ok, Bin} = file:read_file(Filename),
    List = binary_to_list(Bin),
    Length = round(length(List) / 20),
    Ls = string:to_lower(List),
    Sl = split(Ls, Length),
    io:fwrite("Loaded and Split~n"),
    Result = countsplit(Sl, []),
    Result.

% returns a list of tuples. E.g. [{"a", 10518}, …].
% first parameter: list to analyse. Each item is a string.
% second parameter: result so far
countsplit([], PIDs) ->
    receive_results(PIDs, []);
countsplit([H|T], PIDs) ->
    %Ul=shake:sort(Sl),
    NewPid = spawn(ccharcount, go, [H, self()]),
    countsplit(T, PIDs ++ [NewPid]).

receive_results([], Results) ->
    Results;
receive_results([_|T], Results) ->
    receive
        {NewResult} -> receive_results(T, join(Results, NewResult));
        _Other -> {error, unknown}
    end.

% what if a certain letter does not appear in the list? Maybe that's not possible. How is the correct order ensured? Maybe in go().
join([], []) ->
    [];
join([], R)->
    R;
join([H1|T1], [H2|T2]) ->
    {_, N} = H1,
    {C1, N1} = H2,
    [{C1, N + N1}] ++ join(T1, T2).

%% @todo Replace substr by slice.
% splits a string into several string of Length characters.
split([], _) ->
    [];
split(List, Length) ->
    S1 = string:substr(List, 1, Length),
    case length(List) > Length of
        true -> S2 = string:substr(List, Length + 1, length(List));
        false -> S2 = []
    end,
    [S1] ++ split(S2, Length).

count(_, [], N) ->
    N;
count(Ch, [H|T], N) ->
    case Ch == H of
        true -> count(Ch, T, N + 1);
        false -> count(Ch, T, N)
    end.

go(L, PID)->
    Alph = [$a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n,$o,$p,$q,$r,$s,$t,$u,$v,$w,$x,$y,$z],
    PID ! {rgo(Alph, L, [])}.

% called once per letter
rgo([H|T], L, Result) ->
    N = count(H, L, 0),
    Result2 = Result ++ [{[H], N}],
    rgo(T, L, Result2);

rgo([], _, Result) ->
    Result.