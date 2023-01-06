convertLetterToPriority: {
    nums: "i"$x; / char to int representation
    lowercase: @[nums; where nums >= 97; -; 96]; / a=97, we need it to be 1
    @[lowercase; where lowercase >= 65; -; 38] / A=65, we need it to be 27
 };

uniqueIntersection: {distinct (inter/) x} / unique elements that exist in all lists

solutionPartOne: {[inputFilePath]
    / Read input into list of strings
    input: read0 inputFilePath;
    / Split each row into halves, find elements that exist in both halves, convert to priorities, sum total
    sum convertLetterToPriority raze uniqueIntersection each {(count[x] div 2) cut x} each input
 };

solutionPartTwo: {[inputFilePath]
    / Read input into list of strings
    input: read0 inputFilePath;
    / Seperate rows into groups of 3, find elements that exist across the 3 lists, convert to priorities, sum total
    sum convertLetterToPriority raze uniqueIntersection each (3 cut input)
 };

solutionPartOne[`:day3/q/input]
\t:1000 solutionPartOne[`:day3/q/input]

solutionPartTwo[`:day3/q/input]
\t:1000 solutionPartTwo[`:day3/q/input]