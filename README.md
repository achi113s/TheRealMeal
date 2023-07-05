# TheRealMeal :yum:

TheRealMeal is my iOS Coding Challenge submission for the Fetch iOS Apprenticeship.

*Technologies Used*
- SwiftUI
- TheMealDB API
- Codable
- MVVM Pattern

## Description

The app fetches all categories of meals from TheMealDB and displays them with thumbnail images. There is a flag in CategoriesViewModel.swift called onlyShowDesserts that, when set to true, filters the categories to only show Desserts. I did this simply so the code is a bit more modular than hardcoding the URL for fetching the Desserts. If you want to see all categories, just set onlyShowDesserts to false.

When a user selects a category, they are shown an alphabetized list of meals, and when they select a meal, they are shown a detail view which includes: the meal name, instructions, ingredients/measurements, a picture, etc.

The MealsView is searchable, just swipe down to show the search bar. Results are filtered by meal name.

## Notes 

I did not find much documentation on which meal properties could be null, so I assumed that some of them will always have a value, such as the meal ID and name.

I wrote a couple of unit tests for some utility functions I made. These are in TheRealMealUtilityTests.swift.

You should just be able to download the repo and run it with Xcode.

## Future Additions

The app only works when the device is connected to the internet. It would be ideal to cache the data so that it is available offline and we can just update the cache whenever the device reconnects.

## Mockups

Mockup on an iPhone 13 Pro running iOS 15.0:

![Mockup](https://github.com/achi113s/TheRealMeal/blob/main/ReadmeResources/mockupRecording.gif)

Mockup Showing Searchable View:

![Searchable](https://github.com/achi113s/TheRealMeal/blob/main/ReadmeResources/searchable.gif)

