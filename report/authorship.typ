#let declarationOfAuthorship(doc) = [
  #let headerGrid = grid(
    columns: (auto, auto),
    rows: (auto, auto),
    column-gutter: 1fr,
    [
      #set text(size: 16pt, font: "Arial")
      #text("Student Declaration of Authorship", weight: "bold")
    ],
    [
      #v(7em)
      #align(horizon, image(
        "images/HWU-Logo.jpg",
        height: 2.21cm,
        alt: "Heriot-Watt University logo"
      ))
    ]
  )

  #let data = yaml("metadata.yml")

  #set page(
    header: context {
      if counter(page).get().first() > 1 [
        #set text(font: "Dubai")
        #data.courseworkTitle
        #h(1fr)
        #data.courseCode
        #h(1fr)
        #data.studentID
      ] else {headerGrid}
    },
    footer: context {
      if counter(page).get().first() > 1 [
        #set text(font: "Dubai")
        #set align(center)
        #data.studentFirstName #data.studentLastName.slice(0,1)
        #h(1fr)
        #context counter(page).display("1")
        #h(1fr)
        #data.courseName
      ] else [
        #set align(center)
        #context counter(page).display("1")
      ]
    }
  )

  #let assignmentInformation() = {
    show table.cell.where(x: 0): strong

    show table.cell: it => {
      text(font: "Arial", size: 12pt, it)
    }

    align(center, table(
      align: left,
      stroke: 0.5pt,
      inset: 7pt,
      columns: (1fr, 1.95fr),
      [Course Code and Name:], [#data.courseName (#data.courseCode)],
      [Type of Assessment:], [#data.assessmentType],
      [Coursework Title:], [#data.courseworkTitle],
      [Student Name:], [#data.studentFirstName #data.studentLastName],
      [Student ID Number:], [#data.studentID],
    ))
  }


  #let declaration() = {
    set text(font: "Arial")
    show link: it => {
      underline(text(fill: rgb("#4472C4"), it))
    }

    align(center, table(
      align: left,
      stroke: 0.5pt,
      columns: 1fr,
      [
        #text(fill: rgb("#C00000"), "Declaration of Authorship.", weight: "bold")
        *By signing this form:* \
        \

        #list(
          spacing: 1cm,
          [*I declare* that
          #if (data.assessmentType == "Individual") [the work I have submitted for individual assessment] else [the work I have contributed to a group assessment] is entirely my own.
          I have NOT taken the ideas, writings or inventions of another person and used these as if they were my own.
          My #if (data.assessmentType == "Individual") [submission] else [contribution to a group submission] is expressed in my own words.
          Any uses made within this work of the ideas, writings, or inventions of others, or of any existing sources of information (books, journals, websites, etc.) are properly acknowledged and listed in the references and/or acknowledgements section.],
          [I confirm that I have read, understood and followed the University's Regulations on plagiarism as published on the #link("https://www.hw.ac.uk/uk/students/studies/examinations/plagiarism.htm")[University's website], and that I am aware of the penalties that I will face should I not adhere to the University Regulations.],
          [I confirm that I have read, understood and avoided the different types of plagiarism explained in the University guidance on #link("https://heriotwatt.sharepoint.com/sites/skillshub/SitePages/Academic-Integrity-and-Plagiarism.aspx")[Academic Integrity and Plagiarism]]
        )\

        *Student Signature:* #text(style: "italic", [#data.studentFirstName #data.studentLastName])
        #v(0.5em)
        *Date:* #text(style: "italic")[
          #if (data.submissionDate != none) [#data.submissionDate] else [#datetime.today().display("[day]/[month]/[year]")]
        ]
      ]
    ))
  }

  #v(1.5cm)

  #assignmentInformation()
  #declaration()

  #doc
]
