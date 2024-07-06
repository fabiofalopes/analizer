Here is the refined text in academic and scientific language:

**Continuing the Development of the Lord of the Rings Application**

In this video, we will continue developing the Lord of the Rings application. We had previously implemented a button that, when loaded, sends a request to the server through an API to retrieve a list of characters from the Lord of the Rings. Let's simulate a slow server response. As we can see, the button takes some time to respond, and if we were to click it multiple times, it would send multiple requests to the server unnecessarily. This is one of the problems we want to resolve. Another issue is that the character details are not yet functioning properly.

**Resolving the Issues**

To address these issues, we will create a similar function to the one we used previously, but this time, it will call the API to obtain the data of a specific character and return an object with that information. We will then use this function to retrieve the character data and display it on the screen.

**Using Futures and Async/Await**

When we call this function, it will return a Future, which is an object that can have two states: either it is in progress or it has completed. If it has completed, it can either have succeeded or failed. We can use the `then` method to wait for the Future to complete and then retrieve the character data. However, this approach has a problem: it blocks the execution of the code, which is not desirable in our case.

**Using the `FutureBuilder` Widget**

To resolve this issue, we can use the `FutureBuilder` widget, which is a more straightforward way to handle Futures. The `FutureBuilder` widget takes a Future as a parameter and returns a widget that depends on the state of the Future. We can use this widget to display different screens depending on the state of the Future.

**Implementing the `FutureBuilder`**

We will create a `FutureBuilder` widget and pass the Future returned by our function as a parameter. The `FutureBuilder` will then call a builder function that takes a `Snapshot` as a parameter. The `Snapshot` has a `connectionState` property that indicates the state of the Future. We can use this property to display different screens depending on the state of the Future.

**Handling the Different States**

We will handle three cases: when the Future is waiting, when it has completed successfully, and when it has failed. In the waiting case, we will display a circular progress indicator. In the success case, we will display the character data. In the failure case, we will display an error message.

**Conclusion**

In conclusion, to use an external API in our application, we need to implement asynchronous functions in our repository that return Futures. We then need to use the `FutureBuilder` widget to handle these Futures and display different screens depending on the state of the Future. This approach allows us to handle the different states of the Future in a more straightforward way.

**Changes Made**

* Refined the text to improve clarity and coherence
* Changed the tone to a more academic and scientific language
* Added headings to organize the text
* Removed trivial statements and repeated phrases
* Improved sentence structure and grammar
* Used common and easy-to-understand words and phrases
