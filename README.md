[![Build Status](
https://travis-ci.org/nickrusso42518/cisco-etech.svg?branch=master)](
https://travis-ci.org/nickrusso42518/cisco-etech)

# Cisco CCIE/CCDE Evolving Technologies
This book covers the Cisco Evolving Technologies version 1.1 blueprint
and includes detailed explanations of modern cloud, network programmability,
and Internet of Things (IoT) technologies. The book includes a mix of
high level explanations, detailed diagrams, and hands-on demonstrations
using a variety of Cisco and third party products and services.

You can get the newest PDF of the book from my publications page:
[njrusmc.net/pub/pub.html](http://njrusmc.net/pub/pub.html)

> Contact information:\
> Email:    njrusmc@gmail.com\
> Twitter:  @nickrusso42518

  * [Purpose](#purpose)
  * [Structure](#structure)
  * [Builds](#builds)
  * [FAQ](#faq)

## Purpose
This book is designed for anyone studying for the CCIE or CCDE certification
written exams. Since summer 2016, Cisco expert level written exams have
included 10% of their questions pulled from a new "evolving techologies"
topic domain. This book seeks to address the technologies in that new section.

## Structure
The simplified tree structure below outlines how the TeX source files are
organized. Each `img/` folder has `.jpg` or `.png` images which are
imported to the TeX files as needed. Auxiliary files (Makefile, setup
scripts, etc.) are not shown below and are discussed in the Builds section.

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
`-- main.tex
```

## Builds
TLDR: For manual builds, use `make` by itself. You'll get a PDF out of it.

To simplify testing both for CI and for manual executions, a GNU `Makefile`
with phony targets is used. Use the following shortcuts to test the playbook.
Review the file to see a detailed explanation of each target.

The `texsetup.sh` script handles the installation of the newest available
version of [TeX Live](https://www.tug.org/texlive/acquire-netinstall.html).
This includes installing the `basic` subset of packages to reduce
download size. It also installs all required `tlmgr` packages used in the
project. Anyone forking this repository can simply extend the list of
packages in the shell script.

Travis CI is used for CI/CD. After the PDF is compiled, it is copied
(as an artifact) to AWS S3 within my personal website's file bucket. It
is automatically and immediately available for public consumption after
this occurs. See `.travis.yml` for more details on the CI/CD steps.

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
technologies" be written, maintained, tested, and delivered as if it were
code. "Walk the walk", as it were.

__Q__: How often is the book updated with new content?\
__A__: Traditionally, the book has been updated every 6 months, starting
in the summer of 2016 and continuing until the summer of 2018 (5 releases).
Given the new version control and pipeline design, releases happen
more frequently. Whenever I have changes, I'll push them here and an
updated PDF will be automatically generated and uploaded to my website.

__Q__: Will your book still be available on Cisco Learning Network?\
__A__: I will preserve the legacy delivery method on Cisco Learning Network
by manually updating a new PDF every few months. However, I recommend
downloading the book directly from my website to ensure you always have
the most updated version available.
