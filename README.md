[![Build Status](
https://travis-ci.org/nickrusso42518/cisco-etech.svg?branch=master)](
https://travis-ci.org/nickrusso42518/cisco-etech)

# Cisco CCIE/CCDE Evolving Technologies
This book covers the Cisco Evolving Technologies version 1.1 blueprint
and includes detailed explanations of modern cloud, network programmability,
and Internet of Things (IoT) technologies. The book includes a mix of
high level explanations, detailed diagrams, and hands-on demonstrations
using a variety of Cisco and third party products and services.

> Contact information:\
> Email:    njrusmc@gmail.com\
> Twitter:  @nickrusso42518

  * [Purpose](#purpose)
  * [Structure](#structure)
  * [Tooling](#tooling)
  * [FAQ](#faq)

## Purpose
This book is designed for anyone studying for the CCIE or CCDE certification
written exams. Since summer 2016, Cisco expert level written exams have
included 10% of their questions pulled from a new "evolving techologies"
topic domain. This book seeks to address that new section.

## Structure
The simplified tree structure below outlines how the TeX source files are
organized. Each `img/` folder has `.jpg` or `.png` images which are
imported to the TeX files as needed. Auxiliary files (Makefile, setup
scripts, etc.) are not shown below and are discussed in the Tooling section.

The structure of this best aligns almost perfectly with Cisco's current
blueprint. There are three levels of hierarchy:

1. __Sections__ represent the topmost level of organization, which include
   the main three technical topics, plus the collection of legacy topics
   and the glossary.
2. __Subsections__ represent the individual blueprint topics, and each one
   has a corresponding `*.tex` file with a prefix corresponding to its
   official blueprint name. For example, `a1a4` is the blueprint topic
   for "Workload Migration".
3. __Subsubsections__ represent a level of depth not represented on the
   blueprint. These are the author's excursions into more detailed subjects,
   often technical demonstrations or detailed analyses of the technologies
   being discussed.

At the top of the hierarchy is the `main.tex` file, which does very little
beyond importing the required TeX packages and including all the `*.tex`
source files for individual sections.

```
|-- content
|   |-- cloud
|   |   |-- a1a-design
|   |   |   |-- source-files.tex
|   |   |   `-- img/
|   |   `-- a1b-infra
|   |       |-- source-files.tex
|   |       `-- img/
|   |-- iot
|   |   `-- a3a-archdeploy
|   |       |-- source-files.tex
|   |       `-- img/
|   |-- legacy
|   |   |-- img/
|   |   |-- old-cloud
|   |   |   `-- source-files.tex
|   |   |-- old-iot
|   |   |   `-- source-files.tex
|   |   `-- old-netprog
|   |       `-- source-files.tex
|   |-- misc
|   |   |-- source-files.tex
|   |   `-- img/
|   `-- netprog
|       `-- a2a-archops
|           |-- source-files.tex
|           `-- img
|-- main.tex
```

## Tooling
Still being built, but uses a GNU `Makefile` for simplify linting and
typesetting functions. Also uses Travis CI for automated testing.

## FAQ
__Q__: Why was LaTeX chosen over simpler Markdown or reStructuredText?\
__A__: The end goal is to deliver a standalone PDF for offline and
independent viewing. Using Markdown, for example, requires tools like
`pandoc` and has very limited formatting options. Other solutions use
LaTeX as an intermediary anyway, so I felt it was easiest just to write
the source in LaTeX from the beginning.

__Q__: Why did you spend time to convert Microsoft Word to LaTeX anyway?\
__A__: As the book grew, I found it difficult using MS Word on my Macbook to
format things properly and get a consistent design without extensive
manual effort. Additionally, I find it very fitting that a book on "evolving
technologies" be written, maintained, updated, distributed, and tested as if
it were code. "Walk the walk", as it were.

__Q__: How often is the book updated with new content?\
__A__: Traditionally, the book has been updated every 6 months, starting
in the summer of 2016 and continuing until the summer of 2018 (5 releases).
Given the new version control and pipeline design, releases may happen
more frequently, but I am not committing to any specific timeframes at
the time of this writing.

__Q__: Who covers your operating expenses for maintenance/updates?\
__A__: Given that the book is and always will be free, I fund everything with
the help of generous donations from others. If you like the book, like the
cause, like the concept, or just like me as a person, __please donate__
[here](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=KA9QZVDMVYN26&lc=US&item_name=Evolving%20Technology%20Study%20Guide&item_number=42518&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted).
