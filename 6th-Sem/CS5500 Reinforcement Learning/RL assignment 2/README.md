# Tic Tac Toe Game
---
Tic Tac Toe in Python.

## Dependencies

* tkinter
* pickle
* numpy
* python 3

## Instructions to run

The Game has many different types of opponent agents. 

You can specify the type of opponent agent by using the following command.

```
python3 tictactoe.py [cmd]
```

where `cmd` can be `SafeAgent`, `RandomAgent`, `HumanAgent`, `QLearningAgent`.


## Answers To Questions:

(Q) Among the three agents developed, which agent is best ? Why ?

Ans: The Q-learning agent 3 performs better than other agents because it learns the characteristics of both random and safe agent.

(Q) Is the Q-learning agent developed unbeatable against any possible opponent ? If not,
suggest ways to improve the training process.

Ans: The agent can be sometimes defeated when we plan moves upto 3 levels deep. It can be improved by either increasing the no. of training games or by making the Q-learning agent play against itself.