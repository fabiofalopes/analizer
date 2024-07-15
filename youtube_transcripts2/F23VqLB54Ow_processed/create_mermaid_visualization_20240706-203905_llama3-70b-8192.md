Here is the Mermaid syntax visualization of the input:
```
graph LR
    classDef blackWhite fill:#000,stroke:#fff
    classDef blackWhite2 fill:#fff,stroke:#000

    subgraph Controlador
        direction LR
        classDef controlador fill:#fff,stroke:#000
        controlador[Controlador]
        temperatura[Temperatura]
        horaAtual[Hora Atual]
        outrosWidgets[Outros Widgets]
        controlador --> temperatura
        controlador --> horaAtual
        controlador --> outrosWidgets
    end

    subgraph HoraAtualWidget
        direction LR
        classDef horaAtualWidget fill:#fff,stroke:#000
        horaAtualWidget[Hora Atual Widget]
        timer[Timer]
        buildHoraAtual[Build Hora Atual]
        horaAtualWidget --> timer
        horaAtualWidget --> buildHoraAtual
    end

    subgraph Timer
        direction LR
        classDef timer fill:#fff,stroke:#000
        timer -->|every 1 second|> buildHoraAtual
    end

    subgraph BuildHoraAtual
        direction LR
        classDef buildHoraAtual fill:#fff,stroke:#000
        buildHoraAtual -->|update|> horaAtual
    end

    horaAtualWidget --> controlador
    horaAtual --> horaAtualWidget

    VISUAL EXPLANATION
    * Controlador has multiple widgets including Hora Atual Widget
    * Hora Atual Widget has its own state and refresh mechanism
    * Timer is used to update Hora Atual Widget every 1 second
    * Build Hora Atual is called every 1 second to update Hora Atual
    * Hora Atual Widget is isolated from other widgets
    * Controlador is not affected by Hora Atual Widget's refresh
```
