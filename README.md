Original App Design Project - README Template
===

# TravelGem

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Discover most popular traveling spots in cities.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Travel/Discovery/Fun
- **Mobile:** website is view only, mobile first experience, maps/location
- **Story:** Allows users to discover traveling spots.
- **Market:** Anyone interested in traveling/finding something new.
- **Habit:** Users can check out as many cities as they want. Users can explore endless city attractions.
- **Scope:** TravelGem will allow for looking up city attractions from a database and displaying information.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can search cities
* Users can view a list of traveling spots within the city
* User can click on each traveling spot to see details of it

**Optional Nice-to-have Stories**

* Involve GPS into the system
* Add pin to map for real time position

### 2. Screen Archetypes

* Search screen
   * users can search cities
   * ...
* List of traveling spots
   * Viewing list of traveling spots within city
   * ...
* City attraction details
    * Users click on specific spot for more information/photo
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* N/A

**Flow Navigation** (Screen to Screen)

* search screen
   * list of traveling spots within city
   * ...


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://cdn.discordapp.com/attachments/806354297788825641/809188812663423006/image0.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | uniqueid for travel spot|
   | image         | File     | image that user posts |
   | description       | String   | travel description |
   | cityName | String | name of City |
   | zipcode | String | City zipcode|
   | POI | Array | POI in City|
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
-  No network requests, we only use an existing API no Parse network requests
#### List of network requests by screen
  
- [OPTIONAL: List endpoints if using existing API such as Yelp]
##### Sygic Travel API 
- Base URL - [http://docs.sygictravelapi.com/1.2/](http://docs.sygictravelapi.com/1.2/)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /parent_place_id | Limit results to collections for location (such as London)
    `GET`    | /place_ids | Limit results to collections that contain given places. 
    `GET`    | /places/list  | This endpoint returns basic information about places. 
    `GET`    | /places| Bulk request place details based on their ids.

##### Open Trip Map API
- Base URL - [https://opentripmap.io/docs#/](https://opentripmap.io/docs#/)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /places/bbox | objects list
    `GET`    | /places/xid| Unique identifier of the object in OpenTripMap
    `GET`    | /places/name| The name of the object
    `GET`    | /places/rate| Rating of the object popularity
    `GET`    | /places/otm| Link to object at opentripmap.com
    `GET`    | /places/image| image URL
    
## User Stories

The following **required** functionality is completed:

- [x] User can search for a city. 
- [x] User can view list of POIs
- [ ] User can view detail and description of a POI.


The following **bonus** features are implemented:

- [ ] TBD
- [ ] TBD

## Video Walkthrough

Here's a walkthrough of implemented user stories:

Sprint 1:

<img src='http://g.recordit.co/wRVQ7uT1WT.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

Sprint 2:

<img src='http://g.recordit.co/9fxsMWiV42.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

