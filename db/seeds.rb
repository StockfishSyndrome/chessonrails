# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{email: '1@email.com',password: 123456789,password_confirmation:123456789},{email: '2@email.com',password: 123456789,password_confirmation:123456789}])
Game.create([name: 'My Game',player_white_id: 1, player_black_id: 2])
Piece.create([{rank: "pawn", row_pos: 6, col_pos: 0, game_id: 1, user_id: 1},
  {rank: "pawn", row_pos: 6, col_pos: 1, game_id: 1, user_id: 1},
  {rank: "pawn", row_pos: 6, col_pos: 2, game_id: 1, user_id: 1},
  {rank: "pawn", row_pos: 6, col_pos: 3, game_id: 1, user_id: 1},
  {rank: "pawn", row_pos: 6, col_pos: 4, game_id: 1, user_id: 1},
  {rank: "pawn", row_pos: 6, col_pos: 5, game_id: 1, user_id: 1},
  {rank: "pawn", row_pos: 6, col_pos: 6, game_id: 1, user_id: 1},
  {rank: "pawn", row_pos: 6, col_pos: 7, game_id: 1, user_id: 1},
  {rank: "rook", row_pos: 7, col_pos: 0, game_id: 1, user_id: 1},
  {rank: "knight", row_pos: 7, col_pos: 1, game_id: 1, user_id: 1},
  {rank: "bishop", row_pos: 7, col_pos: 2, game_id: 1, user_id: 1},
  {rank: "queen", row_pos: 7, col_pos: 3, game_id: 1, user_id: 1},
  {rank: "king", row_pos: 7, col_pos: 4, game_id: 1, user_id: 1},
  {rank: "bishop", row_pos: 7, col_pos: 5, game_id: 1, user_id: 1},
  {rank: "knight", row_pos: 7, col_pos: 6, game_id: 1, user_id: 1},
  {rank: "rook", row_pos: 7, col_pos: 8, game_id: 1, user_id: 1},
  ])