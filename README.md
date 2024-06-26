[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project

## Group Info

**THE MONOPOLY ELEPHANTS**:   
Jaco Xia & Ray Xu   
PD 4   

## Overview

Monopoly is a popular board game in which players aim to become wealthy by buying, trading, and developing properties (if applicable, with houses and hotels). The game starts with each player rolling dice to move around the board, able to purchase available properties they land on, or obligated to pay rent if on other players’ owned properties. The objective is to bankrupt other players (i.e. when they have no money in the bank), making one player the monopolist.

## Instructions

1. The game starts with asking how many players will be playing (2-4). Press key on keyboard corresponding to a number in that range.
2. The game then begins automatically. Note that the players' balances are always displayed in the upper left corner, and the current dice roll is displayed on the lower left corner.
3. If a player lands on an empty space, nothing will happen and the next player will automatically go.
4. When a player lands on a non-empty space, they will be prompted the landed space's associated action. The player must input corresponding keyboard inputs (such as 'y' or 'n' which correspond with yes or no). Instructions 5-9 illustrate some of the actions that a player might encounter. 
5. If a player lands on jail, they will be jailed for 3 rounds unless they bail out through monetary ($50) means or luck (rolling a 4 is equivalent to chances of rolling a double).
6. If a player lands on a property or utility, they are able to purchase or skip. If a player does not have enough money, they will not be able to purchase the space.
7. If a player lands on an owned utility, the player will pay whatever they roll multiplied by 4 or multiplied by 10. If the owner of the utility has both utilities, the active player will pay 10 times whatever they roll, otherwise, if the owner only has one, the player will pay 4 times whatever they roll.  
8. If a player lands on a Chance or Chest space, they will be prompted with a random instruction. This can involve monetary compensation and/or movement around the board.
9. If a player runs out of cash, they will be prompted to sell owned property (note that players can sell houses, hotels, and Streets separately). If such selling does not bring the player's balance back to net positive, the player is bankrupt and out of the game.
10. When a player passes or lands on 'Go,' they receive monetary compensation ($200).
11. When there is only one player remaining, the player wins and the game ends.

## Shortcuts

*Note, you must start the game with 2-4 players to use majority of these shortcuts.

'z' to deduct all players' balances by $200  
't' to teleport all players to a random space on the board  
'd' to disrupt regular gameplay flow: shows sell/upgrade functionality for space Med(iterranean) Ave for a single player  
'j' to disrupt regular gameplay flow: puts ALL players in jail INDEFINITELY (to showcase the jail prompts quicker)   
'q' to disrupt regular gameplay flow: shows functionality for jail sequence for ONE player  
'w' to see cycling through properties, selling property, and bankruptcy  
'e' to disrupt regular gameplay flow: shows functionality for tax and bankruptcy  
'r' to RESET BOARD  
'+' to increase game speed  
'[' to TP active player to utility 1  (note, if a player owns both utilities, other players will have to pay 10x whatever they roll)    
']' to TP active player to utility 2  (note, if a player owns both utilities, other players will have to pay 10x whatever they roll)    
';' to TP active player to chance card     
':' to TP active player to community chest card     

## Bugs

After thorough testing, no outstanding bugs were discovered. HOWEVER, if disruptions/shortcuts are spammed, it's likely that the game may overload.  
IF the game is overloaded, utilise the 'r' shortcut to reset the game. This should reset all disruptions and restart the game.  
If 'r' does not work, the game may have to be reconfigured manually via the terminal or Processing.  

## Documents
**VIDEO:** https://drive.google.com/file/d/11U3IAbQwAKN7CFTutAbGogd8_w-ngD5S/view?usp=sharing   
**PROTOTYPE DOCUMENT**: https://docs.google.com/document/d/1XoQ_iM9c6MeDP4B-3HUv67_R85Tj_C4fzxe5mEb3M1Y/edit?usp=sharing   
