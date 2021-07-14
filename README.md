Minesweeper
============

What to build
--------------
Develop the classic game of [Minesweeper](https://en.wikipedia.org/wiki/Minesweeper_(video_game))

The following is a list of items (prioritized from most important to least important) we wish to see:
* Design and implement  a documented RESTful API for the game (think of a mobile app for your API)
* When a cell with no adjacent mines is revealed, all adjacent squares will be revealed (and repeat)
* Ability to 'flag' a cell with a question mark or red flag
* Detect when game is over
* Persistence
* Ability to start a new game and preserve/resume the old ones
* Ability to select the game parameters: number of rows, columns, and mines
* Write specs (unit testing)

__________________________________________________________________________________________________________________

Decisions
------------

### First batch

* I started working on the base game
* The attributes of the game are:
    * rows
    * columns
    * mines
    * status (to check if the game is new, incomplete or completed)
    * board (which is going to hold the mines and data)
* I started with rspec and TDD, first the test, then the functionality
* The update and delete methods on games were not considered to not alter the games 
  on the game REST inteface, it will be modified on another interface 
  (such as moves or cells or something like that)