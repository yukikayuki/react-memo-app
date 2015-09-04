{React, _} = require 'vendor'
jade = require 'react-jade'

SentencesAction = require '../../contexts/sentences/action.coffee'
EditorAction = require '../../contexts/editor/action.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

class SentencesControl extends React.Component
  onClick: ->
    newSentence =
      id: _.uniqueId()
      text: ''

    SentencesAction.add newSentence
    EditorAction.changeActive newSentence.id

  render: ->
    template onClick: @onClick.bind(this)

module.exports = SentencesControl

