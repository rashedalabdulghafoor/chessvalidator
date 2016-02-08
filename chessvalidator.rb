


chessboard = File.open("chessboard.txt","a")
evaluatingmoves = File.open("evaluatingmoves.txt","a")



bR bN bB bQ bK bB bN bR
bP bP bP bP bP bP bP bP
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
wP wP wP wP wP wP wP wP
wR wN wB wQ wK wB wN wR


a2 a3 	LEGAL   
a2 a4		LEGAL
a2 a5		ILLEGAL
a7 a6		LEGAL
a7 a5		LEGAL
a7 a4		ILLEGAL
a7 b6		ILLEGAL
b8 a6		LEGAL
b8 c6		LEGAL
b8 d7		ILLEGAL
e2 e3		LEGAL
e3 e2		ILLEGAL

{[a2]}


conv = {
:bp => "bP", 
:wp => "wP",
:br => "bR",
:wr => "wR",
:bN => "bN" ,
:wN => "wN",
:bB => "bB" ,
:wB => "wB",
:bQ => "bQ" ,
:wQ => "wQ",
:bK => "bK" ,
:wK => "wK"
}
conv[:bp]



class Board
	def initialize
		chess_board = [[0,0,0,0,0,0,0,0][0,0,0,0,0,0,0,0][0,0,0,0,0,0,0,0][0,0,0,0,0,0,0,0][0,0,0,0,0,0,0,0][0,0,0,0,0,0,0,0][0,0,0,0,0,0,0,0][0,0,0,0,0,0,0,0]]
		chess_board[0][0] = :br 
		:bp = chess_board[0][1]
		:bn = chess_board[1][0]
end




class Pieces 
	def initialize (origen,dest)
		@origen = origen
		@dest= dest
	end
end

class Pawn < Pieces
	include movements
	def check_move
		check_vertical
	end
end

class Knight < Pieces
	include movements
	def check_move
		check_L
	end
end

class Bishop < Pieces
	include movements
	def check_move
		check_diagonal
	end
end

class Rook < pieces
	include movements
	def check_move
		check_horizontal || check_vertical
	end
end

class queen < pieces
	include movements
	def check_move
		check_horizontal || check_vertical || check_diagonal
	end
end

class king < pieces
	include movements
	def check_move
		check_vertical || check_horizontal || check_diagonal
	end
end

r = Rook.new([0,8], [0,1])
r.check_move

module movements
	def check_horizontal 
		@origen[1] == @dest[1]
	end
	def check_vertical 
		@origen[0] == @dest[0]
	end
	def check_L 
		((@origen[0]-@dest[0]).abs==2 && (@origen[1]-@dest[1]).abs==1) || ((@origen[0]-@dest[0]).abs==1 && (@origen[1]-@dest[1]).abs==2)
	end
	def check_diagonal 
		(@origen[0] - @dest[0]).abs == (@origen[1] - @dest[1]).abs
	end
end