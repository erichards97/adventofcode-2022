solutionPartOne: {[inputFilePath]
    / Read input into list of strings
    input: read0 inputFilePath;

    nums: flip "J"$ raze each "-" vs'' "," vs' input;

    count nums where ((nums[0] >= nums [2]) and (nums [1] <= nums[3])) or ((nums[0] <= nums [2]) and (nums [1] >= nums[3]))
 };

solutionPartTwo: {[inputFilePath]
    / Read input into list of strings
    input: read0 inputFilePath;

    nums: flip "J"$ raze each "-" vs'' "," vs' input;

    count nums where (
            ((nums[0] >= nums[2]) and (nums[0] <= nums[3])) or
            ((nums[1] >= nums[2]) and (nums[1] <= nums[3])) or
            ((nums[2] >= nums[0]) and (nums[2] <= nums[1])) or
            ((nums[3] >= nums[0]) and (nums[3] <= nums[1]))
        )
 };

solutionPartOne[`:day4/q/input];
\t:1000 solutionPartOne[`:day4/q/input];
solutionPartTwo[`:day4/q/input];
\t:1000 solutionPartTwo[`:day4/q/input];