/*
Kangaroo
There are two kangaroos on an x-axis ready to jump in the positive
direction (i.e, toward positive infinity). The first kangaroo starts at
location x1 and moves at a rate of v1 meters per jump. The second kangaroo
starts at location x2 and moves at a rate of v2 meters per jump. Given the
starting locations and movement rates for each kangaroo, can you
determine if they'll ever land at the same location at the same time?
*/

function kangaroo(x1, v1, x2, v2) {
  if ( v1 > v2 && ((x2 - x1) % (v1 - v2)) === 0) {
    return true;
  } else { return false; }
}
console.log("====Kangaro===");
console.log(kangaroo(0, 3, 4, 2) === true);
console.log(kangaroo(0, 2, 5, 3) === false);

/*
Consider two sets of positive integers, a and b. We say that a positive
integer, x, is between sets a and b if the following conditions are
satisfied:

All elements in a are factors of x.
 x is a factor of all elements in b.
Given a and b,find and print the number of integers (i.e., possible 's)
that are between the two sets.
*/

function betweenTwoSets(a, b) {
  let lc = a[0];
  let gc = b[0];
  for(let i = 1; i < a.length; i++) {
    lc = lcm(lc, a[i]);
  }

  for (let j = 1; j < b.length; j++) {
    gc = gcd(gc, b[j]);
  }

  let count = 0;

  for (let k = lc; k <= gc; k += lc) {
    if (gc % k === 0) { count += 1; }
  }
  return count;
}

function lcm(a, b) {
  return (a * b / (gcd(a, b)));
}

function gcd(a, b) {
  if (!b) {
    return a;
  } else { return gcd(b, a % b); }
}
console.log("===Between Two Sets===");
console.log(betweenTwoSets([2, 4], [16, 32, 96]) === 3);
