# TheRealMeal :yum:

TheRealMeal is my iOS Coding Challenge submission for the Fetch iOS Apprenticeship.

*Technologies Used*
- SwiftUI
- TheMealDB API
- MVVM Pattern

I mostly use UIKit, but I wanted more practice with SwiftUI so I wrote this in pure SwiftUI.

The app fetches all categories of meals from TheMealDB and displays them with thumbnail images. There is a flag in CategoriesViewModel.swift called onlyShowDesserts that, when set to true, filters the categories to only show Desserts. I did this simply so the code a bit more modular than hardcoding the URL for fetching the Dessert meals. If you want to see all categories, just set onlyShowDesserts to false.

When a user selects a category, they are shown an alphabetized list of meals, and when they select a meal, they are shown a detail view which includes: the meal name, instructions, ingredients/measurements, a picture, etc.

I did not find much documentation on which meal properties could be null, so I assumed that some of them will always have a value, such as the meal ID and name.

You should just be able to download the repo and run it with Xcode.

Mockup on an iPhone 13 Pro running iOS 15.0:



