# Tennis Game Bash Script

## Introduction
This Bash script implements a tennis game where two players compete to win points. The game provides an intuitive experience, visualizing the tennis court on the command line. 
Two players compete head-to-head, strategizing their moves to outwit their opponent and emerge victorious on the virtual court.

## How to Run
To run the tennis game script, follow these steps:
1. Clone the repository containing the script.
2. Navigate to the directory containing the script.
3. Ensure the script has execute permissions.
   ```
   chmod +x tennis_game.sh
   ```
4. Run the script.
   ```
   ./tennis_game.sh
   ```

## How to Play
+ The game starts with both players having a score of 50 each.
+ Each player, on their turn, must choose a number between 0 and the number of points they have.
+ Player input remains discrete and hidden from the opponent.
+ The player who chooses the highest number of points wins that round, and the ball gets closer to the loser's outer side of the board.
+ At the end of each turn, each player deducts the chosen number of points from their overall score, resulting in their updated score.
+ The game continues in this manner until it ends in one of the following situations:
   - The ball hits the outer side of the board for one of the players, resulting in their loss and the opponent's win.
   - One player runs out of points, leading to their opponent's victory.
   - Both players run out of points, and the player with the ball on their side of the board loses.
  
## Example of the Game
![image](https://github.com/yeela8g/Tennis-game/assets/118124478/6e7790de-52f7-4043-94eb-8a90cc38259f)

## Code Principles implemented
- **Modularization:** The script is divided into functions making the code reusability when functions can be called multiple times from different parts of the script, reducing redundancy and making maintenance simpler.
- **Error Handling:** The script handles invalid input by prompting users to re-enter their moves until valid input is received.

Enjoy!
