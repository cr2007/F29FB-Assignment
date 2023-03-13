##### F29FB Assignment #####
## CHANDRASHEKHAR RAMAPRASAD - cr2007 ##

def action(input_val: str, write: str, move: str, next_state: str):
    """Function to check if the input value is the same as the value on the tape
        and if it is, then it performs the action and returns True.\n
        If the input value is not the same as the value on the tape, then it returns False."""
    # Initialising the global variables
    global tape_head, state
    if tape[tape_head] == input_val:
        tape[tape_head] = write # Writing the value to the tape
        state = next_state      # Changing the state

        # Moving the tape head
        if move == 'L':
            tape_head -= 1 # Moving the tape head to the left
        else:
            tape_head += 1 # Moving the tape head to the right
        return True        # Returning True if the action is successful
    return False           # Returning False if the action is unsuccessful

# Input Value
val:str = input("Make sure to enter your number as a set of ones (i.e. if the number if 2 * 3, enter it is '11*111')\nEnter the input: ")

length:int = len(val)     # Length of the input
tape = ['∧'] * (length*3) # Initialising the tape with the values

# Initialising the tape variables
i: int = 1         # Tape index
tape_head: int = 1 # Tape head

# Adding the input value to the tape
for n in range(length):
    # If value is 0, then it is a blank space
    if val[n] == '0' or val[n] == 'B':
        tape[i] = '∧'
    else:
        tape[i] = val[n] # Else add the value to the tape
    i += 1               # Incrementing the tape index

# Declaring variables so that characters don't have to be used everytime
q0, q1, q2, q3, q4 = 'q0', 'q1', 'q2', 'q3', 'q4' # States q0-q4
q5, q6, q7, q8, q9 = 'q5', 'q6', 'q7', 'q8', 'q9' # States q5-q9
q10, q11, q12, q13, q14, q15, q16 = 'q10', 'q11', 'q12', 'q13', 'q14', 'q15', 'q16' # States q10-q16
done:str = 'q17' # Acceptance State

state:str = q0          # Start state
r, l, b = 'R', 'L', '∧' # Right, Left, Blank symbols
accept:bool = False     # To check if the input is accepted
old_tape_head = -1      # To check if the tape head has moved
tape_count = 0          # To count the number of tapes

while old_tape_head != tape_head:
    old_tape_head = tape_head
    print(tape, "Head: ", tape_head, "State: ", state)
    tape_count += 1

    # q0 State
    if state == q0:
        if action('1',b,r,q1) or action(b,b,r,q10) or action('*','*',l,q9):
            pass
    # q1 State
    elif state == q1:
        if action('1','1',r,q1) or action('*','*',r,q2):
            pass
    # q2 State
    elif state == q2:
        if action('1',b,r,q3) or action('=','=',l,q7) or action(b,b,r,q12):
            pass
    # q3 State
    elif state == q3:
        if action('1','1',r,q3) or action(b,'=',r,q4) or action('=','=',r,q4):
            pass
    # q4 State
    elif state == q4:
        if action('1','1',r,q4) or action(b,'1',l,q5):
            pass
    # q5 State
    elif state == q5:
        if action('1','1',l,q5) or action('=','=',l,q6):
            pass
    # q6 State
    elif state == q6:
        if action('1','1',l,q6) or action(b,'1',r,q2):
            pass
    # q7 State
    elif state == q7:
        if action('1','1',l,q7) or action('*','*',l,q8):
            pass
    # q8 State
    elif state == q8:
        if action('1','1',l,q8) or action(b,'1',r,q0):
            pass
    # q9 State
    elif state == q9:
        if action('1','1',l,q9) or action(b,b,r,done):
            pass
    # q10 State
    elif state == q10:
        if action('1','1',r,q10) or action('*','*',r,q10) or action(b,'=',l,q11):
            pass
    # q11 State
    elif state == q11:
        if action('1','1',l,q11) or action('*','*',l,q11) or action(b,b,r,q16):
            pass
    # q12 State
    elif state == q12:
        if action(b,'=',l,q13):
            pass
    # q13 State
    elif state == q13:
        if action(b,b,l,q14):
            pass
    # q14 State
    elif state == q14:
        if action('*','*',l,q15):
            pass
    # q15 State
    elif state == q15:
        if action(b,'1',l,q9) or action('1','1',l,q15):
            pass
    # q16 State
    elif state == q16:
        if action('*','*',l,done):
            pass
    else:
        accept = True

if accept:
    print("\nSuccessfull!!")
    print("*****************************************")
    print(f"Number of tapes used: {tapeCount}")
    print("*****************************************")
else:
    print(f"Input not accepted on state = {state}")