# Work Log

## Jaco Xia

### 5/22/24

Classwork: Created files for the classes in processing. Added some methods
but have not implemented them yet. Still need to add the rest of the
methods before starting work. Homework: implemented the Street class.

### 5/23/24

Classwork+Homework: Started working on constructing/initializing
the board array (using 40 spaces like a real monopoly board, but
putting empty spaces things like chance cards that we decided to
cut out for now). Successfully created all the streets and created
the array. Next steps are to make sure that the graphics logic will work accordingly.

## 5/24/24 
Classwork: N/A; out for AP

### 5/26/24
Homework: Implemented drawPlayer() and started run()/draw(). Might need to reconsider the main game loop. Players start with different colors.

### 5/28/24
Classwork: Started implementing the landedSpace graphics/prompt that would ask the player whether or not they want to buy/sell/upgrade their property. Need to code in buttons.
Homework: Added Tax buyscreen and added additional information on the monopoly cards. Also added code to rotate players after their round has ended.

## 5/29/24
Classwork: Started working on changing some fields (to arraylists). Worked on centering text.
Homework: Centered text (created a method that would create a prompt card). Colored the board and added color borders to respective property. Added sell and upgrade options and tested. (still need to add jail and bankruptcy code). I also fixed the weird issue where the last movement would be really quick. Also shifted placement of text inside each of the spaces to better fit the space.

## 5/30/24
Classwork: Started working on keeping track of players owned properties (specific to the player) and making sure properties are removed based off player decision.
Homework: Added bankruptcy protocol; if player balance is < 0, the player will have to sell their properties. Adjusted code to make sure that if a player goes broke, they'll immediately be prompted to sell property (in any situation). Issue: right now, players can select from 0 - 9 (because there are 0 - 9 digits). If a player has more than 10 properties, to sell the 11th property, how should we index it?

## 5/31/24
Classwork: Started looping through pages (for owned property and selling). Still need to update loop for displaying and selecting the right property on each page.
Homework: Finished implementing code that loops through property (pages) -- this is for when players have more than 10 properties and it can't fit on screen (this is something we should show for MVP). Fixed weird merged code (for some reason code got lost in one of the sections I was working on; i fixed it though). Added more showcase methods (for MVP).

## 6/3/24
Classwork: Reviewed prototype document and made sure it was updated 
Homework: Continued adding prototype revisions; also added speedIncrease testing method. Thinking about how to add utilities

## 6/5/24
Classwork: Began utilities class (started on the class itself)
Homework: Finished implementation of utilities inside the game (but needs more thorough checking). Added stuff like displaying ownership on the board, buying utilities, selling utilities (both when you land on a space and when you are going to be bankrupt). Also modified some of the testing methods so they may not work as intended now--but I am keeping it as it is because those changes would be useful to debug utilities if there are issues. 

## 6/7/24
Classwork: Began fixing early input as well as weird screen skipping (if you, lets say, hold down the 'y' key).
Homework: Finished modifying input methods (keyPressed() and keyReleased() in main Game class).

## Ray Xu

### 5/22/24
Classwork: N/A; absent for AP.
Homework: Updated various instance variables and methods within Property and Game classes

### date 5/23/24
Classwork: Began working on pricing for board spaces in Game class within setup()
Homework: Updated various instance variables and methods within Property and Street classes,
          added Player class instance variables, constructor, methods based on prototype document. 
          Updated UML diagram on prototype document to reflect any other changes/additions.

### 5/24/24
Classwork: Created subclass for tax spaces, updated Game space list to reflect changs. Also changed UML diagram.
Updated street space constructors to utilize array values in case prices want to be changed more efficiently.

### 5/26/24
Homework: Added board spaces to draw/setup, added text to board spaces. Can now visualize the board.

### 5/28/24
Classwork: Updated baord size to fit on lab computers, updated visuals
	   to reflect changes, updated player locations to prevent overlap/allow
	   for multiple players to be viewed on one space at a given time.
Homework: Added basic buyScreen functionality with key press recognition.

### 5/29/24
Classwork: Updated board visual to include more information about players, began moving code out of main 'Game' class to a separate class 'Board.'
Homework: Further updated board visual to include dice roll, completed moving code out of 'Game' and into 'Board,' finished start screen with player count functionality.

### 5/30/24
Classwork: Added shortcuts to simulate key elements of game (bankruptcy, random teleport, disruption (i.e. buy, sell, upgrade Mediterranean Avenue)).
Homework: Added jail space functionality and visual card, worked on logic for player to either bail out through monetary means or dice rolling.

### 5/31/24
Classwork: Continued working on logic for jail space, successfully implemented card that does not disappear but logic is flawed in that it may skip certain players who are/(not) in jail.
Homework: Finished jail logic, encountered problem where jail would lead to game skipping certain players' turns but was resolved by adjusting buyScreen variable. 

### 6/1/24
Homework: Further tested jail logic if both players in jail. Updated minor text features. Updated bankruptcy logic.

### 6/3/24
Classwork: Began adding new subclass of BoardSpace: Community Chests (abbrev. Chest), which randomly pays/deducts money to/from players' balances.
Homework: Finished adding community chest spaces to game, added functionality, tested.

### 6/5/24
Classwork: Began adding advance to go chest card, tested with different methods to check that the card works as intended.

### 6/6/24
Homework: Updated chest cards (go to go, opera night).

### 6/7/24
Classwork: Finished implementing all chest cards wanted in-game (except get out of jail free).

### 6/8/24
Homework: Added Chance card spaces, tested and verified their functionality. 