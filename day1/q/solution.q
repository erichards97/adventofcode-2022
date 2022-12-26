cumulativeSumSolution: {[inputFilePath]
    / Read input into list of strings
    input: read0 inputFilePath;
    / Cast then cumulativeely sum the list, e.g. "1","2","3","","4" becomes 1 3 6 6 10 
    cumulativeSum: (+\) "I"$input;
    / Filter to items of the list where it's equal to the previous element
    / i.e. where we had an empty an row separating elves
    cumulativeSumPerGroup: cumulativeSum where cumulativeSum=(prev cumulativeSum);
    / Subtract the previous (accumulating) sum from each element, giving the calories carried by each elf
    sumPerGroup: cumulativeSumPerGroup - (prev cumulativeSumPerGroup);
    / Sort descending
    sortedCaloriesPerElf: desc sumPerGroup;
    / Return dict of results
    / part1 is the max calories carried by any elf
    / part2 is the sum of the top 3 elves 
    (`part1`part2)!(first sortedCaloriesPerElf; sum 3#sortedCaloriesPerElf)
 };

cumulativeSumSolution[`:day1/q/input]
\t:1000 cumulativeSumSolution[`:day1/q/input]
