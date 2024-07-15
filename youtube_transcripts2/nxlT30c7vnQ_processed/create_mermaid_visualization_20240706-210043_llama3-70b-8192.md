Here is the Mermaid syntax visualization for the input:
```mermaid
graph LR
    classDef blackWhite fill:#000,stroke:#fff
    classDef bold stroke-width:2px

    subgraph Navigation App
        direction LR
        MainPage[Main Page] -->|has|> MainPageViewModel[Main Page View Model]
        MainPageViewModel -->|has|> selectedIndex[Selected Index]
        MainPageViewModel -->|notifies|> MainPage[Main Page]
        MainPage -->|uses|> Provider[Provider]
        Provider -->|provides|> MainPageViewModel[Main Page View Model]

        subgraph Page 2
            direction LR
            Button[Button] -->|onPressed|> MainPageViewModel[Main Page View Model]
            MainPageViewModel -->|updates|> selectedIndex[Selected Index]
            selectedIndex -->|notifies|> MainPage[Main Page]
        end

        class MainPage, MainPageViewModel, Provider, Button, selectedIndex blackWhite
        class MainPage, MainPageViewModel, Provider bold
    end

VISUAL EXPLANATION
* Separates navigation state from presentation
* Uses Observer Observable pattern with Change Notifier
* Extracts navigation state into MainPageViewModel
* Uses Provider to inject MainPageViewModel
* Enables widgets to observe and react to state changes
* Simplifies implementation of complex behaviors
* Improves future maintenance and scalability
```
