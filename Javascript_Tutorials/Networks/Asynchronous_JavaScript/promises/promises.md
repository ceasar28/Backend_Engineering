Introduction to Promises
Quite often when we're writing JavaScript code we need to wait for something to happen before continuing. Some examples are:

Waiting for a user's input
Waiting for an animation to finish
Waiting for some time to elapse
Waiting for a server response
In all of these cases we write asynchronous code. We tell JavaScript where to pick up after something has occurred. We can do this by passing a callback function as an argument to a function.

Let's take a look at an example:

runAnimation(function() {
// do something after the animation is complete
});
Promises give us an alternate way to configure our callback functions:

const animationPromise = runAnimation();

animationPromise.then(() => {
// do something after the animation is complete
});
As you can see, promises allow us to wire up callbacks in a different way. We can even return promises from functions!

Let's see how this benefits us further through some coding exercises.
