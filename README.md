Original App Design Project - README Template
===

# Werdle

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description

It is a game that generates a word where users will have to guess what the word is within 6 tries. After each attempt, a hint will be given based on the orientation and selection of letters they've used in the attempt. If they've guessed the word correctly within the given attempts, they will move up a rank. Users will have to create an account in order to save what their rank is.



### App Evaluation

- **Category:** Games
- **Mobile:** This app would be played on mobile, but could potentially be implemented as a web app.
- **Story:** Users will atempt to guess the word within six tries. If they succeed they will move up in rankings.
- **Market:** This app is intended for everyone of all ages.
- **Habit:** Users will decide how often they want to use the app and play the game.
- **Scope:** Our app will initially support singleplayer, could can be scaled up to become a multi-player application where users can compete with other users.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] * User can log in
- [X] * User can sign up for an account
-  <img src = "https://i.imgur.com/Eavt2vA.gif" width=200>
- [x] * User can view game page to play the game
- <img src = "https://i.imgur.com/YkuGwJq.png" width=200>
-

**Optional Nice-to-have Stories**

* User can view their rankings
* User can view leaderboard to see how they compare against other users
* 

### 2. Screen Archetypes

- [X]  Sign In/ Sign Up Page
   * User can sign up for an account
   * User can sign in
* Game Page
   * User can view game page to play the game
   * User can view their ranking



### 3. Navigation

**Tab Navigation** (Tab to Screen)

* rank screen
* back to game screen from the rank page

**Flow Navigation** (Screen to Screen)

* login/signup screen
   * game screen
* game screen
   * login/signup screen

   
      
      
      

## Wireframes
<img src="https://i.imgur.com/oWbzsx6.png" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype


## Schema 

### Models
[Add table of models]
**User**
| Property | Type | Description |
| -------- | -------- | -------- |
| username | String   | unique id for the user to login   |
| password | String   | a password created by the user to log into their game|
| rank |int  | Holds the highest rank that the user has reached in the game |

### Ranks
| Property | Type | Description |
| -------- | -------- | -------- |
| rankid | Int  | unique id for each rank |
| word | String  | The 5-letter word associated with the rank |

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

- Sign In/Sign Up Screen
    - (CREATE/POST) Sends username and password and adds it to the database to create a new user
    - (READ/GET) Sends username and password and checks to make sure that user account exists and that credentials are correct.

```
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text!
        user.password = passwordField.text!
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription).")
            }
        }
    }
```
    

````
@IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
````
- Game Screen
    - (Read/GET) Queries word for assocated rank based on user's rank

