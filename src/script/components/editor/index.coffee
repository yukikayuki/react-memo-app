{React} = require 'vendor'
jade = require 'react-jade'

SentencesAction = require '../../contexts/sentences/action.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

class Editor extends React.Component
  @propTypes:
    id: React.PropTypes.string
    text: React.PropTypes.string

  onChange: (e) ->
    text = e.target.value

    SentencesAction.change @props.id, text

  render: ->
    template onChange: @onChange.bind(this), text: @props.text

  componentDidUpdate: ->
    React.findDOMNode(@refs.editor).focus()

module.exports = Editor
