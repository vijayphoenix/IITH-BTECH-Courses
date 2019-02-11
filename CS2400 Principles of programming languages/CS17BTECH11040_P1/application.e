note
	description: "CS17BTECH11040_P1 application root class"
	date: "$14/11/18$"
	revision: "$Revision1$"


class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
n: INTEGER						--Dimension of matrix (n*n)
bool : BOOLEAN					--Flag
matrix,inverse: SQMATRIX		--Input matrix,inverse matrix

	make

		do
			Io.read_integer
			n:=Io.last_integer
			create matrix.make(0,n)				--creating a n*n matrix for storing input
			create inverse.make(0,n)			--creating a n*n matrix for storing inverse
			matrix.take_input
			bool:=matrix.is_invertable
			if bool=true then
				inverse:=matrix.find_inverse
				inverse.print_matrix
			else
				Io.put_string ("INVALID")
			end
			rescue
				Io.put_string ("INVALID")
		end

	end
