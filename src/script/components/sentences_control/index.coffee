{React, _} = require 'vendor'
jade = require 'react-jade'

SentencesAction = require '../../contexts/sentences/action.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

class SentencesControl extends React.Component
  onClick: ->
    newSentence =
      id: _.uniqueId(new Date().getTime())
      text: ''

    SentencesAction.add newSentence
    SentencesAction.changeActive newSentence.id

  onSave: ->
    SentencesAction.save()

  render: ->
    template onClick: @onClick.bind(this), onSave: @onSave.bind(this)

module.exports = SentencesControl

