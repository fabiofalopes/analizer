Here is the Mermaid syntax visualization of the concept:
```
graph LR
    classDef mainPage fill:#f9f,stroke:#333,stroke-width:4px;
    classDef page fill:#f0f,stroke:#333,stroke-width:2px;
    classDef navigationBar fill:#ccc,stroke:#333,stroke-width:2px;

    MainPage[Main Page]:::mainPage
    Page1[Page 1]:::page
    Page2[Page 2]:::page
    NavigationBar[Bottom Navigation Bar]:::navigationBar

    MainPage --> NavigationBar
    NavigationBar --> Page1
    NavigationBar --> Page2

    Page1 -->|has|> AppBar[App Bar]
    Page2 -->|has|> AppBar

    AppBar -->|has|> Title[Title]
    AppBar -->|has|> Icon[Icon]

    NavigationBar -->|has|> Destination1[Destination 1]
    NavigationBar -->|has|> Destination2[Destination 2]

    Destination1 -->|represents|> Page1
    Destination2 -->|represents|> Page2

    class MainPage, Page1, Page2, NavigationBar, AppBar, Title, Icon, Destination1, Destination2
    VISUAL EXPLANATION
    * Main Page manages Navigation Bar
    * Navigation Bar has multiple destinations
    * Each destination represents a Page
    * Page has an App Bar with Title and Icon
    * Navigation Bar updates selected index on destination change
    * Selected index updates the displayed Page
```
This visualization shows the relationships between the Main Page, Navigation Bar, Pages, App Bar, and Destinations. It highlights how the Navigation Bar manages multiple destinations, each representing a Page, and how the selected index updates the displayed Page.
