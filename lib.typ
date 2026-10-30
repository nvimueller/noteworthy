#import "@preview/theoretic:0.3.1" as theoretic: proof, qed, theorem
#import theoretic.presets.basic: *
#show ref: theoretic.show-ref
#import "@preview/showybox:2.0.4":showybox

#let noteworthy(
  paper-size: "a4",
  font: "New Computer Modern",
  language: "en",
  title: none,                    
  author: none,                  
  watermark: none,               
  content,
) = {
  set page(
    paper: paper-size,
    background: if watermark != none {
      rotate(-40deg, text(30pt, fill: rgb("FFCBC4"))[*#watermark*])
    },
    header: context {
      if (counter(page).get().at(0) > 1) [
        // Pushes the line to the bottom of the header margin so it looks clean
        #set align(bottom) 
        #line(length: 100%)
      ]
    },
    footer: context [
      #line(length: 100%)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left, center, right),
      )
    ],
  )

  set text(
    font: font,
    size: 12pt,
    lang: language,
  )

  set heading(numbering: "1.")
  set par(justify: true)

  showybox(
    frame: (
      border-color: blue.darken(50%),
      body-color: blue.lighten(80%),
    ),
    shadow: (
      offset: 3pt,
    ),
    body-style: (
      align: center,
    ),
    text(weight: "black", size: 15pt, title),
  )

  content
}

#let solution = theoretic.theorem.with(
  supplement:"Solution",
  kind:"solution",
  variant:"remark",
  number:none,
)
