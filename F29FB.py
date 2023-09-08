##### F29FB Assignment #####
## CHANDRASHEKHAR RAMAPRASAD - cr2007 ##
import time
import streamlit as st
import pandas as pd

def action(input_val: str, write: str, move: str, next_state: str):
    """
    This function is used to perform the actions of the Turing Machine

    Parameters
    ----------
    input_val : str
        The input value to be checked
    write : str
        The value to be written to the tape
    move : str
        The direction to move the tape head
    next_state : str
        The next state to move to

    Returns
    -------
    bool
        Returns True if the action is successful, else False
    """

    # Initialising the global variables
    global tape_head, state
    if tape[tape_head] == input_val:
        tape[tape_head] = write  # Writing the value to the tape
        state = next_state       # Changing the state

        # Moving the tape head
        tape_head = (tape_head + 1) if move == 'R' else (tape_head - 1)
        return True         # Returning True if the action is successful
    return False            # Returning False if the action is unsuccessful


st.title("F29FB Assignment")
st.subheader("Unary Multiplication")
st.write("Enter your text below as a set of ones!")
st.write("Example: If you want to calculate $2 \\times 3$, your input would be `11*111`")
st.write("")
st.write("If you want to enter $0$, enter either `0` or `B` (for blank tape)")

# Input Value
val: str = st.text_input("Enter your input", "11*111")

length: int = len(val)     # Length of the input
tape = ['∧'] * (length*3)  # Initialising the tape with the values

# Initialising the tape variables
i: int = 1          # Tape index
tape_head: int = 1  # Tape head

if st.button("Calculate"):
    start = time.time()

    with st.spinner('Wait for it...'):
        # Adding the input value to the tape
        for n in range(length):
            # If value is 0, then it is a blank space
            if val[n].lower() in ['0', 'b']:
                tape[i] = '∧'
            elif val[n] in ['1', '*']:
                tape[i] = val[n] # Else add the value to the tape
            else:
                st.error("**Invalid Input:** The input value must be a **unary** value (i.e. $2 \\times 3$ is **`11*111`**)", icon="⚠️")
                exit()

            i += 1                # Incrementing the tape index

        # Declaring variables so that characters don't have to be used everytime
        q0, q1, q2, q3, q4 = 'q0', 'q1', 'q2', 'q3', 'q4'  # States q0-q4
        q5, q6, q7, q8, q9 = 'q5', 'q6', 'q7', 'q8', 'q9'  # States q5-q9

        # States q10-q16
        q10, q11, q12, q13, q14, q15, q16 = 'q10', 'q11', 'q12', 'q13', 'q14', 'q15', 'q16'
        done: str = 'q17'  # Acceptance State

        state: str = q0          # Start state
        r, l, b = 'R', 'L', '∧'  # Right, Left, Blank symbols
        accept: bool = False     # To check if the input is accepted
        old_tape_head = -1       # To check if the tape head has moved
        tape_count = 0           # To count the number of tapes

        output = []  # Output list

        # While the tape head has moved
        while old_tape_head != tape_head:
            old_tape_head = tape_head                              # Updating the old tape head
            print(f"Tape {tape_count} printed successfully")  # Printing the tape
            output.append({'Tape': tape.copy(), 'Head': tape_head, 'State': state}) # Appending the tape to the output list
            tape_count += 1                                        # Incrementing the tape count

            # q0 State
            if state == q0:
                if action('1', b, r, q1) or action(b, b, r, q10) or action('*', '*', l, q9):
                    pass
            # q1 State
            elif state == q1:
                if action('1', '1', r, q1) or action('*', '*', r, q2):
                    pass
            # q2 State
            elif state == q2:
                if action('1', b, r, q3) or action('=', '=', l, q7) or action(b, b, r, q12):
                    pass
            # q3 State
            elif state == q3:
                if action('1', '1', r, q3) or action(b, '=', r, q4) or action('=', '=', r, q4):
                    pass
            # q4 State
            elif state == q4:
                if action('1', '1', r, q4) or action(b, '1', l, q5):
                    pass
            # q5 State
            elif state == q5:
                if action('1', '1', l, q5) or action('=', '=', l, q6):
                    pass
            # q6 State
            elif state == q6:
                if action('1', '1', l, q6) or action(b, '1', r, q2):
                    pass
            # q7 State
            elif state == q7:
                if action('1', '1', l, q7) or action('*', '*', l, q8):
                    pass
            # q8 State
            elif state == q8:
                if action('1', '1', l, q8) or action(b, '1', r, q0):
                    pass
            # q9 State
            elif state == q9:
                if action('1', '1', l, q9) or action(b, b, r, done):
                    pass
            # q10 State
            elif state == q10:
                if action('1', '1', r, q10) or action('*', '*', r, q10) or action(b, '=', l, q11):
                    pass
            # q11 State
            elif state == q11:
                if action('1', '1', l, q11) or action('*', '*', l, q11) or action(b, b, r, q16):
                    pass
            # q12 State
            elif state == q12:
                if action(b, '=', l, q13):
                    pass
            # q13 State
            elif state == q13:
                if action(b, b, l, q14):
                    pass
            # q14 State
            elif state == q14:
                if action('*', '*', l, q15):
                    pass
            # q15 State
            elif state == q15:
                if action(b, '1', l, q9) or action('1', '1', l, q15):
                    pass
            # q16 State
            elif state == q16:
                if action('*', '*', l, done):
                    pass
            else:
                accept = True

        # If the input is accepted
        if accept:
            # Printing the number of tapes used
            st.success("Successful!", icon="✅")
            st.write(f"Number of tapes used: **{tape_count}**")  # Displaying the number of tapes used
            end = time.time()  # End time
            st.write(f"Time taken: **{end - start:.3f}** seconds")

            df = pd.DataFrame(output)  # Creating a dataframe from the output list
            st.write(df)               # Displaying the dataframe
        else:
            # Printing the error message
            st.write(f"Input not accepted on state = {state}\n")
            print(f"Input not accepted on state = {state}\n")

        # Printing the time taken
        print(f"\nTime taken: {end - start:.3f} seconds")
