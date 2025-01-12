#import "authorship.typ": declarationOfAuthorship
#import "turingMachine.typ": turingMachineGraph
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge
#import "@preview/oxifmt:0.2.1": strfmt

#let data = yaml("metadata.yml")

#set text(font: "Calibri")
#set document(
  author: strfmt("{} {}", data.studentFirstName, data.studentLastName),
  title: strfmt("{} {}", data.courseCode, data.courseworkTitle),
)

#show: declarationOfAuthorship.with()

#pagebreak()

#align(horizon + center, [
  #set text(font: "Dubai", size: 11pt)

  #text(
    size: 48pt,
    strfmt("{} {}", data.courseCode, data.courseworkTitle)
  )\ \ \
  #text(
    strfmt("{} {}", data.studentFirstName, data.studentLastName)
  )

  #data.studentID | #link(strfmt("mailto:{}@hw.ac.uk", data.studentEmail))[#data.studentEmail]

  #rect(fill: rgb("#34A853"), width: 100%, text(
    font: "Segoe UI",
    size: 24pt,
    fill: white,
    strfmt("Green Number: {}", data.greenType)
  ))
])

#pagebreak()

#align(left + horizon, outline())

#pagebreak() \

#heading("Section 1") \

#figure(
  caption: "Turing Machine Graph",
  [#show: turingMachineGraph.with()]
) <TM-Graph> \

#line(length: 100%)

#heading("Section 2")

The key difference between my proposed graph and the given graph is:

- The proposed graph has additional states $q_11$, $q_12$, $q_13$, $q_14$, $q_15$, $q_16$, $q_17$ compared to the given graph
- The proposed TM graph has additional transitions in states $q_11$, $q_12$, $q_13$, $q_14$, $q_15$, $q_16$, $q_17$ compared to the given graph
- The proposed graph writes the $*$ symbol in some of its transitions, while the given graph does not use that symbol

#line(length: 100%)
#pagebreak()

#heading("Section 3")

*States:* $Q = {q_0, q_1, q_2, q_3, q_4, q_5, q_6, q_7, q_8. q_9. q_10, q_11, q_12, q_13, q_14, q_15, q_16, q_17}$\
Where $q_0$ is the start state, and $q_17$ is the halt state

*Input Symbols:* ${1, *,' '}$ ($' '$ is a blank symbol)

*Tape Symbols:* ${1,*,' ',=}$, where $=$ is a special symbol

*Start State:* $q_0 in Q$

*Halt State:* $q_17 in Q$

*Actions Table:*

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  align: horizon + center,
  table.header(
    [*Current State*], [*Input Symbol*], [*New Symbol*], [*Move Direction*], [*New State*]
  ),
  table.cell(rowspan: 3, $q_0$),
  "1", $and$, "R", $q_1$,
  $*$, $*$, "L", $q_9$,
  $and$, $and$, "R", $q_10$,

  table.cell(rowspan: 2, $q_1$),
  "1", "1",
  table.cell(rowspan: 2, "R"), $q_1$,
  $*$, $*$, $q_2$,

  table.cell(rowspan: 3, $q_2$),
  "1", $and$, "R", $q_3$,
  $=$, $=$, "L", $q_7$,
  $and$, $and$, "R", $q_12$,

  table.cell(rowspan: 3, $q_3$),
  "1", "1", table.cell(rowspan: 3, "R"), $q_3$,
  $and$, table.cell(rowspan: 2, $=$), table.cell(rowspan: 2, $q_4$),
  $=$,

  table.cell(rowspan: 2, $q_4$),
  "1", table.cell(rowspan: 2, "1"), "R", $q_4$,
  $and$, "L", $q_5$,

  table.cell(rowspan: 2, $q_5$),
  "1", "1", table.cell(rowspan: 2, "L"), $q_5$,
  $=$, $=$, $q_6$,

  table.cell(rowspan: 2, $q_6$),
  "1", table.cell(rowspan: 2, "1"), "L", $q_6$,
  $and$, "R", $q_2$,

  table.cell(rowspan: 2, $q_7$),
  "1", "1", table.cell(rowspan: 2, "L"), $q_7$,
  $*$, $*$, $q_8$,

  table.cell(rowspan: 2, $q_8$),
  "1", table.cell(rowspan: 2, "1"), "L", $q_8$,
  $and$, "R", $q_0$,

  table.cell(rowspan: 2, $q_9$),
  "1", "1", "L", $q_9$,
  $and$, $and$, "R", $q_17$,

  table.cell(rowspan: 3, $q_10$),
  "1", "1", table.cell(rowspan: 2, "R"), table.cell(rowspan: 2, $q_10$),
  $*$, $*$,
  $and$, $=$, "L", $q_11$,

  table.cell(rowspan: 3, $q_11$),
  "1", "1", table.cell(rowspan: 2, "L"), table.cell(rowspan: 2, $q_11$),
  $*$, $*$,
  $and$, $and$, "R", $q_16$,

  $q_12$, $and$, $=$, "L", $q_13$,
  $q_13$, $and$, $and$, "L", $q_14$,
  $q_14$, $*$, $*$, "L", $q_15$,

  table.cell(rowspan: 2, $q_15$),
  $and$, table.cell(rowspan: 2, "1"), table.cell(rowspan: 2, "L"), $q_15$,
  "1", $q_15$,

  $q_16$, $*$, $*$, "L", $q_17$,
  $q_17$, table.cell(colspan: 4, "Final (Accept) State")
)

\ #line(length: 100%)

#heading("Section 4")

The Turing Machine graph was implemented in the Python programming language.
Python was used to implement the above Turing Machine graph due to its simple syntax to represent the graph and easily manipulate the values provided.
It is also very flexible and easy to define and manipulate complex data structures like Turing machines using the List data structure.

#align(center, figure(
  caption: "Initialising variables and the function",
  image("images/Python_Code/Action_Function_Python-Code.png", height: 60%),
))

#align(center + horizon, image("images/Python_Code/While_Loop_Python-Code.png"))

#align(center, image(
  "images/Python_Code/Print_Successful_Python-Code.png",
  alt: "Printing the status of the Turing machine"
))

\ #line(length: 100%)

#heading("Section 5")

This Turing Machine is designed to multiply a decimal number represented by a sequence of '1's with a separator in between the 2 inputs.
It performs unary multiplication on these two numbers and adds the '$=$' sign with the resulting binary product.
The machine begins in state $q_0$ and halts at the state $q_17$ when the input is valid, and the multiplication operation is complete.
The product of the input is stored in the same format, a sequence of 1s separated by a '$*$' symbol between the input and output followed by a '$=$' symbol with the product in the same format.

#heading("Section 6")

The Turing machine is represented by a tape, a head that can read, write, and move across the tape, and a set of states and transition rules.
The transition rules dictate the movement of the head and the symbols written on the tape depending on the current state and the symbol under the head.

#table(
  columns: (1fr, 1fr),
  align: (horizon + center),
  [The code initializes the tape with a "$and$" symbol (blank) and asks the user to input two numbers separated by a "$*$" symbol.],
  image("images/Python_Code/Tape_Initialization_Python-Code.png", alt: "Tape Initialization"),

  [The Turing machine uses a set of states and transition rules to perform the multiplication.\
  The current state and symbol under the head determine which transition rule to apply.],
  image("images/Python_Code/State-Transition_Rules_Python-Code.png"),
  align(left)[The transition rules are represented by the "`action()`" function, which takes four arguments:

  - the #underline("symbol") under the head to be compared with the input value,
  - the #underline("symbol") to #underline("write") on the tape,
  - the #underline("direction") to #underline("move") the head (left or right),
  - and the #underline("next state") to transition to.

  If the symbol under the head matches the input valie, the `action()` function writes the new symbol on the tape, moves the head, and transitions to the next state.
  Otherwise it returns `False`],
  image("images/Python_Code/Action_Function-Table-_Python-Code.png", alt: "Action Function"),
  [The Turing machine transitions through several states, starting with "$q_0$" and ending with "$q_17$".
  Along the way, it performs various operations to multiply the two numbers on the tape.
  For example, the machine moves the head to the right until it encounters a "$=$" symbol, then moves it back to the left until it finds a "1" symbol, and then repeats this process until the multiplication is complete.],
  image("images/Python_Code/While_Loop_Python-Code.png"),
  [The machine also keeps track of the number of tapes it has used and stops once the result is printed on the tape.],
  image("images/Python_Code/Result_Printing_Python-Code.png")
)

\ #line(length: 100%)
#pagebreak()

#heading("Section 7")

#table(
  columns: (20%, 1fr),
  align: center + horizon,
  [$0 times 3\ 0 times 111$)],
  image(
    alt: "Turing Machine for 0 * 3",
    "images/Tests/0-3.png"
  ),
  [$5 times 0 \ (11111 times 0)$],
  image(
    alt: "Turing Machine for 5 * 0",
    "images/Tests/5-0_Test.png"
  ),
  [$2 times 3 \ (11 times 111)$],
  image(
    alt: "Turing Machine for 2 * 3",
    "images/Tests/2-3_Test.png"
  ),
  [$1 times 5 \ (1 times 11111)$],
  image(
    alt: "Turing Machine for 1 * 5",
    height: 17.96cm,
    "images/Tests/1-5_Test.png"
  ),
)

#line(length: 100%)

#heading("Section 8")

The program uses a while loop to iterate through the tape to perform computations until the tape head no longer moves.
This is a reasonable approach since it ensures that the program terminates once no more computations can be performed.
The program also uses a global variable to keep track of the state and the tape head position, which simplifies the code but could make it harder to maintain and modify.

Regarding the individual states, the program uses a combination of conditional statements and branching to determine the next state and tape head position.
This approach is efficient since it reduces the number of iterations required to perform the computations.

#line(length: 100%)
