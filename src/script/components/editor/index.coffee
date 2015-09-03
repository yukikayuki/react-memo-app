{React} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/template.jade"

class Editor extends React.Component
  onChange: (e) ->
    text = e.target.value
    @props.change id: @props.id, text: text

  render: ->
    template onChange: @onChange.bind(this), text: @props.text

module.exports = Editor
