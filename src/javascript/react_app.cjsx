React = require './react'
$ = require 'jquery'

$ ->
  $('svg path').on 'mouseover', ->
    console.log "mouseover #{$(@).attr('id')}"

Dot = React.createClass
  handleMouseOver: ->
    state = @props.state
    current = $("##{state.abbr}").attr('class')
    if current
      current = current.split ' '
    else
      current = []
    index = current.indexOf 'hover'
    return if (index > -1)
    current.push 'hover'
    $("##{state.abbr}").attr class: current.join(' ')
  handleMouseOut: ->
    state = @props.state
    current = $("##{state.abbr}").attr('class').split(' ')
    index = current.indexOf 'hover'
    if (index > -1)
      current.splice(index, 1)
    $("##{state.abbr}").attr class: current.join(" ")
  handleClick: ->
    state = @props.state
    $('.details h2').text(state.name)
    $('.details h3').text(state.base)
    $('.details .description').text(state.description)
    $("##{state.abbr}").attr class: 'active'
  render: ->
    <circle style={@props.style}
      onMouseOver={@handleMouseOver}
      onMouseOut={@handleMouseOut}
      onClick={@handleClick}
    />

DotList = React.createClass
  render: ->
    dots = @props.dots.map (dot) -> <Dot style={dot.style} state={dot.state} />
    # React.createElement 'g', @props.style, @props.dots.map (dot) -> React.createElement Dot, dot
    <g style={@props.style}>
      {dots}
    </g>


data =
  style:
    key: 'foobar'
  dots: [
    {
      style:
        cx: 325
        cy: 134
        r: 6
        className: 'dot'
        key: "Iowa"
      state:
        name: "Iowa"
        abbr: "IA"
        description: "This is a base that you'll find in the state of Iowa. WOWZA!!"
        base: "Fort Dakota Bend Training Facility"
    }, {
      style:
        cx: 10
        cy: 10
        r: 8
        className: 'dot'
        key: "West Virginia"
      state:
        name: "West Virginia"
        abbr: "WV"
    }, {
      style:
        cx: 250
        cy: 150
        r: 6
        className: 'dot'
        key: "Nebraska"
      state:
        name: "Nebraska"
        abbr: "NE"
    },
  ]

mountNode = document.getElementById('map_dots')
React.render(React.createElement(DotList, data), mountNode)

