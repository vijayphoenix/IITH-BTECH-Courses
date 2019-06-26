#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// reg will contain the value of the sixteen registers r0 - r15
int reg[16];

// flags contains flags(E) and flags(GT)
int flags[2];

// Data Memory of 4096 bytes
int Mem[1024];

// rd stores destination register, rs1 and rs2 store the source registers and imm is the immediate
int rd, rs1, rs2, imm;

// m stores the modifier, isImm stores whether the instruction contains an immediate
int m, isImm;

// str is the string containing the whole program
char* str;

// Executes the instruction depending upon the value of pc
void executeInstruction(void);

// Stores the register numbers of a 3-address instruction in rd, rs1 and rs2 or imm
void getReg3Add(char* inst, int i);

// Stores the register numbers of a 2-address instruction in rd and rs2 or imm
void getReg2Add(char* inst, int i);

// Stores the register numbers of a ld/st instruction in rd, rs1 and imm
void getLdSt(char* inst, int i);

// Prints the line number where an error has occured and exits the program
void invalidInst(void);	

// Returns decimal value of a hexadecimal digit
int dec(char ch);

// sets pc for the main function
void setPcForMain(void);

// gets pc for a given label str[i,j]
int getPcForLabel(char* str, int i, int j);

// k stores the line number of the instruction
int k;

// pc stores the instruction number and therefore pc will be the (program counter)/4
int pc;

// lab_no stores the label number
int lab_no;

// lab_count stores the number of labels in the program
int lab_count;

// An array used to convert a hexadecimal immediate to decimal
int hexImm[4];

// encodedInst will contain the encoding of an instruction
unsigned int encodedInst;

// A struct for each instruction
struct instruction
{
	int i;		// starting index of inst
	int j;  	// ending index of inst
	int line;	// line in which the instruction appears
};

// An array of all instruction structs of the program (behaves somewhat like the instruction memory)
struct instruction *instructions;

// A struct for each label
struct label
{
	int i;  	  // starting index of label
	int j;  	  // ending index of label
	int inst_no;  // inst_no this label points to
};

// An array of label structs of the program
struct label *labels;

int main(int argc, char* argv[])
{

	k = 1;

	//Code for opening the file and computing the size of the program
	long int size;
	FILE* f = fopen(argv[1], "r");		// argv[1] is the name of the file in which the program is written
	if(f == 0)
	{
		printf("Could not read file!!!\n");
		exit(0);
	}
	else
	{
		fseek(f, 0, SEEK_END);	// fseek takes f to EOF
		size = ftell(f);		// ftell gives the position of f which is EOF and hence returns the length of the file
	}
	size = size + 2;			// We add 2 to accomodate for an extra '\n' and a '\0'
	
	// Code for storing the whole program into the string str
	str = malloc(size*(sizeof(char)));
	rewind(f);					// Brings f to the beginning of the file
	int colon_count = 0;		// colon_count will contain the number of colons in the program which decides the maximum number of labels
	int line_count = 0;			// line_count will contain the number of lines in the program which decides the maximum number of instructions
	int i = 0;
	int x = fgetc(f);
	while(x != EOF)
	{
		if(x != 13)				// We neglect the carriage returns (ASCII 13) if present
		{
			if(x == '/')		// We simply neglect the multi-line comments and DON'T add them to the string str
			{
				x = fgetc(f);
				if(x == '*')
				{
					while(1)
					{
						x = fgetc(f);
						if(x == EOF)
						{
							printf("Error: Unterminated Comment!\n");
							exit(0);
						}
						else if(x == '*')
						{
							x = fgetc(f);
							if(x == '/')
							{
								x = fgetc(f);
								break;
							}
						}
					}
				}
				else if(x == EOF)
				{
					str[i++] = '/';
					break;
				}
				else
					str[i++] = '/';
			}
			if(x == EOF)
				break;
			str[i++] = x;
			if(x == '\n')
				line_count++;
			else if(x == ':')
				colon_count++;
		}
		x = fgetc(f);
	}
	str[i++] = '\n';
	str[i] = '\0';

	instructions = malloc(line_count*sizeof(struct instruction));
	labels = malloc(colon_count*sizeof(struct label));

	x = 0;
	while(str[x] == '\n')
	{
		x++;
		k++;	// Incrementing the line number
	}
	i = x;		// Beginnning of the first non-empty line
	int j, t;
	pc = 0;
	lab_no = 0;
	while(str[x] != '\0')
	{
		if(str[x] == ':')	// to obtain the instruction which the label is identifying
		{
			t = x--;		// t stores the position of the colon
			while(str[x] != ' ' && str[x] != '\t' && str[x] != '\n')
			{
				x--;
				if(x < 0)
					break;
			}
			labels[lab_no].i = x+1;
			labels[lab_no].j = t;
			j = x;
			x = t+1;
			while(str[x] == ' ' || str[x] == '\t')
				++x;
			if(str[x] == '\n')	// label is pointing to the instruction in the next line
			{
				while(j > 0)
				{
					if(str[j] != ' ' && str[j] != '\t')
						break;
					--j;
				}
				if(str[j] == '\n' || j == -1)
					labels[lab_no++].inst_no = pc;		// There is no instruction in the line of this label
				else
				{
					labels[lab_no++].inst_no = pc+1;	// There is an instruction before this label in the same line but label points to the next line
					instructions[pc].i = i;
					instructions[pc].j = j+1;
					instructions[pc].line = k;
					pc++;
				}
			}
			else
			{
				labels[lab_no++].inst_no = pc;		// Label points to an instruction in the same line
				instructions[pc].i = x;
				while(str[x] != '\n')
					x++;
				instructions[pc].j = x;
				instructions[pc].line = k;
				pc++;
			}
			while(str[x] == '\n')	// Neglecting all blank lines after this label
			{
				x++;
				k++;	// Incrementing the line number
			}
			i = x;
		}
		else if(str[x] == '\n')			// This is the end of an instruction
		{
			j = x;
			instructions[pc].i = i;		// i is the beginning of the instruction
			instructions[pc].j = j;
			instructions[pc].line = k;
			pc++;
			while(str[x] == '\n')		// Neglecting all blank lines after this instruction
			{
				x++;
				k++;	// Incrementing the line number
			}
			i = x;
		}
		else
			x++;
	}
	int inst_count = pc;
	lab_count = lab_no;
	setPcForMain();
	reg[14] = 4092;		// setting the stack pointer to 0xFFC (the end of the memory)
	while(pc < inst_count)
	{
		k = instructions[pc].line;	// Line number of the current pc
		executeInstruction();		// Executes the instruction corresponding to the current pc
		pc++;
	}
	return 0;
}


void executeInstruction(void)
{
	int b = instructions[pc].i;		// b is the beginning of the instruction
	int f = instructions[pc].j;		// f is the end of the instruction
	while(str[b] == ' ' || str[b] == '\t')
		b++;
	int u = b;
	while(u < f)
	{
		if(str[u] == '@')	// Everything after @ will be a single line comment
		{
			f = u;
			break;
		}
		u++;
	}
	if(b == f)	// If this line is just a blank line or a comment and does not contain any instruction
		return;
	int l = f-b+1;
	char inst[l];
	memcpy(inst, &str[b], l-1);		// Copy the instructions into the string inst
	inst[l-1] = '\0';
	int i = 0;
	switch(inst[i])
	{
		case 'a': if(inst[i+2] == 'd')
				{
					if(inst[i+1] == 'd')	//ADD
					{
						i = i + 3;
						if(inst[i] == ' ' || inst[i] == '\t')  //add
						{
							++i;
							m = 0;	// modifier is set to 0 (default)
							getReg3Add(inst, i);
							if(isImm)
								reg[rd] = reg[rs1] + imm;
							else
								reg[rd] = reg[rs1] + reg[rs2];
						}

						else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //addu
						{
							i = i + 2;
							m = 1;	// modifier is set to 1 (unsigned)
							getReg3Add(inst, i);
							if(isImm)
								reg[rd] = reg[rs1] + imm;
							else
								invalidInst();	//addu and rs2 are incompatible
						}

						else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //addh
						{
							i = i + 2;
							m = 2;	// modifier is set to 2 (high)
							getReg3Add(inst, i);
							if(isImm)
								reg[rd] = reg[rs1] + imm;
							else
								invalidInst();	//addh and rs2 are incompatible
						}

						else
							invalidInst();
					}


					else if(inst[i+1] == 'n')	//AND
					{
						i = i + 3;
						if(inst[i] == ' ' || inst[i] == '\t')  //and
						{
							++i;
							m = 0;
							getReg3Add(inst, i);
							if(isImm)
								reg[rd] = reg[rs1] & imm;
							else
								reg[rd] = reg[rs1] & reg[rs2];
						}

						else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //andu
						{
							i = i + 2;
							m = 1;
							getReg3Add(inst, i);
							if(isImm)
								reg[rd] = reg[rs1] & imm;
							else
								invalidInst();	//andu and rs2 are incompatible
						}

						else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //andh
						{
							i = i + 2;
							m = 2;
							getReg3Add(inst, i);
							if(isImm)
								reg[rd] = reg[rs1] & imm;
							else
								invalidInst();	//andh and rs2 are incompatible
						}
						else
							invalidInst();
					}

					else
						invalidInst();
				}


				else if(inst[i+1] == 's' && inst[i+2] == 'r' && (inst[i+3] == ' ' || inst[i+3] == '\t'))	//ASR
				{
					i = i + 4;
					m = 0;
					getReg3Add(inst, i);
					if(isImm)
					{
						if(imm < 0)
						{
							printf("Cannot perform arithmetic right shift by a negative number\n");
							invalidInst();
						}
						reg[rd] = reg[rs1] >> imm;
					}
					else
					{
						if(reg[rs2] < 0)
						{
							printf("Cannot perform arithmetic right shift by a negative number\n");
							invalidInst();
						}
						reg[rd] = reg[rs1] >> reg[rs2];
					}
				}

				else
					invalidInst();
				break;


		case 's': if(inst[i+1] == 't' && (inst[i+2] == ' ' || inst[i+2] == '\t'))		// ST
				{
					i += 3;
					getLdSt(inst, i);
					if((reg[rs1]+imm)%4 != 0)
					{
						printf("Cannot access a memory location which is not a multiple of 4 !!!\n");
						invalidInst();
					}
					Mem[(reg[rs1]+imm)/4] = reg[rd];
				}


				else if(inst[i+1] == 'u' && inst[i+2] == 'b')	 //SUB
				{
					i = i + 3;
					if(inst[i] == ' ' || inst[i] == '\t')  //sub
					{
						++i;
						m = 0;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] - imm;
						else
							reg[rd] = reg[rs1] - reg[rs2];
					}

					else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //subu
					{
						i = i + 2;
						m = 1;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] - imm;
						else
							invalidInst();	//subu and rs2 are incompatible
					}
					else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //subh
					{
						i = i + 2;
						m = 2;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] - imm;
						else
							invalidInst();	//subh and rs2 are incompatible
					}

					else
						invalidInst();
				}

				else
					invalidInst();
				break;


		case 'm': if(inst[i+1] == 'o')
				{
					if(inst[i+2] == 'd')	//MOD
					{
						i = i + 3;
						if(inst[i] == ' ' || inst[i] == '\t')  //mod
						{
							++i;
							m = 0;
							getReg3Add(inst, i);
							if(isImm)
							{
								if(imm == 0)
								{
									printf("Cannot divide by a 0!\n");
									invalidInst();
								}
								reg[rd] = reg[rs1] % imm;
							}
							else
							{
								if(reg[rs2] == 0)
								{
									printf("Cannot divide by a 0!\n");
									invalidInst();
								}
								reg[rd] = reg[rs1] % reg[rs2];
							}
						}

						else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //modu
						{
							i = i + 2;
							m = 1;
							getReg3Add(inst, i);
							if(isImm)
							{
								if(imm == 0)
								{
									printf("Cannot divide by a 0!\n");
									invalidInst();
								}
								reg[rd] = reg[rs1] % imm;
							}
							else
								invalidInst();	//modu and rs2 are incompatible
						}

						else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //modh
						{
							i = i + 2;
							m = 2;
							getReg3Add(inst, i);
							if(isImm)
							{
								if(imm == 0)
								{
									printf("Cannot divide by a 0!\n");
									invalidInst();
								}
								reg[rd] = reg[rs1] % imm;
							}
							else
								invalidInst();	//modh and rs2 are incompatible
						}

						else
							invalidInst();
					}


					else if(inst[i+2] == 'v')	//MOV
					{
						i = i + 3;
						if(inst[i] == ' ' || inst[i] == '\t')  //mov
						{
							++i;
							m = 0;
							getReg2Add(inst, i);
							if(isImm)
								reg[rd] = imm;
							else
								reg[rd] = reg[rs2];
						}

						else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //movu
						{
							i = i + 2;
							m = 1;
							getReg2Add(inst, i);
							if(isImm)
								reg[rd] = imm;
							else
								invalidInst();	//movu and rs2 are incompatible
						}

						else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //movh
						{
							i = i + 2;
							m = 2;
							getReg2Add(inst, i);
							if(isImm)
								reg[rd] = imm;
							else
								invalidInst();	//movh and rs2 are incompatible
						}

						else
							invalidInst();
					}

					else
						invalidInst();
				}


				else if(inst[i+1] == 'u' && inst[i+2] == 'l')   // MUL
				{
					i = i + 3;
					if(inst[i] == ' ' || inst[i] == '\t')  //mul
					{
						++i;
						m = 0;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] * imm;
						else
							reg[rd] = reg[rs1] * reg[rs2];
					}

					else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //mulu
					{
						i = i + 2;
						m = 1;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] * imm;
						else
							invalidInst();	//mulu and rs2 are incompatible
					}

					else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //mulh
					{
						i = i + 2;
						m = 2;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] * imm;
						else
							invalidInst();	//mulh and rs2 are incompatible
					}

					else
						invalidInst();
				}

				else
					invalidInst();
				break;


		case 'd': if(inst[i+1] == 'i' && inst[i+2] == 'v')   // DIV
				{
					i = i + 3;
					if(inst[i] == ' ' || inst[i] == '\t')  //div
					{
						++i;
						m = 0;
						getReg3Add(inst, i);
						if(isImm)
						{
							if(imm == 0)
							{
								printf("Cannot divide by a 0!\n");
								invalidInst();
							}
							reg[rd] = reg[rs1] / imm;
						}
						else
						{
							if(reg[rs2] == 0)
							{
								printf("Cannot divide by 0!\n");
								invalidInst();
							}
							reg[rd] = reg[rs1] / reg[rs2];
						}
					}

					else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //divu
					{
						i = i + 2;
						m = 1;
						getReg3Add(inst, i);
						if(isImm)
						{
							if(imm == 0)
							{
								printf("Cannot divide by 0!\n");
								invalidInst();
							}
							reg[rd] = reg[rs1] / imm;
						}
						else
							invalidInst();	//divu and rs2 are incompatible
					}

					else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //divh
					{
						i = i + 2;
						m = 2;
						getReg3Add(inst, i);
						if(isImm)
						{
							if(imm == 0)
							{
								printf("Cannot divide by 0!\n");
								invalidInst();
							}
							reg[rd] = reg[rs1] / imm;
						}
						else
							invalidInst();	//divh and rs2 are incompatible
					}

					else
						invalidInst();
				}

				else
					invalidInst();
				break;


		case 'c': if(inst[i+1] == 'm' && inst[i+2] == 'p')		// CMP (I am reading cmp as cmp rd, rs2/imm for the sake of convenience though it should be cmp rs1, rs2/imm)
				{
					i = i + 3;
					if(inst[i] == ' ' || inst[i] == '\t')  //cmp
					{
						++i;
						m = 0;
						getReg2Add(inst, i);
						if(isImm)
						{
							if(reg[rd] == imm)
							{
								flags[0] = 1;
								flags[1] = 0;
							}
							else if(reg[rd] > imm)
							{
								flags[1] = 1;
								flags[0] = 0;
							}
							else
							{
								flags[0] = 0;
								flags[1] = 0;
							}
						}
						else
						{
							if(reg[rd] == reg[rs2])
							{
								flags[0] = 1;
								flags[1] = 0;
							}
							else if(reg[rd] > reg[rs2])
							{
								flags[1] = 1;
								flags[0] = 0;
							}
							else
							{
								flags[0] = 0;
								flags[1] = 0;
							}
						}
					}

					else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //cmpu
					{
						i = i + 2;
						m = 1;
						getReg2Add(inst, i);
						if(isImm)
						{
							if(reg[rd] == imm)
							{
								flags[0] = 1;
								flags[1] = 0;
							}
							else if(reg[rd] > imm)
							{
								flags[1] = 1;
								flags[0] = 0;
							}
							else
							{
								flags[0] = 0;
								flags[1] = 0;
							}
						}
						else
							invalidInst();	//cmpu and rs2 are incompatible
					}

					else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //cmph
					{
						i = i + 2;
						m = 2;
						getReg2Add(inst, i);
						if(isImm)
						{
							if(reg[rd] == imm)
							{
								flags[0] = 1;
								flags[1] = 0;
							}
							else if(reg[rd] > imm)
							{
								flags[1] = 1;
								flags[0] = 0;
							}
							else
							{
								flags[0] = 0;
								flags[1] = 0;
							}
						}
						else
							invalidInst();	//cmph and rs2 are incompatible
					}

					else
						invalidInst();
				}


				else if(inst[i+1] == 'a' && inst[i+2] == 'l' && inst[i+3] == 'l' && (inst[i+4] == ' ' || inst[i+4] == '\t'))	// CALL
				{
					i += 5;
					while(inst[i] == ' ' || inst[i] == '\t')
						++i;
					// Reading the label which call has to jump to
					int label_init = i;
					while(inst[i] != '\0' && inst[i] != ' ' && inst[i] != '\t')
						++i;
					reg[15] = (4*pc) + 4;		// assigning the return address register ra to program counter[4*pc] + 4
					pc = getPcForLabel(str, b+label_init, b+i) - 1;  // Subtract 1 so that after the instruction, when pc is incremented with pc++ we will reach the correct instruction
				}

				else
					invalidInst();
				break;


		case 'o': if(inst[i+1] == 'r')   // OR
				{
					i = i + 2;
					if(inst[i] == ' ' || inst[i] == '\t')  //or
					{
						++i;
						m = 0;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] | imm;
						else
							reg[rd] = reg[rs1] | reg[rs2];
					}

					else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //oru
					{
						i = i + 2;
						m = 1;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] | imm;
						else
							invalidInst();	//oru and rs2 are incompatible
					}

					else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //orh
					{
						i = i + 2;
						m = 2;
						getReg3Add(inst, i);
						if(isImm)
							reg[rd] = reg[rs1] | imm;
						else
							invalidInst();	//orh and rs2 are incompatible
					}

					else
						invalidInst();
				}

				else
					invalidInst();
				break;


		case 'n': if(inst[i+1] == 'o')
				{
					if(inst[i+2] == 't')   // NOT
					{
						i = i + 3;
						if(inst[i] == ' ' || inst[i] == '\t')  //not
						{
							++i;
							m = 0;
							getReg2Add(inst, i);
							if(isImm)
								reg[rd] = ~imm;
							else
								reg[rd] = ~reg[rs2];
						}

						else if(inst[i] == 'u' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //notu
						{
							i = i + 2;
							m = 1;
							getReg2Add(inst, i);
							if(isImm)
								reg[rd] = ~imm;
							else
								invalidInst();	//notu and rs2 are incompatible
						}

						else if(inst[i] == 'h' && (inst[i+1] == ' ' || inst[i+1] == '\t'))  //noth
						{
							i = i + 2;
							m = 2;
							getReg2Add(inst, i);
							if(isImm)
								reg[rd] = ~imm;
							else
								invalidInst();	//noth and rs2 are incompatible
						}

						else
							invalidInst();
					}


					else if(inst[i+2] == 'p')	//NOP
					{
						// Does nothing
					}

					else
						invalidInst();
				}

				else
					invalidInst();
				break;

		case 'l': if(inst[i+1] == 's')
				{
					if(inst[i+2] == 'l' && (inst[i+3] == ' ' || inst[i+3] == '\t'))	// LSL
					{
						i = i + 4;
						m = 0;
						getReg3Add(inst, i);
						if(isImm)
						{
							if(imm < 0)
							{
								printf("Cannot perform logical left shift by a negative number\n");
								invalidInst();
							}
							reg[rd] = reg[rs1] << imm;
						}
						else
						{
							if(reg[rs2] < 0)
							{
								printf("Cannot perform logical left shift by a negative number\n");
								invalidInst();
							}
							reg[rd] = reg[rs1] << reg[rs2];
						}
					}


					else if(inst[i+2] == 'r' && (inst[i+3] == ' ' || inst[i+3] == '\t'))  //LSR
					{
						i = i + 4;
						m = 0;
						getReg3Add(inst, i);
						if(isImm)
						{
							if(imm < 0)
							{
								printf("Cannot perform logical right shift by a negative number\n");
								invalidInst();
							}
							reg[rd] = (unsigned)reg[rs1] >> imm;
						}
						else
						{
							if(reg[rs2] < 0)
							{
								printf("Cannot perform logical right shift by a negative number\n");
								invalidInst();
							}
							reg[rd] = (unsigned)reg[rs1] >> reg[rs2];
						}
					}

					else
						invalidInst();
				}


				else if(inst[i+1] == 'd' && (inst[i+2] == ' ' || inst[i+2] == '\t'))	// LD
				{
					i += 3;
					getLdSt(inst, i);
					if((reg[rs1]+imm)%4 != 0)
					{
						printf("Cannot access a memory location which is not a multiple of 4 !!!\n");
						invalidInst();
					}
					reg[rd] = Mem[(reg[rs1]+imm)/4];
				}

				else
					invalidInst();
				break;


		case 'b': if(inst[i+1] == ' ' || inst[i+1] == '\t')		// B
				{
					i += 2;
					while(inst[i] == ' ' || inst[i] == '\t')
						++i;
					// Reading the label which b has to jump to
					int label_init = i;
					while(inst[i] != '\0' && inst[i] != ' ' && inst[i] != '\t')
						++i;
					pc = getPcForLabel(str, b+label_init, b+i) - 1;  // Subtract 1 so that after the instruction, when pc is incremented with pc++ we will reach the correct instruction
				}


				else if(inst[i+1] == 'e' && inst[i+2] == 'q' && (inst[i+3] == ' ' || inst[i+3] == '\t'))		//BEQ
				{
					if(flags[0])
					{
						i += 4;
						while(inst[i] == ' ' || inst[i] == '\t')
							++i;
						// Reading the label which beq has to jump to
						int label_init = i;
						while(inst[i] != '\0' && inst[i] != ' ' && inst[i] != '\t')
							++i;
						pc = getPcForLabel(str, b+label_init, b+i) - 1;  // Subtract 1 so that after the instruction, when pc is incremented with pc++ we will reach the correct instruction
					}
				}


				else if(inst[i+1] == 'g' && inst[i+2] == 't' && (inst[i+3] == ' ' || inst[i+3] == '\t'))		//BGT
				{
					if(flags[1])
					{
						i += 4;
						while(inst[i] == ' ' || inst[i] == '\t')
							++i;
						// Reading the label which bgt has to jump to
						int label_init = i;
						while(inst[i] != '\0' && inst[i] != ' ' && inst[i] != '\t')
							++i;
						pc = getPcForLabel(str, b+label_init, b+i) - 1;  // Subtract 1 so that after the instruction, when pc is incremented with pc++ we will reach the correct instruction
					}
				}

				else
					invalidInst();

				break;


		case 'r': if(inst[i+1] == 'e' && inst[i+2] == 't') 		//RET
					pc = reg[15]/4 - 1;		// setting pc to ra/4 [we divide by 4 because pc is 1/4 of program counter], but subtracted by 1 to come to the right instruction after pc++
				
				else
					invalidInst();

				break;

		case '.': if(inst[i+1] == 'p' && inst[i+2] == 'r' && inst[i+3] == 'i' && inst[i+4] == 'n' && inst[i+5] == 't' && (inst[i+6] == ' ' || inst[i+6] == '\t'))	// .print
				{
					i += 7;
					// This loop will print all the registers that are to be printed
					while(1)
					{
						// Here rd will be used to denote the register to be printed
						while(inst[i] == ' ' || inst[i] == '\t')
							i++;
						if(inst[i] == 's' && inst[i+1] == 'p')
						{
							rd = 14;
							i += 2;
						}
						else
						{
							if(inst[i] != 'r')
								invalidInst();
							++i;
							if(inst[i] == 'a')
							{
								rd = 15;
								++i;
							}
							else if(isdigit(inst[i]))
							{
								rd = inst[i] - '0';
								++i;
								if(isdigit(inst[i]))
								{
									rd = rd*10 + (inst[i] - '0');
									++i;
								}
							}
							else
								invalidInst();
						}
						if(rd < 0 || rd > 15)
							invalidInst();
						printf("r%-2d: %d\n",rd, reg[rd]);
						while(inst[i] == ' ' || inst[i] == '\t')
							i++;
						if(inst[i] != ',')
							break;
						++i;
					}
				}

				else if(inst[i+1] == 'e' && inst[i+2] == 'n' && inst[i+3] == 'c' && inst[i+4] == 'o' && inst[i+5] == 'd' && inst[i+6] == 'e' && (inst[i+7] == ' ' || inst[i+7] == '\t'))	// .encode
				{
					i += 8;
					while(inst[i] == ' ' || inst[i] == '\t')
						++i;
					encodedInst = 0;
					int q = i;
					if(strncmp(&inst[i],"add",3) == 0)	// opcode 00000
					{
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"sub",3) == 0)	// opcode 00001
					{
						encodedInst += (1<<27);			// adding the opcode
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding the modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding the modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"mul",3) == 0)	// opcode 00010
					{
						encodedInst += (2<<27);			// adding the opcode
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"div",3) == 0)	// opcode 00011
					{
						encodedInst += (3<<27);			// adding the opcode
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"mod",3) == 0)	// opcode 00100
					{
						encodedInst += (4<<27);			// adding the opcode
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"cmp",3) == 0)	// opcode 00101
					{
						encodedInst += (5<<27);			// adding the opcode
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg2Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<18) + imm;	//adding the immediate bit & rs1 bit and the immediate
						else
							encodedInst += (rd<<18) + (rs2<<14);		//adding the immediate bit, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"and",3) == 0)	// opcode 00110
					{
						encodedInst += (6<<27);			// adding the opcode
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"or",2) == 0)	// opcode 00111
					{
						encodedInst += (7<<27);			// adding the opcode
						if(inst[i+2] == 'u' && (inst[i+3] == ' ' || inst[i+3] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+2] == 'h' && (inst[i+3] == ' ' || inst[i+3] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+2] != ' ' && inst[i+2] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 3;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"not",3) == 0)	// opcode 01000
					{
						encodedInst += (8<<27);			// adding the opcode
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg2Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + imm;	//adding the immediate bit, rd bit and the immediate
						else
							encodedInst += (rd<<22) + (rs2<<14);		//adding the immediate bit, rd & rs2 bits
					}
					else if(strncmp(&inst[i],"mov",3) == 0)	// opcode 01001
					{
						encodedInst += (9<<27);			// adding the opcode
						if(inst[i+3] == 'u' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<16);		// adding for modifier bit
						else if(inst[i+3] == 'h' && (inst[i+4] == ' ' || inst[i+4] == '\t'))
							encodedInst += (1<<17);		// adding for modifier bit
						else if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg2Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + imm;	//adding the immediate bit, rd bit and the immediate
						else
							encodedInst += (rd<<22) + (rs2<<14);		//adding the immediate bit, rd & rs2 bits
					}
					else if(strncmp(&inst[i],"lsl",3) == 0)	// opcode 01010
					{
						encodedInst += (10<<27);			// adding the opcode
						if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"lsr",3) == 0)	// opcode 01011
					{
						encodedInst += (11<<27);			// adding the opcode
						if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"asr",3) == 0)	// opcode 01100
					{
						encodedInst += (12<<27);			// adding the opcode
						if(inst[i+3] != ' ' && inst[i+3] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 4;
						getReg3Add(inst,i);
						if(imm < 0)
							imm += (1<<16);
						if(isImm)
							encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
						else
							encodedInst += (rd<<22) + (rs1<<18) + (rs2<<14);		//adding the immediate bit, rd, rs1 & rs2 bits
					}
					else if(strncmp(&inst[i],"nop",3) == 0)	// opcode 01101
						encodedInst += (13<<27);			// adding the opcode
					else if(strncmp(&inst[i],"ld",2) == 0)	// opcode 01110
					{
						encodedInst += (14<<27);			// adding the opcode
						if(inst[i+2] != ' ' && inst[i+2] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 3;
						getLdSt(inst,i);
						if(imm < 0)
							imm += (1<<16);
						encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
					}
					else if(strncmp(&inst[i],"st",2) == 0)	// opcode 01111
					{
						encodedInst += (15<<27);			// adding the opcode
						if(inst[i+2] != ' ' && inst[i+2] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 3;
						getLdSt(inst,i);
						if(imm < 0)
							imm += (1<<16);
						encodedInst += (1<<26) + (rd<<22) + (rs1<<18) + imm;	//adding the immediate bit, rd & rs1 bits and the immediate
					}
					else if(inst[i] == 'b')
					{
						if(inst[i+1] == ' ' || inst[i+1] == '\t')	// opcode 10010
						{
							encodedInst += (18<<27);			// adding the opcode
							i += 2;
						}
						else if(strncmp(&inst[i+1],"eq",2) == 0 && (inst[i+3] == ' ' || inst[i+3] == '\t'))	// opcode 10000
						{
							encodedInst += (16<<27);
							i += 4;
						}	
						else if(strncmp(&inst[i+1],"gt",2) == 0 && (inst[i+3] == ' ' || inst[i+3] == '\t'))	// opcode 10001
						{
							encodedInst += (17<<27);
							i += 4;
						}
						else
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						while(inst[i] == ' ' || inst[i] == '\t')
							++i;
						// Reading the label which the branch has to jump to
						int label_init = i;
						while(inst[i] != '\0' && inst[i] != ' ' && inst[i] != '\t')
							++i;
						int offset = getPcForLabel(str, b+label_init, b+i) - pc;
						if(offset < 0)
							offset += (1<<27);
						encodedInst += offset;
					}
					else if(strncmp(&inst[i],"call",4) == 0)	// opcode 10011
					{
						encodedInst += (19<<27);			// adding the opcode
						if(inst[i+4] != ' ' && inst[i+4] != '\t')
						{
							printf("Invalid instruction for encoding!\n");
							invalidInst();
						}
						i += 5;
						while(inst[i] == ' ' || inst[i] == '\t')
							++i;
						// Reading the label which the call has to jump to
						int label_init = i;
						while(inst[i] != '\0' && inst[i] != ' ' && inst[i] != '\t')
							++i;
						int offset = getPcForLabel(str, b+label_init, b+i) - pc;
						if(offset < 0)
							offset += (1<<27);
						encodedInst += offset;
					}
					else if(strncmp(&inst[i],"ret",3) == 0)	// opcode 10100
						encodedInst += (20<<27);			// adding the opcode
					else
					{
						printf("Invalid instruction for encoding!\n");
						invalidInst();
					}
					printf("%s: %#010x\n",&inst[q],encodedInst);
				}

				else
					invalidInst();

				break;

		default: invalidInst();
			  	  break;
	}
}


void getReg3Add(char* inst, int i)
{
	//Code to extract register number of rd
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] == 's' && inst[i+1] == 'p')
	{
		rd = 14;
		i += 2;
	}
	else
	{
		if(inst[i] != 'r')
			invalidInst();
		++i;
		if(inst[i] == 'a')
		{
			rd = 15;
			++i;
		}
		else if(isdigit(inst[i]))
		{
			rd = inst[i] - '0';
			++i;
			if(isdigit(inst[i]))
			{
				rd = rd*10 + (inst[i] - '0');
				++i;
			}
		}
		else
			invalidInst();
	}
	if(rd < 0 || rd > 15)
		invalidInst();


	//Code to extract register number of rs1
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] != ',')
		invalidInst();
	++i;
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] == 's' && inst[i+1] == 'p')
	{
		rs1 = 14;
		i += 2;
	}
	else
	{
		if(inst[i] != 'r')
			invalidInst();
		++i;
		if(inst[i] == 'a')
		{
			rs1 = 15;
			++i;
		}
		else if(isdigit(inst[i]))
		{
			rs1 = inst[i] - '0';
			++i;
			if(isdigit(inst[i]))
			{
				rs1 = rs1*10 + (inst[i] - '0');
				++i;
			}
		}
		else
			invalidInst();
	}
	if(rs1 < 0 || rs1 > 15)
		invalidInst();


	//Code to extract register number of rs2/imm
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] != ',')
		invalidInst();
	++i;
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] == 's' && inst[i+1] == 'p')
	{
		rs2 = 14;
		i += 2;
		isImm = 0;
	}
	else if(inst[i] == 'r')	// if we have rs2
	{
		++i;
		if(inst[i] == 'a')
		{
			rs2 = 15;
			++i;
			isImm = 0;
		}
		else if(isdigit(inst[i]))
		{
			rs2 = inst[i] - '0';
			++i;
			if(isdigit(inst[i]))
			{
				rs2 = rs2*10 + (inst[i] - '0');
				++i;
			}
			isImm = 0;	//since the instruction does not have an immediate
		}
		else
			invalidInst();
		if(rs2 < 0 || rs2 > 15)
			invalidInst();
	}

	else if(inst[i] == '0' && inst[i+1] == 'x')	// if we have a hexadecimal immediate
	{
		i = i + 2;
		while(inst[i] == ' ' || inst[i] == '\t')
			++i;
		if(inst[i] == '\0')
			invalidInst();
		int hexIndex = 0;
		while(inst[i] != '\0' && hexIndex < 4)
		{
			hexImm[hexIndex++] = dec(inst[i++]);
			while(inst[i] == ' ' || inst[i] == '\t')
				++i;
		}
		if(inst[i] != '\0')
			invalidInst();
		imm = 0;
		int q = 0;
		while(q < hexIndex)
			imm = 16*imm + hexImm[q++];
		if(hexIndex == 4)
		{
			if(m != 1 && hexImm[0] >= 8)
				imm -= 65536;
		}
		if(m == 2)
			imm *= 65536;
		isImm = 1;
	}

	else if(isdigit(inst[i]))	// if we have a positive decimal immediate
	{ 
		imm = 0;
		while(isdigit(inst[i]))
		{
			imm = imm*10 + (inst[i] - '0');
			i++;
		}
		if(imm > 65535)
			invalidInst(); 		// The immediate cannot be greater than 16 bits and largest 16 bit unsigned number is 0xFFFF = 65535
		if(m == 0 || m == 2)
		{
			if(imm > 32767)
				invalidInst();	//The largest positive number in 16 bit signed numbers is 0x7FFF = 32767
		}
		if(m == 2)
			imm *= 65536;
		isImm = 1;
	}

	else if(inst[i] == '-')		// if we have a negative decimal immediate
	{
		i++;
		while(inst[i] == ' ' || inst[i] == '\t')
			++i;
		imm = 0;
		while(isdigit(inst[i]))
		{
			imm = imm*10 + (inst[i] - '0');
			i++;
		}
		imm = -imm;
		if(imm < -32768)
			invalidInst();	// Since the smallest negative number in 16 bit signed numbers is 0x8000 = -32768
		if(m == 1)
			imm += 65536;
		else if(m == 2)
			imm *= 65536;
		isImm = 1;
	}

	else
		invalidInst();
}


void getReg2Add(char* inst, int i)
{
	//Code to extract register number of rd
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] == 's' && inst[i+1] == 'p')
	{
		rd = 14;
		i += 2;
	}
	else
	{
		if(inst[i] != 'r')
			invalidInst();
		++i;
		if(inst[i] == 'a')
		{
			rd = 15;
			++i;
		}
		else if(isdigit(inst[i]))
		{
			rd = inst[i] - '0';
			++i;
			if(isdigit(inst[i]))
			{
				rd = rd*10 + (inst[i] - '0');
				++i;
			}
		}
		else
			invalidInst();
	}
	if(rd < 0 || rd > 15)
		invalidInst();


	//Code to extract register number of rs2/imm
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] != ',')
		invalidInst();
	++i;
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;

	if(inst[i] == 's' && inst[i+1] == 'p')
	{
		rs2 = 14;
		i += 2;
		isImm = 0;
	}
	else if(inst[i] == 'r')	// if we have rs2
	{
		++i;
		if(inst[i] == 'a')
		{
			rs2 = 15;
			++i;
			isImm = 0;
		}
		else if(isdigit(inst[i]))
		{
			rs2 = inst[i] - '0';
			++i;
			if(isdigit(inst[i]))
			{
				rs2 = rs2*10 + (inst[i] - '0');
				++i;
			}
			isImm = 0;	//since the instruction does not have an immediate
		}
		else
			invalidInst();
		if(rs2 < 0 || rs2 > 15)
			invalidInst();
	}

	else if(inst[i] == '0' && inst[i+1] == 'x')	// if we have a hexadecimal immediate
	{
		i = i + 2;
		while(inst[i] == ' ' || inst[i] == '\t')
			++i;
		if(inst[i] == '\0')
			invalidInst();
		int hexIndex = 0;
		while(inst[i] != '\0' && hexIndex < 4)
		{
			hexImm[hexIndex++] = dec(inst[i++]);
			while(inst[i] == ' ' || inst[i] == '\t')
				++i;
		}
		if(inst[i] != '\0')
			invalidInst();
		imm = 0;
		int q = 0;
		while(q < hexIndex)
			imm = 16*imm + hexImm[q++];
		if(hexIndex == 4)
		{
			if(m != 1 && hexImm[0] >= 8)
				imm -= 65536;
		}
		if(m == 2)
			imm *= 65536;
		isImm = 1;
	}

	else if(isdigit(inst[i]))	// if we have a positive decimal immediate
	{
		imm = 0;
		while(isdigit(inst[i]))
		{
			imm = imm*10 + (inst[i] - '0');
			i++;
		}
		if(imm > 65535)
			invalidInst(); 		// The immediate cannot be greater than 16 bits and largest 16 bit unsigned number is 0xFFFF = 65535
		if(m == 0 || m == 2)
		{
			if(imm > 32767)
				invalidInst();	//The largest positive number in 16 bit signed numbers is 0x7FFF = 32767
		}
		if(m == 2)
			imm *= 65536;
		isImm = 1;
	}

	else if(inst[i] == '-')		// if we have a negative decimal immediate
	{
		i++;
		while(inst[i] == ' ' || inst[i] == '\t')
			++i;
		imm = 0;
		while(isdigit(inst[i]))
		{
			imm = imm*10 + (inst[i] - '0');
			i++;
		}
		imm = -imm;
		if(imm < -32768)
			invalidInst();	// Since the smallest negative number in 16 bit signed numbers is 0x8000 = -32768
		if(m == 1)
			imm += 65536;
		else if(m == 2)
			imm *= 65536;
		isImm = 1;
	}

	else
		invalidInst();
}


void getLdSt(char* inst, int i)		// instruction is of the form rd, imm[rs1]
{
	//Code to extract register number of rd
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] == 's' && inst[i+1] == 'p')
	{
		rd = 14;
		i += 2;
	}
	else
	{
		if(inst[i] != 'r')
			invalidInst();
		++i;
		if(inst[i] == 'a')
		{
			rd = 15;
			++i;
		}
		else if(isdigit(inst[i]))
		{
			rd = inst[i] - '0';
			++i;
			if(isdigit(inst[i]))
			{
				rd = rd*10 + (inst[i] - '0');
				++i;
			}
		}
		else
			invalidInst();
	}
	if(rd < 0 || rd > 15)
		invalidInst();


	//Code to extract register number of imm
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] != ',')
		invalidInst();
	++i;
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;

	if(inst[i] == '[')		 // if we are using just register indirect mode of addressing
		imm = 0;

	else if(inst[i] == '0' && inst[i+1] == 'x')	// if we have a hexadecimal immediate
	{
		i = i + 2;
		while(inst[i] == ' ' || inst[i] == '\t')
			++i;
		if(inst[i] == '[' || inst[i] == '\0')
			invalidInst();
		int hexIndex = 0;
		while(inst[i] != '[' && hexIndex < 4)
		{
			hexImm[hexIndex++] = dec(inst[i++]);
			while(inst[i] == ' ' || inst[i] == '\t')
				++i;
		}
		if(inst[i] != '[')
			invalidInst();
		imm = 0;
		int q = 0;
		while(q < hexIndex)
			imm = 16*imm + hexImm[q++];
		if(hexIndex == 4)
		{
			if(hexImm[0] >= 8)
				imm -= 65536;
		}
	}

	else if(isdigit(inst[i]))	// if we have a positive decimal immediate
	{
		imm = 0;
		while(isdigit(inst[i]))
		{
			imm = imm*10 + (inst[i] - '0');
			i++;
		}
		if(imm > 32767)
			invalidInst();		//The largest positive number in 16 bit signed numbers is 0x7FFF = 32767
	}

	else if(inst[i] == '-')		// if we have a negative decimal immediate
	{
		i++;
		while(inst[i] == ' ' || inst[i] == '\t')
			++i;
		imm = 0;
		while(isdigit(inst[i]))
		{
			imm = imm*10 + (inst[i] - '0');
			i++;
		}
		imm = -imm;
		if(imm < -32768)
			invalidInst();	// Since the smallest negative number in 16 bit signed numbers is 0x8000 = -32768
	}

	else
		invalidInst();


	//Code to extract register number of rs1
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] != '[')
		invalidInst();
	++i;
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] == 's' && inst[i+1] == 'p')
	{
		rs1 = 14;
		i += 2;
		isImm = 0;
	}
	else
	{
		if(inst[i] != 'r')
			invalidInst();
		++i;
		if(inst[i] == 'a')
		{
			rs1 = 15;
			++i;
		}
		else if(isdigit(inst[i]))
		{
			rs1 = inst[i] - '0';
			++i;
			if(isdigit(inst[i]))
			{
				rs1 = rs1*10 + (inst[i] - '0');
				++i;
			}
		}
		else
			invalidInst();
	}
	if(rs1 < 0 || rs1 > 15)
		invalidInst();
	while(inst[i] == ' ' || inst[i] == '\t')
		i++;
	if(inst[i] != ']')
		invalidInst();
}


int dec(char ch)
{
	switch(ch)
	{
		case '0': return 0;
				   break;
		case '1': return 1;
				   break;
		case '2': return 2;
				   break;
		case '3': return 3;
				   break;
		case '4': return 4;
				   break;
		case '5': return 5;
				   break;
		case '6': return 6;
				   break;
		case '7': return 7;
				   break;
		case '8': return 8;
				   break;
		case '9': return 9;
				   break;
		case 'a':
		case 'A': return 10;
				   break;
		case 'b':
		case 'B': return 11;
				   break;
		case 'c':
		case 'C': return 12;
				   break;
		case 'd':
		case 'D': return 13;
				   break;
		case 'e':
		case 'E': return 14;
				   break;
		case 'f':
		case 'F': return 15;
				   break;
	}
	invalidInst();
}


void setPcForMain(void)
{
	int lab_c = 0;
	int i, j;
	while(lab_c < lab_count)
	{
		i = labels[lab_c].i;
		j = labels[lab_c].j;
		if(j-i == 5)
		{
			if(strncmp(&str[i],".main",5) == 0)
			{
				pc = labels[lab_c].inst_no;
				return;
			}
		}
		lab_c++;
	}
	printf("There is no .main label in the program !!!\n");
	exit(0);
}


int getPcForLabel(char* str, int i, int j)
{
	int lab_c = 0;
	int li, lj;
	// Search for that label which has the same name as the label in the instruction
	while(lab_c < lab_count)
	{
		li = labels[lab_c].i;
		lj = labels[lab_c].j;
		if((j-i) == (lj-li))
		{
			if(strncmp(&str[i],&str[li],j-i) == 0)
				return labels[lab_c].inst_no;
		}
		lab_c++;
	}
	printf("The label does not exist !!!\n");
	invalidInst();
}


void invalidInst(void)
{
	printf("The instruction in line number %d is INVALID.\n", k);
	exit(0);	// EXIT the interpreter
}
