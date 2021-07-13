# WeatherApp

## App Structure
The app mainly consists of 4 modules
- Common : To host classes and files common to all modules.
- Service : Service layer to execute network requests.
- WeatherList : MVVM stack for showing weather list for x number of days
- WeatherDetails : MVVM stack to load details of a forecast for a day.

## Architecture Used
Architecture used to build app is MVVM + clean architecture which are protocol driven. Each scene stack is combination of below layers:
- Data: To have implementation of datsaources and repository
- Domain: To have implementation of use cases
- Presentation: To have implementation for ViewModel and UI layer.

## Dependency Manager
Cocoapods with below dependency:
- SDWebImage

## Tests
The implementation is well covered with unit testing for the MVVM stacks.