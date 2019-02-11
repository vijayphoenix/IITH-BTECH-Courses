note
	description: "Summary description for {SQMATRIX}."
	author: "Vijay Tadikamalla"
	date: "$14/11/18$"
	revision: "$Revision$"

class
	SQMATRIX
create
	make,
	identity_matrix

feature {NONE}
n: INTEGER

feature
a: ARRAY2[REAL_64]

	make(value:REAL_64;dim:INTEGER)				--CONSTRUCTOR 1: Creates a zero matrix with dimension n
		require									--pre condition
			positive_dimenion:dim>0
		do
			n:=dim
			create a.make_filled(0,n,n)
		ensure									--post condition
			dimension_equal:dim=n
			positive_dimenion:n>0
		end

	identity_matrix(dim:INTEGER)				--CONSTRUCTOR 2: Create a identity martix with dimension n
		require
			positive_dimenion:dim>0
		local
			i: INTEGER
		do
			n:=dim
			create a.make_filled(0,n,n)
			from i:=1 invariant n>0 until i>n	loop
				a[i,i]:=1
				i:=i+1
			variant n-i+1
			end
		ensure										--post condition
			dimension_equal:dim=n
			positive_dimenion:n>0
		end

	take_input
		local
			i,j: INTEGER
		do
			from i:=1 invariant n>0 until i>n	loop
				from j:=1 invariant n>0 until j>n loop
					Io.read_word
					a[i,j]:=Io.last_string.to_integer
					j:=j+1
					variant n-j+1
				end
				i:=i+1
				variant n-i+1
			end
		end

	size: INTEGER
		do
			Result:=n
		end

	print_matrix
		local
			i,j: INTEGER
		do
			from i:=1 invariant n>0 until i>n loop
				from j:=1 invariant n>0 until j>n	loop
					Io.put_double (a[i,j])
					Io.put_string (" ")
					j:=j+1
					variant n-j+1
				end
				Io.new_line
				i:=i+1
				variant n-i+1
			end
		end

	matrix_multiplication(b: SQMATRIX) :SQMATRIX				--Multiplies current matrix and parameter matrix
		local
			i,j,k: INTEGER
			sum: REAL_64
		do
			create Result.make(0,n)
			from i:=1 invariant n>0 until i>n	loop
				from j:=1 invariant n>0 until j>n	loop
					sum:=0
					from k:=1 until k>n loop
						sum:=sum+a[i,k]*b.a[k,j]
						k:=k+1
					variant n-k+1
					end
					Result.a[i,j]:=sum
					j:=j+1
				variant n-j+1
				end
			i:=i+1
			variant n-i+1
			end
		end

		is_identity(b:SQMATRIX) :BOOLEAN				--Checking if the @param matrix is indentity within a error of E0

			local
				i,j:INTEGER
				E0:DOUBLE
			do
				RESULT:=true
				E0:=0.0000001
				from i:=1 until i>n or RESULT=false loop
					from j:=1 until j>n or RESULT=false loop
						if i=j then
							if (b.a[i,j]-1).abs>E0 then
								RESULT:=false
							end
						else
							if b.a[i,j].abs>E0 then
								RESULT:=false
							end
						end
						j:=j+1
					end
					i:=i+1
				end
			end

		is_invertable: BOOLEAN					--Checking if a matrix is invertable by Gaussian elimination
			local
				i,j,k,row: INTEGER
				temp: SQMATRIX
				tmp,fac: REAL_64
			do
				RESULT:=true
				create temp.make(0,n)
				from i:=1 until i>n loop
					from j:=1 until j>n	loop
						temp.a[i,j]:=a[i,j]
						j:=j+1
					end
					i:=i+1
				end

				from i:=1 until i>n or RESULT=false loop
					if temp.a[i,i]=0 then
						row:=temp.find_pivot(i,i)
						if row=0 then
							RESULT:=false
						else
							from j:=1 until j>n loop
								tmp:=temp.a[row,j]
								temp.a[row,j]:=temp.a[i,j]
								temp.a[i,j]:=tmp
								j:=j+1
							end
						end
					end
					from j:=i+1 until j>n or RESULT=false loop
						fac:=temp.a[j,i]/temp.a[i,i]
							from k:=1 until k>n loop
								if k=1 then
								temp.a[j,k]:=0
								else
								temp.a[j,k]:=temp.a[j,k]-temp.a[i,k]*fac
								end
							k:=k+1
						end
						j:=j+1
					end
					i:=i+1
				end
			end


			find_inverse: SQMATRIX							--Calculating inverse of a matrix by Gaussian elimination
			require											--pre condition
				positive_dimenion:current.size>0
				Invertibility: current.is_invertable=true
			local
				i,j,k,row: INTEGER
				temp: SQMATRIX
				tmp,fac: REAL_64
			do
				create RESULT.identity_matrix (n)
				create temp.make(0,n)
				from i:=1 until i>n loop
					from j:=1 until j>n	loop
						temp.a[i,j]:=a[i,j]
						j:=j+1
					end
					i:=i+1
				end

				from i:=1 until i>n loop
					if temp.a[i,i]=0 then
						row:=temp.find_pivot(i,i)
						from j:=1 until j>n loop
							tmp:=temp.a[row,j]
							temp.a[row,j]:=temp.a[i,j]
							temp.a[i,j]:=tmp
							tmp:=RESULT.a[row,j]
							RESULT.a[row,j]:=RESULT.a[i,j]
							RESULT.a[i,j]:=tmp
							j:=j+1
						end
					end
					from j:=1 until j>n loop
						if j/=i then
							fac:=temp.a[j,i]/temp.a[i,i]
							from k:=1 until k>n loop
									temp.a[j,k]:=temp.a[j,k]-temp.a[i,k]*fac
									RESULT.a[j,k]:=RESULT.a[j,k]-RESULT.a[i,k]*fac
								k:=k+1
							end
						end
						j:=j+1
					end
					i:=i+1
				end
				from i:=1 until i>n	loop
					fac:=temp.a[i,i]
					temp.a[i,i]:=1
					from j:=1 until j>n loop
						RESULT.a[i,j]:=RESULT.a[i,j]/fac
						j:=j+1
					end
					i:=i+1
				end
				check
					is_identity(temp)=true
				end
				ensure										--post condition
					is_identity(current.matrix_multiplication(RESULT))=true
			end

		find_pivot(row,column:INTEGER):INTEGER				--FINDING PIVOT FOR A THE GIVEN @params
			require											--pre condition
				valid_row: row>0 and row <=current.size
				valid_column: column>0 and column <=current.size
			local
				i: INTEGER
			do
				RESULT:=0
				from i:=row until i>n or RESULT/=0 loop
					if a[i,column]/=0 then
						RESULT:=i
					end
					i:=i+1
				end
				ensure											--post condition
					RESULT<=current.size
			end

		invariant					--CLASS INVARIANT
			positive_dimension: n>0

end
