Pact: A Promise Library
Promises should not be scary! Let's prove it by creating our own promise implementation.

If we take a look at promises on MDN, we can see that the basic idea is to create a proxy for a value that will be asynchronously resolved. The API looks like this:

var promise = new Promise(function(resolve, reject) {
// asynchronously resolve a value
setTimeout(() => {
resolve(42);
}, 100);
});

promise.then((value) => {
console.log(value); // 42
});
Promises may look like some crazy magic , but underneath the hood they are just a convienent API for function callbacks. Let's demonstrate this by creating our own implementation of a Promise called Pact!

We'll start out with the very basics and move quickly through a number of stages. By the end of this lesson, your Pact will be able to handle asynchronous then, catch and even chaining callbacks like so:

let pact = new Pact((resolve, reject) => {
setTimeout(() => {
resolve(42);
}, 100);
}).then((val) => {
console.log(val) // 42;
return val \* 2;
}).then((val) => {
console.log(val) // 84;
});
Excited? Let's get started!
