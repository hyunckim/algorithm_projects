/*
A left rotation operation on an array of size n shifts each of the
array's elements 1 unit to the left. For example, if 2 left rotations are
performed on array [1, 2, 3, 4, 5], then the array would become
[3, 4, 5, 1, 2].
*/

function arrays_left_rotation(d, array) {
  for (let i = 0; i < d; i++) {
        array.push(array.shift());
    }
    console.log(array.join(" "));
}
