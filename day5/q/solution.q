splitIntoParts: {[input]
    divider: input ? "";
    ((divider # input);((divider+1) _ input))
 };

parseInitialStacks: {[partOne]
    stacks: reverse each flip 4 cut' -1 _ partOne;
    stacks: `$ .[stacks; (::; ::); ssr[; "[][ ]"; ""]];
    @[stacks; ::; {x where not null x}]
 };

parseMoves: {[partTwo]
    ("I"$ .[" " vs' partTwo; (::; (1; 3; 5))])
 };

parseInput: {[input]
    parts: splitIntoParts[input];
    initialStacks: parseInitialStacks[parts[0]];
    moves: parseMoves[parts[1]];
    (initialStacks; moves)
 };

applyMove: {[upgrade; stacks; move]
    num: move[0];
    source: move[1] - 1;
    target: move[2] - 1;
    $[upgrade;
        stacks[target],: neg[num] # stacks[source];
        stacks[target],: reverse neg[num] # stacks[source]
    ];
    stacks[source]: neg[num] _ stacks[source];
    stacks
 };

solutionPartOne: {[inputFilePath]
    / Read input into list of strings
    input: read0 inputFilePath;
    parsedInput: parseInput[input];
    stacks: parsedInput[0];
    moves: parsedInput[1];
    res: stacks applyMove[0b]/ moves;
    last each res
 };

solutionPartTwo: {[inputFilePath]
    / Read input into list of strings
    input: read0 inputFilePath;
    parsedInput: parseInput[input];
    stacks: parsedInput[0];
    moves: parsedInput[1];
    res: stacks applyMove[1b]/ moves;
    last each res
 };

solutionPartOne[`:day5/q/input]
solutionPartTwo[`:day5/q/input]