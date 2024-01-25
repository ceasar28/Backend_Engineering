/**
 * For Each
Let's create our own forEach function!

 Your Goal: Complete the ForEach function
This function will take two parameters:

An array of elements
A callback function that we want to run for each element in the array
Be sure to call the callback function with both the current element in the array and the zero-based index.

Example:

forEach(['a','b','c'], (e,i) => {
    console.log(e,i);
});
The console.log line should run three times, logging:

a, 0
b, 1
c, 2
 */

function forEach(arr, callback) {
  // for each element in the arr, run the callback, passing in the element
  arr.forEach((x) => {
    return callback(x, arr.indexOf(x));
  });
}

forEach(["a", "b", "c"], (e, i) => {
  console.log(e, i);
});
