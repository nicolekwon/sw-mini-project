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

sndjanfjoanfjoa

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
- [x] Cleaning up and finalizing code


#### Division of Work

Yanni:
- Barcode scanner and search bar
- Route to different pages

Nicole: 
- Firebase (for Gmail authentication and database of recipes)
- Call to FDA API

Both: 
- Creation of recipe functionality
- Clean UI and coding practices


---

## Explanation

We took the road less traveled and decided to learn Flutter.

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
</p>

[Back to the Top](#sw-mini-project)
