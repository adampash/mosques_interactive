# @cjsx React.DOM

React = require './react'
RadComponent = require './rad_component'

React.render <RadComponent rad="most definitely"/>,
  document.getElementById('content')
