# EXPLANATION:

The provided text outlines the requirements and guidelines for a mobile application project focused on parking management, specifically for a platform called EMEL. The project is divided into two main parts, with specific objectives, restrictions, and evaluation criteria for each part.

### Project Overview:
1. **Objective**: Develop a multi-platform mobile application (Android and iOS) using Flutter.
2. **Structure**: The project is split into two parts:
   - **Part 1**: Focuses on the graphical interface and navigation.
   - **Part 2**: Involves connecting the application to the EMEL API, data persistence, and geolocation features.

### Key Requirements:
- **Group Work**: Students must work in pairs, and changes in group composition are not allowed.
- **Technical Restrictions**: Use of specific libraries (e.g., Provider for dependency injection, Sqflite for local data persistence).
- **Creativity**: Students are encouraged to creatively design the dashboard and other screens.
- **Video Submission**: A video demonstrating the application's functionality is required.

### Evaluation Criteria:
- Projects will be evaluated based on compliance with requirements, design and usability, and implementation quality.
- Each part has a minimum passing grade, and failure to meet these can result in automatic disqualification from the practical evaluation.

### Additional Notes:
- The document also includes instructions for using GitHub for version control, submission deadlines, and penalties for late submissions or non-compliance with guidelines.

### Code Snippets:
The code snippets provided in the input include:
- **main.dart**: The entry point of the Flutter application, which initializes environment variables and sets up routing.
- **Consts/colors.dart**: Defines color constants used throughout the app.
- **Views/find_parking_spot.dart**: A widget that fetches and displays nearby parking lots using geolocation.
- **Views/parking_lot_table_view.dart**: A widget that displays parking lots in a table format with sorting and filtering capabilities.

These snippets illustrate how the application is structured and how it interacts with user location data to provide relevant parking information.

# SECURITY IMPLICATIONS:

The project involves handling user location data, which raises several security considerations:
1. **Location Permissions**: The application requests location permissions from users. If not handled properly, this could lead to unauthorized access to sensitive user data.
2. **Data Privacy**: User location data should be handled with care to ensure it is not exposed or misused. Implementing proper data encryption and secure storage practices is essential.
3. **API Security**: The application connects to an external API (EMEL). It is crucial to ensure that API keys are kept secure and not hard-coded in the application code. Using environment variables or secure vaults for sensitive information is recommended.
4. **Error Handling**: The application should gracefully handle errors related to location services and API calls to prevent exposing sensitive information through error messages.

Overall, developers must prioritize security best practices to protect user data and maintain trust in the application.

---

