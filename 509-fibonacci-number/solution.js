/**
 * @param {number} n
 * @return {number}
 */
function fib(n, memo = {0: 0, 1: 1}) {
    if (n <= 0) return 0;
    if (memo[n] !== undefined) return memo[n];
    memo[n] = fib(n - 2, memo) + fib(n - 1, memo);
    return memo[n];
};

console.log(fib(100));
