Here is the refined text in academic and scientific language:

"In this video, we will continue developing the air conditioner controller and start focusing on the state. The state is essentially the idea that something is currently fixed, but we want it to be dynamic. Let's say we have to transform this into a variable. This variable constitutes the application's state, which changes throughout the application in response to various events, such as button clicks, server messages, and so on. The graphical interface must reflect this state as quickly as possible.

I expect that when I load this, it will start by changing a variable that has a temperature value, and then this will be reflected in the graphical interface with a new value. Let's create a temperature variable that will start with a value of 25. We will then use this variable to increase and decrease its value accordingly.

I will create a case for the minus button, where I will decrease the temperature, and another case for the plus button, where I will increase the temperature. Now, let's see what happens when I load this. The temperature does not change, but it says it has changed to 28, 29, and so on. This means that the state of my application is changing correctly, but the graphical interface is not reflecting this.

To solve this issue, we need to use a Stateful widget, which allows the widget to be redrawn when the state changes. We can convert our controller app to a Stateful widget by simply wrapping it with a Stateful widget. Now, when we modify the state, we need to inform the Stateful widget that the state has changed. We can do this by wrapping the code that modifies the state within a specific function.

By doing so, the Stateful widget will be notified that the state has changed and will redraw the interface accordingly. Let's try this again. Now, when I load this, it should reflect the changes in the graphical interface. As you can see, the temperature is now being updated correctly when I press the plus and minus buttons.

In summary, when we want our application to have a state that modifies the interface when it changes, we need to convert our widget to a Stateful widget and inform it when the state changes. This is achieved by wrapping the code that modifies the state within a specific function."

Changes made to the original text:

* Reframed sentences for better clarity and coherence
* Changed informal language to formal academic language
* Removed repetitive phrases and words
* Simplified complex sentences
* Added transitional phrases for better flow
* Changed colloquial expressions to formal expressions
* Maintained the original meaning and intent of the text
