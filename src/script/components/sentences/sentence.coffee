{React} = require 'vendor'
jade = require 'react-jade'

EditorAction = require '../../contexts/editor/action.coffee'

template = jade.compileFile "#{__dirname}/sentence.jade"

class Sentence extends React.Component
  # ここでアクションを発行していいのかな?
  onClick: ->
    EditorAction.changeActive id: @props.id, value: @props.text

  render: ->
    template text: @props.text, onClick: @onClick.bind(this)

module.exports = Sentence
