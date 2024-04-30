local function reset_board()
  local board = {}
  for i = 1, 3, 1 do
    local row = {}
    for j = 1, 3, 1 do
      row[j] = ' '
    end
    board[i] = row
  end
  return board
end

local function display_board(board)
  print()
  for i = 1, 3, 1 do
    for j = 1, 3, 1 do
      io.write(' ')
      io.write(board[i][j])
      if j ~= 3 then
        io.write(' |')
      else
        io.write('\n')
      end
    end
    if (i ~= 3) then
      io.write('---+---+---\n')
    end
  end
  print()
end

local function check_winner(board)
  local winner = ' '
  -- Horizontal lines
  for i = 1, 3 do
    if board[i][1] ~= ' ' and board[i][1] == board[i][2] and board[i][1] == board[i][3] then
      return board[i][1]
    end
  end

  -- Vertical lines
  for i = 1, 3 do
    if board[1][i] ~= ' ' and board[1][i] == board[2][i] and board[1][i] == board[3][i] then
      return board[1][i]
    end
  end

  -- Diagonals
  if board[1][1] ~= ' ' and board[1][1] == board[2][2] and board[1][1] == board[3][3] then
    return board[1][1]
  end
  if board[1][3] ~= ' ' and board[1][3] == board[2][2] and board[1][3] == board[3][1] then
    return board[1][3]
  end

  if winner == ' ' then
    return nil
  end
end

local function moves_left(board)
  for i = 1, 3, 1 do
    for j = 1, 3, 1 do
      if board[i][j] == ' ' then
        return true
      end
    end
  end
  return false
end

local function valid_move(board, row, col)
  if row > 3 or row < 1 or col > 3 or row < 1 then
    return false
  end

  if board[row][col] ~= ' ' then
    return false
  end

  return true
end

function run()
  local board          = reset_board()
  local current_player = 'X'
  local turn           = 0
  local winner         = nil
  local board_full     = false
  local finished       = false
  while finished == false do
    os.execute('clear')
    display_board(board)
    print('Your move ' .. current_player)
    io.write('Select a row: ')
    local row = io.read('*n')
    io.write('Select a column: ')
    local col = io.read("*n")

    if valid_move(board, row, col) then
      board[row][col] = current_player
    else
      print('Invalid move ' .. row .. ',' .. col .. ' is invalid. Try again')
      turn = turn - 1
    end
    winner = check_winner(board)
    if winner ~= nil then
      finished = true
    end

    board_full = not moves_left(board)
    if board_full == true then
      finished = true
    end

    turn = turn + 1

    if turn % 2 == 0 then
      current_player = 'X'
    else
      current_player = 'O'
    end
  end

  display_board(board)
  if winner ~= nil then
    -- There was a winner
    print('Contratulations ' .. winner .. ', you won!')
  else
    -- It was a tie
    print('It was a tie!')
  end
end

return {
  reset_board = reset_board,
  valid_move = valid_move,
  moves_left = moves_left,
  check_winner = check_winner,
  run = run
}
