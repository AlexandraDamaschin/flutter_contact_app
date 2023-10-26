# Contact app

A new Flutter project which displays a list of contacts ordered alphabetically. 
The list can be searched by the user to find quickly the contact he needs. 

## About the project
This project it's implemented using the BLoC design pattern where we listen to streams of events in order to map the business logic. 

Repositories are used to encapsulate the data access logic as a single source of truth. In our case the data it's a local list of contacts input in the local_data/sample_input.dart file. 

In order to register the repositories and blocs, we are using the get_it library. In repository/service_locator.dart we are registering all our repositories and blocs in order to use them later. 

## Libraries used
get_it - for accessing blocs/repositories

avatars - for adding a nice avatar for each user

grouped_list - for displaying grouped sections of contacts

## Notes
Scroll to index API isn't as straightforward with ListView/Slivers because each widget may contain different items.

Some alternatives to this would be to use a library as scrollable_positioned_list which would help you to acquire the same behavior or to simply use a widget as SingleChilScrollView which it's a box in which only one widget can be scrolled. 

## How to run the project
After you clone this project you can simply run the project by opening it from an IDE (Visual Studio Code, Android Studio, or others) and from the terminal run: 

``` flutter run```
