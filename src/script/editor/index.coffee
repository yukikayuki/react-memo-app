{React} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/template.jade"

class Editor extends React.Component
  constructor: ->
    @state =
      value: ''

  onChange: (e) ->
    console.log e.target.value

  render: ->
    template onChange: @onChange.bind(this), defaultValue: @state.value

module.exports = Editor

