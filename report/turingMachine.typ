#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

#let turingMachineGraph(doc) = {
  set text(10pt)

  align(center, diagram(
    node-stroke: .1em,
    edge-stroke: .07em,
    node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
    spacing: 5em,

    // q0 node
    node((-1,0), [$q_0$], name: <q0>, radius: 2em),
    edge(<q0>, "-|>", <q1>)[$1 arrow \_,R$],
    edge(<q0>, "-|>", <q9>, bend: -15deg, label-angle: -65deg, label-side: left, label-pos: 0.7)[$1 arrow \_,R$],
    edge(<q0>, "-|>", <q10>, bend: -10deg)[$\_ arrow \_,R$],

    // q1 node
    node((0,0), [$q_1$], name: <q1>, radius: 2em),
    edge(<q1>, "-|>", <q1>, bend: 120deg)[$1 arrow 1,R$],
    edge(<q1>, "-|>", <q2>)[$* arrow *,R$],

    // q2 node
    node((1,0), [$q_2$], name: <q2>, radius: 2em),
    edge(<q2>, "-|>", <q3>)[$1 -> \_,R$],
    edge(<q2>, "-|>", <q7>, label-angle: 75deg)[$= -> =,L$],
    edge(<q2>, "-|>", <q12>, label-angle: -45deg)[$\_ -> \_, R$],

    // q3 node
    node((2,0), [$q_3$], name: <q3>, radius: 2em),
    edge(<q3>, "-|>", <q3>, bend: 120deg)[$1 --> 1,R$],
    edge(<q3>, "-|>", <q4>)[$\_, = -> =, R$],

    // q4 node
    node((3,0), [$q_4$], name: <q4>, radius: 2em),
    edge(<q4>, "-|>", <q4>, bend: 130deg, loop-angle: 9deg)[$1 arrow 1, R$],
    edge(<q4>, "-|>", <q5>, label-side: left)[$\_ -> 1, L$],

    // q5 node
    node((3,1), [$q_5$], name: <q5>, radius: 2em),
    edge(<q5>, "-|>", <q5>, bend: 130deg, loop-angle: 9deg)[$1 arrow 1, L$],
    edge(<q5>, "-|>", <q6>, bend: 0.5deg)[$= -> =, L$],

    // q6 node
    node((3,2), [$q_6$], name: <q6>, radius: 2em),
    edge(<q6>, "-|>", <q6>, bend: 130deg, loop-angle: 9deg)[$1 arrow 1, L$],
    edge(<q6>, "-|>", <q2>, label-angle: -45deg, bend: -30deg)[$\_ --> 1, R$],

    // q7 node
    node((0.75,1), [$q_7$], name: <q7>, radius: 2em),
    edge(<q7>, "-|>", <q7>, bend: 120deg, loop-angle: 0deg)[$1 arrow 1, L$],
    edge(<q7>, "-|>", <q8>, label-side: left)[$* -> *, L$],

    // q8 node
    node((-0.25,1), [$q_8$], name: <q8>, radius: 2em),
    edge(<q8>, "-|>", <q8>, bend: 125deg, loop-angle: 55deg, label-pos: 0.42)[$1 arrow 1, L$],
    edge(<q8>, "-|>", <q0>, label-angle: -55deg, label-pos: 0.6)[$\_ -> 1, R$],

    // q9 node
    node((-0.25,2), [$q_9$], name: <q9>, radius: 2em),
    edge(<q9>, "-|>", <q9>, bend: 120deg, loop-angle: 65deg)[$1 arrow 1, L$],
    edge(<q9>, "-|>", <done>, label-angle: -40deg, label-pos: 0.6)[$\_ arrow \_, R$],

    // q10 node
    node((-1,2), [$q_10$], name: <q10>, radius: 2em),
    edge(<q10>, "-|>", <q10>, bend: 130deg, loop-angle: 180deg)[$* arrow *, R\ 1 arrow 1, R$],
    edge(<q10>, "-|>", <q11>)[$\_ arrow =, L$],

    // q11 node
    node((-1,3), [$q_11$], name: <q11>, radius: 2em),
    edge(<q11>, "-|>", <q11>, bend: 130deg, loop-angle: 180deg)[$* arrow *, L\ 1 arrow 1, L$],
    edge(<q11>, "-|>", <q16>)[$\_ arrow \_, R$],

    // q12 node
    node((2,1), [$q_12$], name: <q12>, radius: 2em),
    edge(<q12>, "-|>", <q13>, label-side: left)[$\_ arrow =, L$],

    // q13 node
    node((2,2), [$q_13$], name: <q13>, radius: 2em),
    edge(<q13>, "-|>", <q14>, label-side: left)[$\_ arrow =, L$],

    // q14 node
    node((2,3), [$q_14$], name: <q14>, radius: 2em),
    edge(<q14>, "-|>", <q15>, label-angle: -45deg)[$* arrow *, L$],

    // q15 node
    node((1,2), [$q_15$], name: <q15>, radius: 2em),
    edge(<q15>, "-|>", <q15>, bend: 120deg, loop-angle: 70deg)[$1 arrow 1, L$],
    edge(<q15>, "-|>", <q9>, label-side: left)[$\_ arrow 1, L$],

    // q14 node
    node((0,3), [$q_16$], name: <q16>, radius: 2em),
    edge(<q16>, "-|>", <done>)[$* arrow *, L$],

    // final node
    node((1,3), [$q_17$], name: <done>, radius: 2em, fill: yellow),
  ))
}
