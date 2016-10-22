fs = require 'fs'
marked = require 'marked'
pug = require 'pug'
uglifycss = require 'uglifycss'

#
# Pages tree
#
pagesTree = (dir, tree) ->
  pages = fs.readdirSync dir
  tree ?= {}
  for page in pages
    key = page.replace(/^\d+-/, '').replace(/\..*$/, '')
    pagePath = "#{dir}/#{page}"
    if fs.statSync(pagePath).isDirectory()
      tree[key] = {}
      pagesTree pagePath, tree[key]
    else
      tree[key] = pagePath
  tree

pagesList = (tree, dir, level, list) ->
  list ?= []
  level ?= 0

  for k, v of tree
    obj =
      path: if dir? then "#{dir}/#{k}" else k
      level: level + 1
    if typeof v is 'object'
      obj.src = v.index
      obj.title = getTitle obj.src
      list.push obj
      pagesList v, obj.path, obj.level, list
    else if k isnt 'index'
      obj.src = v
      obj.title = getTitle obj.src
      list.push obj

  list

#
# Get page title
#
getTitle = (src) ->
  data = fs.readFileSync(src).toString()
  data.split('\n')[0]

#
# Parse Markdown files
#
parseMarkdown = (src) ->
  body = marked fs.readFileSync(src).toString()
  # Parse external links
  body = body.replace /(<a)(.*href="http[^>]+)>/g, '$1 class="ext"$2 target="_blank">'
  body

#
# Table of contents
#
tableOfContents = (currentPage, pages) ->
  toc = ''
  level = 0
  numbers = []
  uls = ['', '<ul class="chapter">', '<ul class="section">', '<ul class="subsection">']
  for page in pages
    numbers[page.level] ?= 0
    numbers[page.level + 1] = 0
    numbers[page.level]++

    number = ''
    for i in [1..page.level]
      number += numbers[i] + '.'
    if page.level > level
      toc += uls[page.level]
    else if page.level < level
      toc += '</ul>'
    level = page.level
    if page.src is currentPage.src
      toc += "<li><strong>#{number}&nbsp;#{page.title}</strong></li>"
    else
      toc += "<li><a href=\"/#{page.path}/\"><strong>#{number}</strong>&nbsp;#{page.title}</a></li>"

  while level--
    toc += '</ul>'
  toc

#
# Render output file
#
render = (page, pages) -> #src, toc, dir) ->
  console.log "Rendering '#{page.path}/index.html'"
  if not fs.existsSync page.path
    fs.mkdirSync page.path
  pugRender = pug.compileFile 'src/template.pug'
  html = pugRender
    title: page.title
    body: parseMarkdown page.src
    toc: tableOfContents page, pages
  fd = fs.openSync "#{page.path}/index.html", 'w'
  fs.writeSync fd, html
  fs.closeSync fd

#
# Main
#
process.chdir "#{__dirname}/.."

# Pages
tree = pagesTree 'src/pages'
pages = pagesList tree
index =
  path: '.'
  level: 0
  src: tree.index
  title: getTitle tree.index
render index, pages
for page in pages
  render page, pages

# CSS
cssFiles = fs.readdirSync 'src/css/'
cssFiles = cssFiles.map((v) -> 'src/css/' + v)
uglified = uglifycss.processFiles cssFiles
fileName = 'css/qeda.min.css'
console.log "Rendering '#{fileName}'"
if not fs.existsSync 'css'
  fs.mkdirSync 'css'
fd = fs.openSync fileName, 'w'
fs.writeSync fd, uglified
fs.closeSync fd
