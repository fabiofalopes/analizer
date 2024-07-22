# REQUIREMENTS

- The app must function on at least API 29 (minSdkVersion cannot be greater than 29).
- The app must display markers on the map for both EMEL parking lots and GIRA bike stations.
- There must be an option to display only EMEL parking lot markers or only GIRA bike station markers.
- When a GIRA bike station marker is clicked, a new screen must be displayed with the following information:
  - Number of docks (num_docas)
  - Number of bicycles (num_bicicletas)
  - Address (desig_comercial)
  - Last update (update_date)
  - List of incidents for the GIRA station
- It must be possible to report incidents for a GIRA station, filling in the following mandatory data:
  - GIRA station
  - Description, minimum 20 characters
  - Problem type:
    - Vandalized bicycle
    - Dock did not release bicycle
    - Other situation (this category should be used for problems that do not fit the previous two)

# TASKS

- Implement the map screen to display markers for both EMEL parking lots and GIRA bike stations
- Add functionality to toggle between displaying only EMEL parking lot markers or only GIRA bike station markers
- Implement the new screen that displays the details of a GIRA bike station when its marker is clicked
- Implement the functionality to report incidents for a GIRA station, including the required data fields

# CONTEXT

- The app must be developed using Flutter and Dart, targeting Android devices with a minimum SDK version of 29.
- The app should follow best practices for Flutter development, such as using the Provider or Bloc pattern for state management, and following the Material Design guidelines.
- The app should be optimized for performance and user experience, with smooth animations and responsive UI.
- The app should be thoroughly tested, both manually and with automated tests, to ensure it meets the requirements and functions correctly.
- The app should be deployed to the Google Play Store for distribution to users.


---

