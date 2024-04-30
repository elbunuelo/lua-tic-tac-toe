local tic_tac_toe = require('tic-tac-toe')

describe('tic_tac_toe', function()
  describe('reset_board', function()
    it('returns an empty 3 by 3 board', function()
      local board = tic_tac_toe.reset_board()
      assert.are.equals(#board, 3)

      local row = board[1]
      assert.are.equals(#row, 3)

      for i = 1, 3 do
        for j = 1, 3 do
          assert.are.equals(board[i][j], ' ')
        end
      end
    end)
  end)

  describe('check_winner', function()
    it('Returns the right winner X, row 1', function()
      local board = {
        { 'X', 'X', 'X' },
        { 'O', ' ', 'O' },
        { ' ', ' ', ' ' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'X')
    end)
    it('Returns the right winner X, row 2', function()
      local board = {
        { 'O', ' ', 'O' },
        { 'X', 'X', 'X' },
        { ' ', ' ', ' ' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'X')
    end)

    it('Returns the right winner X, row 3', function()
      local board = {
        { 'O', ' ', 'O' },
        { ' ', ' ', ' ' },
        { 'X', 'X', 'X' },
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'X')
    end)

    it('Returns the right winner O, row 1', function()
      local board = {
        { 'O', 'O', 'O' },
        { ' ', 'X', ' ' },
        { ' ', 'X', 'X' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'O')
    end)
    it('Returns the right winner O, row 2', function()
      local board = {
        { 'X', ' ', ' ' },
        { 'O', 'O', 'O' },
        { ' ', 'X', 'X' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'O')
    end)

    it('Returns the right winner O, row 3', function()
      local board = {
        { 'X', 'X', ' ' },
        { ' ', 'X', ' ' },
        { 'O', 'O', 'O' },
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'O')
    end)

    it('Returns the right winner X, column 1', function()
      local board = {
        { 'X', 'O', ' ' },
        { 'X', 'O', ' ' },
        { 'X', ' ', ' ' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'X')
    end)

    it('Returns the right winner X, column 2', function()
      local board = {
        { ' ', 'X', ' ' },
        { 'O', 'X', 'O' },
        { ' ', 'X', ' ' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'X')
    end)

    it('Returns the right winner X, column 3', function()
      local board = {
        { ' ', ' ', 'X' },
        { 'O', ' ', 'X' },
        { ' ', 'O', 'X' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'X')
    end)

    it('Returns the right winner O, column 1', function()
      local board = {
        { 'O', 'X', 'X' },
        { 'O', 'X', ' ' },
        { 'O', ' ', ' ' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'O')
    end)

    it('Returns the right winner O, column 2', function()
      local board = {
        { ' ', 'O', ' ' },
        { 'X', 'O', 'X' },
        { ' ', 'O', 'X' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'O')
    end)

    it('Returns the right winner O, column 3', function()
      local board = {
        { ' ', ' ', 'O' },
        { 'X', 'X', 'O' },
        { ' ', 'X', 'O' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'O')
    end)

    it('Returns the right winner X, diagonal 1', function()
      local board = {
        { 'X', 'O', ' ' },
        { ' ', 'X', ' ' },
        { ' ', 'O', 'X' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'X')
    end)

    it('Returns the right winner X, diagonal 2', function()
      local board = {
        { ' ', ' ', 'X' },
        { ' ', 'X', 'O' },
        { 'X', ' ', 'O' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'X')
    end)

    it('Returns the right winner O, diagonal 1', function()
      local board = {
        { 'O', 'X', ' ' },
        { ' ', 'O', 'X' },
        { ' ', 'X', 'O' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'O')
    end)

    it('Returns the right winner O, diagonal 2', function()
      local board = {
        { 'X', ' ', 'O' },
        { ' ', 'O', 'X' },
        { 'O', ' ', 'X' }
      }

      local winner = tic_tac_toe.check_winner(board)
      assert.are.equals(winner, 'O')
    end)
  end)

  describe('valid_move', function()
    it('returns false if position is invalid', function()
      local board = {
        { ' ', ' ', ' ' },
        { ' ', ' ', ' ' },
        { ' ', ' ', ' ' }
      }
      assert.False(tic_tac_toe.valid_move(board, 0, 1))
      assert.False(tic_tac_toe.valid_move(board, 1, 0))
      assert.False(tic_tac_toe.valid_move(board, 4, 1))
      assert.False(tic_tac_toe.valid_move(board, 1, 4))
    end)

    it('returns false if the position is occupied', function()
      local board = {
        { 'X', ' ', ' ' },
        { ' ', ' ', ' ' },
        { ' ', ' ', ' ' }
      }
      assert.False(tic_tac_toe.valid_move(board, 1, 1))
    end)

    it('returns true if the position is available', function()
      local board = {
        { 'X', 'O', 'O' },
        { 'O', 'X', 'X' },
        { 'O', 'X', ' ' }
      }
      assert.True(tic_tac_toe.valid_move(board, 3, 3))
    end)
  end)

  describe('moves_left', function()
    it('returns true if there are positions available', function()
      local board = {
        { 'X', ' ', ' ' },
        { ' ', ' ', ' ' },
        { ' ', ' ', ' ' }
      }
      assert.True(tic_tac_toe.moves_left(board))
    end)

    it('returns false if the board is full', function()
      local board = {
        { 'X', 'O', 'O' },
        { 'O', 'X', 'X' },
        { 'O', 'X', 'O' }
      }
      assert.False(tic_tac_toe.moves_left(board))
    end)
  end)
end)
