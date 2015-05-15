$ = require 'jquery'
React = require './react'

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

module.exports = Dot
