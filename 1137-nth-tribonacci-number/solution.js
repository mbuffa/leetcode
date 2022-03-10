/**
 * @param {number} n
 * @return {number}
 */
var tribonacci = function(n, memo = {0: 0, 1: 1, 2: 1}) {
    if (n < 0) return 0;
    if (memo[n] !== undefined) return memo[n];
    memo[n] = tribonacci(n - 3, memo) + tribonacci(n - 2, memo) + tribonacci(n - 1, memo);
    return memo[n];
};

console.log(tribonacci(25));