shapeScores: (`A`B`C`X`Y`Z)!(1;2;3;1;2;3);

moveWinsAgainst: {[move]
    ((move+1) mod 3) + 1
 };

moveLosesAgainst: {[move]
    (move mod 3) + 1
 };

parseInput: {[inputFilePath]
    / Read input into list of strings
    input: read0 inputFilePath;
    / Flip to two lists, opponent's moves and my response
    moves: `$ flip " " vs' input;
    / Return as two-column table
    ([] opponentMove: shapeScores[moves[0]]; response: shapeScores[moves[1]])
 };

solutionPartOne: {[inputFilePath]
    games: parseInput[inputFilePath];

    games: update 
        win: moveWinsAgainst[response]=opponentMove,
        draw: opponentMove=response
    from games;
    
    games: update
        score: response+(6*win)+(3*draw)
    from games;

    sum games[`score]
 };

solutionPartTwo: {[inputFilePath]
    games: parseInput[inputFilePath];

    games: update
        score: ?[response=1; moveWinsAgainst[opponentMove]; / Choose the move that causes opp to win
                ?[response=2; 3+opponentMove; / Choose the same move as opp
                ?[response=3; 6+moveLosesAgainst[opponentMove]; 0Ni]]] / Choose the move that causes us to win
    from games;

    sum games[`score]
 };

solutionPartOne[`:day2/q/input]
\t:1000 solutionPartOne[`:day2/q/input]
solutionPartTwo[`:day2/q/input]
\t:1000 solutionPartTwo[`:day2/q/input]
