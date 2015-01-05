
##Battle Ships

###Ships
Responsibility	|  Collaborators | Status
----------------|----------------|--------
take_hit        | Player, Board  | Done
sunk?           | -              | Done
length          | -              | Done
Coordinates     | -              | Done


###Players
Responsibility	|  Collaborators | Status
----------------|----------------|--------
play          	| Ships, Board   | 

         		    


###Board
Responsibility	|  Collaborators | Status
----------------|----------------|---------
create_board    | -              | Done
Handle Shot     | Player, Ships  | Done
add_ship        | Ships          | Done
ship_list       | Ships          | Done


###Game
Responsibility  |  Collaborators | Status
----------------|----------------|--------
Start Game      |                |
Stop Game       |                |
Handles Gameplay|                |
<!-- 
TODO:
1. Add unit tests for hit & miss, and all the rest.  Add unit tests, many many unit tests 
Idea: add a meth to give you what's at x,y (cheater!)
2. Refactor: replace hit_list & ..lists to hash -->
<!-- HASH for coords a[x] = 1, a[y] = 2 -->
 <!-- center & color board -->