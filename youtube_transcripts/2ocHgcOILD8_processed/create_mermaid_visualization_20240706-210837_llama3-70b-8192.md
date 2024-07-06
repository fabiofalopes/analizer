Here is the Mermaid syntax visualization of the concept:
```mermaid
graph LR
    A[User Interface] -->|calls|> B[Repository]
    B -->|returns Future|> C[Future Builder]
    C -->|Connection State: Waiting|> D[Circular Progress Indicator]
    C -->|Connection State: Done|> E[Build Character]
    C -->|Connection State: Error|> F[Error Message]
    E -->|uses SnapShot data|> G[Character Details]
    F -->|uses SnapShot error|> H[Error Details]
    B -->|throws Exception|> F
    A -->|uses Future Builder|> C
    classDef waiting fill:#f9f,stroke:#333,stroke-width:2px;
    classDef done fill:#0f0,stroke:#333,stroke-width:2px;
    classDef error fill:#f00,stroke:#333,stroke-width:2px;
    class A,B,C,D,E,F,G,H waiting;
```
**VISUAL EXPLANATION**

* The user interface calls the repository to fetch data.
* The repository returns a Future, which is handled by the Future Builder.
* The Future Builder checks the Connection State of the Future.
* If the Connection State is Waiting, it displays a Circular Progress Indicator.
* If the Connection State is Done, it builds the Character Details using the SnapShot data.
* If the Connection State is Error, it displays an Error Message using the SnapShot error.
* The Repository may throw an Exception, which is caught by the Error Message.
* The User Interface uses the Future Builder to handle the Future returned by the Repository.
