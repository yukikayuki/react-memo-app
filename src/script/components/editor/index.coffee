{React} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/template.jade"

class Editor extends React.Component
  onChange: (e) ->
    value = e.target.value
    @props.change id: @props.id, value: value

  render: ->
    template onChange: @onChange.bind(this), defaultValue: @props.value

module.exports = Editor
