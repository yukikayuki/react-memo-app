{React} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/template.jade"

class Editor extends React.Component
  constructor: (props) ->
    @props = props

  onChange: (e) ->
    @props.change e.target.value

  render: ->
    template onChange: @onChange.bind(this), defaultValue: @props.value

module.exports = Editor
