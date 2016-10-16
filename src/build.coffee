fs = require 'fs'
marked = require 'marked'
pug = require 'pug'

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

#
# Get page title
#
getTitle = (src) ->
  #fd = fs.openSync src, 'r'
  #title = fs.readLineSync fd
  #fs.closeSync fd
  title = 'Title'
  title

#
# Parse Markdown files
#
parseMarkdown = (src) ->
  marked fs.readFileSync(src).toString()

#
# Table of contents
#
tableOfContents = (tree) ->
  for k, v of tree
    console.log k

#
# Render output file
#
render = (dir, src) ->
  pugRender = pug.compileFile 'src/template.pug'
  html = pugRender
    title: getTitle src
    body: parseMarkdown(src)
    toc: 'TOC'
  fd = fs.openSync "#{dir}/index.html", 'w'
  fs.writeSync fd, html
  fs.closeSync fd

#
# Generate pages
#
generate = (tree, dir) ->
  dir ?= '.'
  for k, v of tree
    if k isnt 'index'
      path = "#{dir}/#{k}"
      console.log path
      if not fs.existsSync path
        fs.mkdirSync path
      if typeof v is 'object'
        generate v, path
      else
        render path, v
    else
      render dir, v

#
# Main
#
process.chdir "#{__dirname}/.."

tree = pagesTree 'src/pages'
generate tree
