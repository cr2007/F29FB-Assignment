##### F29FB Assignment #####
## CHANDRASHEKHAR RAMAPRASAD - cr2007 ##


def action(input, write, move, next_state):
    global tape_head, state
    if tape[tape_head] == input:
        tape[tape_head] = write
        state = next_state
        if move == 'L':
            tape_head -= 1
        else:
            tape_head += 1
        return True
    return False
    
val = input("Make sure to enter your number as a set of ones (i.e. if the number if 2 * 3, enter it is '11*111')\nEnter the input: ")
# number2 = input("Enter the second factor: ")
# print(number1,number2)
length = len(val)
# print(length1, length2)
tape = ['B'] * (length+3)
# print(tape)

# Initialising the tape
i = 1
tape_head = 1

# Adding the input value to the tape
for n in range(length):
    tape[i] = val[n]
    i += 1


