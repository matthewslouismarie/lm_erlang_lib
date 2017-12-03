%% @author Andy Cobley
%% @docfile "author.edoc"
%% @doc Counts the number of different characters in the specified file using
%%      concurrency.
%% @since 1.0.0
%% @version 1.0.0
-module(ccharcount).
-export([load/1, go/2]).

%% @spec load(Filename) -> list()
%% @doc Reads a file and returns an analysis of its letter frequency.
%% @param Filename The name of the file to analyze.
%% @returns A list of tuples.
load(Filename) ->
    {ok, Bin} = file:read_file(Filename),
    List = binary_to_list(Bin),
    Length = round(length(List) / 20),
    Ls = string:lowercase(List),
    Sl = split(Ls, Length),
    io:fwrite("Loaded and Split~n"),
    Result = countsplit(Sl, []),
    Result.

%% @spec countsplit(ChunksList, PidList) -> list()
%% @doc Analyzes all the given chunks using concurrency, fetches back the result
%%      and returns it.
%% @param Chunks The list to analyse. Each item is a string.
%% @param PIDs The PIDs list of the created processes (which is only used to
%%             determine the number of processes).
%% @returns The results as a list of tuples.
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

join([], []) ->
    [];
join([], R)->
    R;
join([H1|T1], [H2|T2]) ->
    {_, N} = H1,
    {C1, N1} = H2,
    [{C1, N + N1}] ++ join(T1, T2).

%% @spec split(String, Length) -> list()
%% @doc Splits a string into several string of Length characters.
split([], _) ->
    [];
split(List, Length) ->
    S1 = string:slice(List, 0, Length),
    case length(List) > Length of
        true -> S2 = string:slice(List, Length, length(List));
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

%% @spec go(L, PID) -> none()
%% @doc Processes a chunk and sends the result to the parent process.
%% @param L The chunk to analyze.
%% @param PID The PID of the parent process.
go(L, PID)->
    Alph = [$a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n,$o,$p,$q,$r,$s,$t,$u,$v,$w,$x,$y,$z],
    PID ! {rgo(Alph, L, [])}.

rgo([H|T], L, Result) ->
    N = count(H, L, 0),
    Result2 = Result ++ [{[H], N}],
    rgo(T, L, Result2);

rgo([], _, Result) ->
    Result.