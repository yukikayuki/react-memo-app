{React} = require 'vendor'
jade = require 'react-jade'

EditorAction = require '../../contexts/editor/action.coffee'
SentencesAction = require '../../contexts/sentences/action.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

class Editor extends React.Component
  onChange: (e) ->
    text = e.target.value

    EditorAction.change text
    SentencesAction.change @props.id, text

  render: ->
    template onChange: @onChange.bind(this), text: @props.text

  componentDidUpdate: ->
    React.findDOMNode(@refs.editor).focus()

module.exports = Editor
