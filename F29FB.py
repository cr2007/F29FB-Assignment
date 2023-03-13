##### F29FB Assignment #####
## CHANDRASHEKHAR RAMAPRASAD - cr2007 ##


def action(input_val: str, write: str, move: str, next_state: str):
    global tape_head, state
    if tape[tape_head] == input_val:
        tape[tape_head] = write
        state = next_state
        if move == 'L':
            tape_head -= 1
        else:
            tape_head += 1
        return True
    return False

val:str = input("Make sure to enter your number as a set of ones (i.e. if the number if 2 * 3, enter it is '11*111')\nEnter the input: ")

length:int = len(val)         # Length of the input
tape = ['∧'] * (length*3) # Initialising the tape

# Initialising the tape variables
i: int = 1
tape_head: int = 1

# Adding the input value to the tape
for n in range(length):
    # If value is 0, then it is a blank space
    if val[n] == '0' or val[n] == 'B':
        tape[i] = '∧'
    else:
        tape[i] = val[n]
    i += 1

# Declaring variables so that characters don't have to be used everytime
q0, q1, q2, q3, q4, q5, q6, q7, q8, q9 = 'q0', 'q1', 'q2', 'q3', 'q4', 'q5', 'q6', 'q7', 'q8', 'q9' # States q0-q9
q10, q11, q12, q13, q14, q15, q16 = 'q10', 'q11', 'q12', 'q13', 'q14', 'q15', 'q16' # States q10-q16
done:str = 'q17' # Acceptance State

state:str = q0              # Start state
R, L, B = 'R', 'L', '∧' # Right, Left, Blank symbols
accept:bool = False         # To check if the input is accepted
oldTapeHead = -1        # To check if the tape head has moved
tapeCount = 0           # To count the number of tapes

while(oldTapeHead != tape_head):
    oldTapeHead = tape_head
    print(tape, "Head: ", tape_head, "State: ", state)
    tapeCount += 1

    # q0 State
    if state == q0:
        if action('1',B,R,q1) or action(B,B,R,q10) or action('*','*',L,q9):
            pass
    # q1 State
    elif state == q1:
        if action('1','1',R,q1) or action('*','*',R,q2):
            pass
    # q2 State
    elif state == q2:
        if action('1',B,R,q3) or action('=','=',L,q7) or action(B,B,R,q12):
            pass
    # q3 State
    elif state == q3:
        if action('1','1',R,q3) or action(B,'=',R,q4) or action('=','=',R,q4):
            pass
    # q4 State
    elif state == q4:
        if action('1','1',R,q4) or action(B,'1',L,q5):
            pass
    # q5 State
    elif state == q5:
        if action('1','1',L,q5) or action('=','=',L,q6):
            pass
    # q6 State
    elif state == q6:
        if action('1','1',L,q6) or action(B,'1',R,q2):
            pass
    # q7 State
    elif state == q7:
        if action('1','1',L,q7) or action('*','*',L,q8):
            pass
    # q8 State
    elif state == q8:
        if action('1','1',L,q8) or action(B,'1',R,q0):
            pass
    # q9 State
    elif state == q9:
        if action('1','1',L,q9) or action(B,B,R,done):
            pass
    # q10 State
    elif state == q10:
        if action('1','1',R,q10) or action('*','*',R,q10) or action(B,'=',L,q11):
            pass
    # q11 State
    elif state == q11:
        if action('1','1',L,q11) or action('*','*',L,q11) or action(B,B,R,q16):
            pass
    # q12 State
    elif state == q12:
        if action(B,'=',L,q13):
            pass
    # q13 State
    elif state == q13:
        if action(B,B,L,q14):
            pass
    # q14 State
    elif state == q14:
        if action('*','*',L,q15):
            pass
    # q15 State
    elif state == q15:
        if action(B,'1',L,q9) or action('1','1',L,q15):
            pass
    # q16 State
    elif state == q16:
        if action('*','*',L,done):
            pass
    else:
        accept = True

if accept:
    print("\nSuccessfull!!")
    print("*****************************************")
    print("Number of tapes used: {}".format(tapeCount))
    print("*****************************************")
else:
    print("Input not accepted on state = {}".format(state))