#set par(justify: true, leading: 0.75em, spacing: 6pt)
#set text(lang: "vi")
#set figure(supplement: [Bảng])
#show figure.where(kind: table): set figure.caption(position: top)
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(above: 12pt, below: 18pt, align(center, text(size: 16pt, weight: "bold", it.body)))
}
#show heading.where(level: 2): it => block(above: 12pt, below: 8pt, text(size: 14pt, weight: "bold", it.body))
#show heading.where(level: 3): it => block(above: 10pt, below: 6pt, text(size: 12pt, weight: "bold", style: "italic", it.body))
#show raw.where(block: false): set text(font: "Times New Roman", size: 12pt)
#show link: set text(fill: black)
