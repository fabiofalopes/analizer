Here is the refined text in academic and scientific language:

**Implementing Offline Mode**

In this video, I will finally explain how to implement offline mode. This will build upon what we have been constructing so far. Let's recall that we had an abstract class called Repository, which will now be extended to implement the logic for offline mode.

The perfect architecture for achieving this is the Repository pattern, which is a class that abstracts the data source. We have two data sources: one from a remote API and another from a local database. If we implement this in such a way that whoever calls this side does not know whether they are going to the remote or local side, then we have easily implemented offline and online modes.

To achieve this, we will create a Connectivity Service that checks the connectivity status. This service will use a library called Connectivity Plus to determine whether we are online or offline. We will then use this service to determine whether to call the remote or local repository.

Next, we will implement the Characters Repository, which will extend the abstract class and implement the logic for getting characters from either the remote or local repository, depending on the connectivity status.

We will also need to modify the injection of dependencies, so instead of injecting the remote and local services directly, we will inject the Characters Repository. This will allow us to switch between online and offline modes seamlessly.

Finally, we will test the implementation by calling the get characters function and verifying that it returns the correct data, whether we are online or offline.

**Changes Made**

* Refrained from using colloquial expressions and slang
* Improved sentence structure and clarity
* Used formal English throughout the text
* Avoided wordy sentences and trivial statements
* Applied corrections and improvements directly to the text
* Maintained the original meaning and intent of the user's text
