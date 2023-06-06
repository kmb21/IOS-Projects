
# C-Tour

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app does what any tour guide can do but also has more to offer. It enables users to explore the a college campus either remotely or in person. It also connects incoming student of a given college. 

### App Evaluation
- **Category:** Education 
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer, such as tinder or other similar apps. Functionality wouldn't be limited to mobile devices, however mobile version could potentially have more features.
- **Story:** Enables users to explore college campuses either remotely or in person with the help of a virtual assistant. Users who visit the campus in person have the option to post photos and write comments about a specific place on the campus. 
- **Market:** Current and perspective students can use this app to navigate through a school's campus.
- **Habit:** This app could be used as often or unoften as the user wanted depending on the time of the year and what exactly they are interested in knowing about any college.
- **Scope:** At this time, we would like to focus on offering virtual tours of college campuses, but we would like to include other features in the future such as college application and financial aid guides. In additionm, we would also like to exapnd to other non-college locations which are heavily visitied by Tourists. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can login
* Users can search college campuses found in the US.
* Users can write comments and post pictures of their experience on campus.

**Optional Nice-to-have Stories**

* User can like a photo
* User can track admissions i.e. where other users applied to college and their decisions)


### 2. Screen Archetypes

* Login Screen
    * User can login
* Sign Up/Register Screen
   * User can create a new account
* Main  
    * User can view a lsit of popular colleges
* Location Screen 
    * User can add their current location 
* College Detail Screen 
    * User can view a list of top visited spots on campus in addition to more pictures 
    * User can see a feed of other user posts 
* Photo Detail Screen
    * User can view a descrption of a specifc place 
* Post Screen
   * User can post a new photo with comments on the detail screen feed
* Search Screen
    * User can search for a specific place on a college campus

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
> [name=Fanuel]This would be the screen where a user can see the top ten popular places on the campus.
* Location
> [name=Fanuel]This is where we will use mapkit that will enable users to add their current location.


> [name=Fanuel]If you have ideas for more tabs you can include it here. I think the tab navigation should kinda look like the navigation you see on instagram for home feed, search... 

**Flow Navigation** (Screen to Screen)

* Login Screen
   * Home
* Sign Up/Register Screen
   * Home
* Location Screen 
    * College Detail Screen
* Main
   * College Detail Screen
* College Detail Screen
   * Home
   * Photo Detail Screen
* Post Screen
   * Photo Detail Screen
* Search Screen
   * College Detail Screen


## Wireframes

<img src="YOUR_WIREFRAME_IMAGE_URL" width=600> ![](https://i.imgur.com/ZXRO1MW.jpg)


### Video Walkthrough

<!-- <width=100> ![ ](https://i.imgur.com/mlXscyZ.gif) -->

https://i.imgur.com/BSqBnDr.gif


https://github.com/FdD1223/C-Tour-Group--34/assets/110620678/e753c0e0-2a0f-431c-8a53-d2760997089e



### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
