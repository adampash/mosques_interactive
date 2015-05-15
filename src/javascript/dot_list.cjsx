React = require './react'
Dot = require './dot'

DotList = React.createClass
  render: ->
    dots = @props.dots.map (dot) ->
      <Dot key={dot.key}
        style={dot.style}
        state={dot.state} />
    <g style={@props.style}>
      {dots}
    </g>

module.exports = DotList
