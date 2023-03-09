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
    