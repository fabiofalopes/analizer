# EXPLANATION:

The provided text outlines the requirements and guidelines for a mobile application project focused on parking management, developed using Flutter. The project is divided into two main parts, with specific objectives, restrictions, and evaluation criteria for each part.

### Project Overview:
- **Objective**: Develop a multi-platform mobile application (Android and iOS) that helps users find available parking spots managed by EMEL (a parking management company).
- **Structure**: The project consists of two parts:
  - **Part 1**: Focuses on the graphical interface and navigation.
  - **Part 2**: Involves connecting the application to the EMEL API, implementing data persistence, and utilizing geolocation features.

### Key Requirements:
- **Technical Restrictions**: 
  - Use of dependency injection via the Provider library.
  - If local data persistence is implemented, the Sqflite library must be used.
- **Creativity**: Students are encouraged to enhance the dashboard and ensure that the data used is available through the EMEL API.
- **Video Submission**: A video demonstrating the application's functionality must be submitted along with the project.

### Evaluation Criteria:
- Projects will be evaluated based on compliance with requirements, design and usability, and implementation quality. Specific points are allocated for various features such as architecture, dashboard presentation, and incident registration.

### Additional Notes:
- Students must work in groups of two, with strict rules against changing groups or forming new ones.
- There are penalties for late submissions and failure to meet specific requirements.

### Code Explanation:
The code snippets provided include:
1. **main.dart**: This is the entry point of the Flutter application. It initializes the app, loads environment variables, and sets up routing for different screens (like login and home).
2. **Consts/colors.dart**: This file defines color constants used throughout the app for consistent theming.
3. **Views/find_parking_spot.dart**: This widget fetches and displays nearby parking lots based on the user's current location using geolocation services.
4. **Views/parking_lot_table_view.dart**: This widget manages a table view of parking lots, allowing sorting and filtering based on user input.

Overall, the project aims to create a functional and user-friendly application that leverages modern mobile development practices while adhering to specific educational guidelines.

---

