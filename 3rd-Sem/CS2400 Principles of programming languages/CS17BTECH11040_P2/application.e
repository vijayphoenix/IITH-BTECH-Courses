note
	description: "Stable marriage problem"
	date: "$14/11/2018$"
	revision: "$Revision1$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature

men: ARRAY2[INTEGER]						--Stores the preferences of men
women: ARRAY2[INTEGER]						--Stores the preferences of women
rank_women:ARRAY2[INTEGER]					--Stores the rank of men according to the women preference
rank_men:ARRAY2[INTEGER]					--Stores the rank of women according to the men preference
woman_partner_index: ARRAY[INTEGER]			--Stores the current husband of woman
n: INTEGER

	make
		local
			i,j,k,temp,first_freeman,w,prefered_man:INTEGER
			man_partner_index: ARRAY[INTEGER]--Stores the current wife of man
			men_status:ARRAY[BOOLEAN]	     --Stores the relationship status of men 1)FALSE:unmarried 2)TRUE:married
			freemen_queue: ARRAYED_QUEUE[INTEGER]--Queue for maintaining all the free men
			total_unmarried_men: INTEGER

		do
			Io.read_word
			n:=Io.last_string.to_integer
			create men.make_filled(1,n+1,n+1)-- n+1 index stores the index of next women he will propose
			create women.make_filled(0,n,n)
			create rank_women.make_filled(0,n,n)
			create rank_men.make_filled(0,n,n)
			from i:=1 invariant n>0 until i>n loop
				Io.read_word
				check
					valid_index(i,Io.last_string)=true
				end
				from j:=1 invariant n>0 until j>n loop
					Io.read_word
					women[i,j]:=Io.last_string.to_integer
					rank_women[i,women[i,j]]:=j
					j:=j+1
					variant
						n-j+1
				end
				check
					valid_permutation(i,false)=true
				end
				i:=i+1
				variant
						n-i+1
			end
			from i:=1 until i>n	loop
				Io.read_word
				check
					valid_index(i,Io.last_string)=true
				end
				from j:=1 until j>n loop
					Io.read_word
					men[i,j]:=Io.last_string.to_integer
					rank_men[i,men[i,j]]:=j
					j:=j+1
				end
				check
					valid_permutation(i,true)=true
				end
				i:=i+1
			end

			create woman_partner_index.make_filled (-1, 1, n)
			create man_partner_index.make_filled (-1, 1, n)
			create men_status.make_filled(false,1,n)
			create freemen_queue.make(n)

			from i:=1 until i>n loop
				freemen_queue.put (i)
				i:=i+1
			end

			from total_unmarried_men:=n	until total_unmarried_men<=0 loop
				first_freeman:=freemen_queue.item
				from i:=men[first_freeman,n+1] until i>n or men_status[first_freeman]=true loop
					w:=men[first_freeman,i]
					if woman_partner_index[w]=-1 then				--CASE#1 man is unmarried,woman is unmarried
						woman_partner_index[w]:=first_freeman
						men_status[first_freeman]:=true
						total_unmarried_men:=total_unmarried_men-1
					else
						temp:=woman_partner_index[w]				--CASE#2 man is unmarried,woman is married
						prefered_man:=preference(temp,first_freeman,w)
						if prefered_man=first_freeman then			--CASE#2A man is unmarried,woman is married with low preference man
							woman_partner_index[w]:=first_freeman
							men_status[first_freeman]:=true
							men_status[temp]:=false
							freemen_queue.put (temp)
						end
					end
					men[first_freeman,n+1]:=men[first_freeman,n+1]+1
					i:=i+1
				end
				freemen_queue.remove
			end
			from i:=1 until i>n loop
				man_partner_index[woman_partner_index[i]]:=i
				i:=i+1
			end
			from i:=1 until i>n loop
				Io.put_integer (man_partner_index[i])
				Io.put_new_line
				i:=i+1
			end
			check
				freemen_queue.is_empty=true
			end
			ensure
				is_stable_marriage=true						--post condition

			rescue
				Io.put_string ("INVALID")
		end

		preference(man1,man2,w:INTEGER):INTEGER				--Return = index of man with higher preference
			local
				i:INTEGER
			do
				if rank_women[w,man1]>rank_women[w,man2] then
					RESULT:=man2
				else
					RESULT:=man1
				end
			end

		preference_of_man(woman1,woman2,m:INTEGER):INTEGER		--Return = index of woman with higher preference
			local
				i:INTEGER
			do
				if rank_men[m,woman1]>rank_men[m,woman2] then
					RESULT:=woman2
				else
					RESULT:=woman1
				end
			end

		valid_index( i: INTEGER;s: STRING): BOOLEAN				--Check for valid index
			do
				RESULT:=false
				if i=s.to_integer then
					RESULT:=true
				end
			end

		valid_permutation(index:INTEGER; gender:BOOLEAN): BOOLEAN--Check for valid permutation
			local
				i:INTEGER
				permutation: ARRAY[BOOLEAN]
			do
				RESULT:=TRUE
				create permutation.make_filled(false,1,n)
				if gender=false then
					from i:=1 until i>n loop
						permutation[women[index,i]]:=true
						i:=i+1
					end
				else
					from i:=1 until i>n loop
						permutation[men[index,i]]:=true
						i:=i+1
					end
				end
				from i:=1 until i>n	or RESULT=false loop
					if permutation[i]=false then
						RESULT:=false
					end
					i:=i+1
				end
			end

		is_stable_marriage: BOOLEAN						--Checks if all the marriages are stable
			local
				i,j,m1,m2,temp1,temp2:INTEGER
			do
				RESULT:=true
				from i:=1 until i>n	or RESULT=false loop
					from j:=1 until j>n or RESULT=false loop
						if i/=j then
							m1:=woman_partner_index[i]
							m2:=woman_partner_index[j]
							temp1:=preference(m1,m2,i)
							temp2:=preference_of_man(i,j,m2)
							if temp1=m2 and temp2=i then
								RESULT:=false
							end
						end
						j:=j+1
					end
					i:=i+1
				end
			end

			invariant							--Class invariant	
				n>0

end
