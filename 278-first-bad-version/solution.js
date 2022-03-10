/**
 * Definition for isBadVersion()
 *
 * @param {integer} version number
 * @return {boolean} whether the version is bad
 * isBadVersion = function(version) {
 *     ...
 * };
 */

/**
 * @param {function} isBadVersion()
 * @return {function}
 */
var solution = function(isBadVersion) {
  const dig = (set, previous = null) => {
    const [l, r] = set;

    if (set.size == 1) {
      if (isBadVersion(l)) {
        return l;
      } else {
        return previous;
      }
    }

    if (r - l == 1) {
      if (isBadVersion(l)) return l;
      return r;
    }

    const median = Math.round((l + r) / 2);

    if (isBadVersion(median)) {
      const newSet = new Set([l, median]);
      return dig(new Set([l, median]), median);
    } else {
      const scopedMedian = Math.min(median + 1, r);
      const newSet = new Set([scopedMedian, r]);
      return dig(newSet, median);
    }
  };

  return function(n) {
    const median = Math.round(n / 2);

    if (isBadVersion(median)) {
      return dig(new Set([1, median]));
    } else {
      return dig(new Set([median + 1, n]));
    }
  }
};

let a =
  solution((n) => {
    if (n >= 4) {
      return true;
    }
    return false;
  })(5);
console.log(a);

let b =
  solution((n) => {
    if (n >= 1) {
      return true;
    }
    return false;
  })(2);
console.log(b);

let c =
  solution((n) => {
    if (n >= 1) {
      return true;
    }
    return false;
  })(3);
console.log(c);


let d =
  solution((n) => {
    if (n >= 2) {
      return true;
    }
    return false;
  })(3);
console.log(d);

let e =
  solution((n) => {
    if (n >= 1702766719) {
      return true;
    }
    return false;
  })(2126753390);
console.log(e);

let f =
  solution((n) => {
    if (n >= 1150769282) {
      return true;
    }
    return false;
  })(1420736637);
console.log(f);
