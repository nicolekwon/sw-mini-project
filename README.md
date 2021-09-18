# sw-mini-project

> This ReadMe details Yanni Pang and Nicole Kwon's SW Mini Project for EC463. 

---


## Table of Contents


- [Description of Mini-Project](#description)
- [Journal of Agile Development](#journal)
- [Explanation of Code](#explanation) 
- [Screenshots/Videos of Project](#screenshots-and-videos) 

---

## Description

This is a shopping list app designed for shoppers who frequently forget what they need to purchase at the store. The shopping list is protected behind Firebase's Google authentication, while the list's contents are fetched from the FDA API and synced/stored to Google's Firestore via Firebase. A user can use the implemented barcode scanner or search bar to look up their food, and there are interactive buttons and REST APIs that allow for the user to add or remove certain items from their list. 

---

## Journal

Written below is an outline of the project's different sprints. Each item was updated and checked off after it was finished. For more information about bugs and tasks, please refer to the Github Issues. 

#### Sprint Outline

Sprint 1: 9/2/21-9/5/21
- [x] Setting up the Flutter environment (Android Studio as IDE and Dart as coding language)
- [x] Watching and going through [Part 1](https://flutter.dev/docs/get-started/codelab) and [Part 2](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#0) of tutorials in Flutter documentation

Sprint 2: 9/6/21-9/7/21
- [x] Initializing collaborative Github repository
- [x] Creating new Flutter application
- [x] Creating new Firebase project
- [x] Connecting Flutter and Firebase
- [x] Deciding and dividing up rest of issues

Sprint 3: 9/8/21-9/12/21
- [x] Implementing Gmail authentication
- [x] Implementing barcode scanner 
- [x] Implement basic search bar to print out "searched" terms
- [x] Perform search by using API
- [x] Parse search results
- [x] Setting up different pages (log-in page, homepage, page to add or delete foods added to the shopping list) 
- [x] Add page to show details and nutrition of the food 
- [x] Setting up navigation bar (to browse pages with different functionalities)
- [x] Connecting components together

Sprint 4: 9/13/21-9/17/21
- [x] Calling Firebase for storing and adding foods that were added by the user
- [x] Continuing to connect components
- [x] Fixing bugs
- [x] Cleaning up and finalizing code

#### Division of Work

Yanni:
- Search bar
- Model of parsed JSON file
- Firebase for Gmail authentication 

Nicole: 
- Barcode scanner 
- GET and POST REST APIs for Firebase's Firestore database

Both: 
- Format and implementation of shopping list
- Call to FDA API
- Route to different pages
- Clean UI and coding practices


---

## Explanation

We took the road less traveled and decided to learn Flutter. The code in folder "lib" is refactored into...

1. models -> results.dart: This dart file contains the classes of the different JSON files (i.e. search results and from the FDA API) 
2. main.dart: This dart file contains all of the app's code, including its widgets and helper methods. Due to the time constraint of this project, we were not able to clean and refactor this file further, but this coding practice is incredible important, and the existing code structure should be changed for the future.

### Main Code Breakdown (from top to bottom)

- Initializing Google sign-in authentication, Firebase API, and helper methods
- Implementing shopping list widget, along with its formatting and parsing of information
- Implementing barcode scanning method 
- Creating home page state
- Initializing sign-in method
- Implementing searching method 
- Initializing sign-out method
- Showing results of search bar and barcode scanning states 

### Design Decisions

When deciding the framework of our application, we decided to go with Flutter due to its user friendliness and cleanliness. Flutter is cross-platform and has a similar performance to React Native but has an even better repository of built-in, flexible, and open-source UI components and APIs. As first-time coders of mobile applications and due to the scope of this project, we valued all of these qualities within a framework. We decided to pair Flutter and its coding language Dart with Android Studio because of the IDE's ability to emulate different Android and iOS devices, which was extremely convenient during the entire design process, as testing was constantly happening throughout our sprints. Additionally, Github is already integrated with Android Studio, and we were able to easily clone, commit and push, and fetch from this repository with a simple click rather than worrying about Git commands. 

We then brainstormed the functionalities of our application. With the open-endedness behind the project, we went ahead with something that we believed was more applicable to our own lives as college students: shopping lists. As seniors who live in apartments and are adjusting to the adult life, we need to stay organized about what to buy during a trip to the grocery store. Handwriting and bringing a list can be a pain, and although there are existing ways to digitally write items that you need (ex. Notes app on iPhones), there is not any information about what you're jotting down unless if you search it up and write it yourself. Therefore, through our use of REST APIs, our application provides the convenience in the form of a mobile application and the merits of having additional information about what you are shopping for. 

In terms of our wireframe, we wanted to make sure that our UI was understandable and accessible for everyone. We therefore limited the amount of interactions within the app so that the user can quickly utilize the main functionality of our app: the shopping list. The application opens up with the option to log in with a Gmail account for authentication, followed by the homepage. There is a search bar, camera icon, and search icon in the upper middle of the screen, which is inspired by Google Images's sleek and intuitive search bar. Above this, there is your name to provide a sanity check of whether you are using the right account and the option to log out. Finally, there is the navigation bar on the upper right corner of the screen to look at the shopping list. After searching or scanning, there is a results page that allows you to pick and choose what you want to add into the shopping list, and you can also go back to the home page to continue finding more items or go straight to the shopping list with the navigation bar. 

To automate testing of building and compile our Flutter app, we decided to use Github Actions. The Flutter action we used allowed us to automatically build an Android apk and iOS app when commits are pushed to Github. This allows us to be confident that our app will be able to be deployed or rolled back to a working version. The action runs on mac-os because iOS apps can only be build on macOS. The flutter action we used also downloads all the plugins specified in pubspec which will alert us if there is an incompatability or error. 

---

## Screenshots and Videos

<p float="left">
<img src="../master/images/1.png" width="250">
<img src="../master/images/2.png" width="250">
<img src="../master/images/3.png" width="250">
<img src="../master/images/4.png" width="250">
<img src="../master/images/5.png" width="250">
<img src="../master/images/6.png" width="250">
<img src="../master/images/7.png" width="250">
<img src="../master/images/8.png" width="250">
<img src="../master/images/9.png" width="250">
<img src="../master/images/10.png" width="250">
<img src="../master/images/11.png" width="250">
<img src="../master/images/12.png" width="250">
</p>

[Back to the Top](#sw-mini-project)
