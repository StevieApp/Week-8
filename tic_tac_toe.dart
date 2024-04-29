import 'dart:io';

class TicTacToe {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ' '));
  String currentPlayer = 'X';

  TicTacToe() {
    board = List.generate(3, (_) => List.filled(3, ' '));
    currentPlayer = 'X';
  }

  void printBoard() {
    for (int i = 0; i < 3; i++) {
      print(board[i]);
    }
  }

  bool placeMark(int row, int col) {
    if (row < 0 || row >= 3 || col < 0 || col >= 3) {
      return false;
    }

    if (board[row][col] != ' ') {
      return false;
    }

    board[row][col] = currentPlayer;
    return true;
  }

  bool checkForWin() {
    // Check horizontal lines
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == currentPlayer &&
          board[i][1] == currentPlayer &&
          board[i][2] == currentPlayer) {
        return true;
      }
    }

    // Check vertical lines
    for (int i = 0; i < 3; i++) {
      if (board[0][i] == currentPlayer &&
          board[1][i] == currentPlayer &&
          board[2][i] == currentPlayer) {
        return true;
      }
    }

    // Check diagonals
    if (board[0][0] == currentPlayer &&
        board[1][1] == currentPlayer &&
        board[2][2] == currentPlayer) {
      return true;
    }

    if (board[0][2] == currentPlayer &&
        board[1][1] == currentPlayer &&
        board[2][0] == currentPlayer) {
      return true;
    }

    return false;
  }

  void changePlayer() {
    if (currentPlayer == 'X') {
      currentPlayer = 'O';
    } else {
      currentPlayer = 'X';
    }
  }

  void startGame() {
    for (int turn = 0; turn < 9; turn++) {
      printBoard();
      print('Player $currentPlayer, enter your move as row col:');
      var input = stdin.readLineSync()!;
      var parts = input.split(' ');
      int row = int.parse(parts[0]);
      int col = int.parse(parts[1]);
      if (placeMark(row, col)) {
        if (checkForWin()) {
          print('Amazing Game For You, Player $currentPlayer!');
          return;
        }
        changePlayer();
      } else {
        print("Invalid move. Please try again.");
        turn--;
      }
    }
    print("Sorry. We'll get them next time.");
  }
}

void main() {
  TicTacToe game = TicTacToe();
  game.startGame();
}
