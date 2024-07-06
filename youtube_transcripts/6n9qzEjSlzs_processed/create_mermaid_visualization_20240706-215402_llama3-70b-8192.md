Here is the Mermaid syntax visualization of the Observer-Observable pattern:
```mermaid
graph LR
    classDef blackWhite fill:#000,stroke:#fff
    classDef observer fill:#fff,stroke:#000
    classDef observable fill:#fff,stroke:#000

    observable[Observable<br>(Change Notifier)]
    observer[Observer<br>(Consumer)]

    observable -->|register|> observer
    observable -->|notify|> observer

    subgraph Controlador AC
        controladorAC[Controlador AC<br>(Observable)]
        temperatura[Temperatura]
        controladorAC --> temperatura
    end

    subgraph Controlador AC Page
        controladorACPage[Controlador AC Page<br>(Observer)]
        build[Build]
        controladorACPage --> build
    end

    controladorAC -->|notify|> controladorACPage
    controladorACPage -->|watch|> controladorAC

    subgraph Test
        test[Test]
        test -->|register|> controladorAC
        test -->|expect|> temperatura
    end

    controladorAC -->|notify|> test
```
VISUAL EXPLANATION:
* The Observer-Observable pattern is visualized with an Observable (Change Notifier) and an Observer (Consumer).
* The Observable registers the Observer and notifies it when the state changes.
* The Controlador AC is the Observable, and the Controlador AC Page is the Observer.
* The Controlador AC has a temperatura variable that is observed by the Controlador AC Page.
* The Controlador AC Page watches the Controlador AC and rebuilds when the state changes.
* The Test registers as an Observer and expects the temperatura to change when the Controlador AC is notified.
