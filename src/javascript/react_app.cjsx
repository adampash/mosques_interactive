React = require './react'
DotList = require './dot_list'
data = require './data'
$ = require 'jquery'

$ ->
  $('svg path').on 'mouseover', ->
    console.log "mouseover #{$(@).attr('id')}"

mountNode = document.getElementById('map_dots')
React.render(<DotList dots={data.dots}
                style={data.style} />,
            mountNode)
