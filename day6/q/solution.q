/ Recursive solution
checkDistinct: {[lst; i; len]
    subLst: lst[i + til[len]];
    $[subLst ~ distinct subLst;
        i + len;
        checkDistinct[lst; i+1; len]
    ]
 };

/ Vector-based solution
findFirstNDistinctSublist: {[lst; n]
    / The first sublist has 0 chars removed, the second has 1, etc
    cascading: _[; input] each til count input;
    / Take the first n elems from each sublist
    elements: n #' cascading;
    / Find idx of first distinct sublist
    sublistDistinct: ({x ~ distinct x} each elements) ? 1b;
    / Return idx of last character of first distinct sublist
    n + sublistDistinct
 };

solutionPartOne: {[inputFilePath]
    input: first read0 inputFilePath;
    checkDistinct[input; 0; 4]
 };

solutionPartTwo: {[inputFilePath]
    input: first read0 inputFilePath;
    findFirstNDistinctSublist[input; 14]
 };

solutionPartOne[`:day6/q/input]
solutionPartTwo[`:day6/q/input]
