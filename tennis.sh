#!/bin/bash
#Ye'ela Granot 209133107

print_scores() {
	echo " Player 1: ${sc1}         Player 2: ${sc2} "
}

print_board() {
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  
  case $Bt in
    -3)
      echo "O|       |       #       |       | "
      ;;
    -2)
      echo " |   O   |       #       |       | "
      ;;
    -1)
      echo " |       |   O   #       |       | "
      ;;
    0)
      echo " |       |       O       |       | "
      ;;
    1)
      echo " |       |       #   O   |       | "
      ;;
    2)
      echo " |       |       #       |   O   | "
      ;;
    3)
      echo " |       |       #       |       |O"
      ;;
  esac
  
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- "
}

print_draws() {
	  echo "PLAYER 1 PICK A NUMBER: "
	  read -s player_1_input
	  while [[ ! $player_1_input =~ ^[0-9]+$ || $player_1_input -lt 0 || $player_1_input -gt $sc1 ]];
	  do
		echo "NOT A VALID MOVE !"
		echo "PLAYER 1 PICK A NUMBER: "
		read -s player_1_input
	  done
	  
	  echo "PLAYER 2 PICK A NUMBER: "
	  read -s player_2_input
	  while [[ ! $player_2_input =~ ^[0-9]+$ || $player_2_input -lt 0 || $player_2_input -gt $sc2 ]];
	  do
		echo "NOT A VALID MOVE !"
		echo "PLAYER 2 PICK A NUMBER: "
		read -s player_2_input
	  done

  declare -g sc1=$((sc1 - player_1_input))
  declare -g sc2=$((sc2 - player_2_input))
  print_scores
  
if (( $player_1_input > $player_2_input )); then
  if [[ $Bt -eq 0 || $Bt -eq -1 || $Bt -eq -2 ]]; then
	declare -g Bt=1
  elif [[ $Bt -eq 1 ]]; then
	declare -g Bt=2
  elif [[ $Bt -eq 2 ]]; then
	declare -g Bt=3
  fi
elif (( $player_2_input > $player_1_input )); then
  if [[ $Bt -eq 0 || $Bt -eq 1 || $Bt -eq 2 ]]; then
	declare -g Bt=-1
  elif [[ $Bt -eq -1 ]]; then
	declare -g Bt=-2
  elif [[ $Bt -eq -2 ]]; then
	declare -g Bt=-3
  fi
fi
  
  print_board
  echo -e "       Player 1 played: ${player_1_input}\n       Player 2 played: ${player_2_input}\n\n"
}

declare -g sc1=50
declare -g sc2=50
declare -g Bt=0
print_scores
print_board

while true; 
do
  print_draws
  if [[ $Bt -eq 3 || $Bt -eq -3 || $sc1 -eq 0 || $sc2 -eq 0 ]];
  then
    break
  fi
done

if [[ $Bt -eq 3 ]]; then
	echo "PLAYER 1 WINS !"
elif [[ $Bt -eq -3 ]]; then
	echo "PLAYER 2 WINS !"
elif [[ $sc1 -eq 0 && $sc2 -ne 0 ]]; then
	echo "PLAYER 2 WINS !"
elif [[ $sc2 -eq 0 && $sc1 -ne 0 ]]; then
	echo "PLAYER 1 WINS !"
elif [[ $sc1 -eq 0 && $sc2 -eq 0 ]]; then
	if [[ $Bt -eq 0 ]]; then
		echo "IT'S A DRAW !"
	elif [[ $Bt -gt 0 ]]; then
		echo "PLAYER 1 WINS !"
	elif [[ $Bt -lt 0 ]]; then
		echo "PLAYER 2 WINS !"
	fi
fi

	





