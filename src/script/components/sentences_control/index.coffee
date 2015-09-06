{React} = require 'vendor'
jade = require 'react-jade'

SentencesAction = require '../../contexts/sentences/action.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

class SentencesControl extends React.Component
  onClick: ->
    SentencesAction.add()

  onSave: ->
    SentencesAction.save()

  render: ->
    template onClick: @onClick.bind(this), onSave: @onSave.bind(this)

module.exports = SentencesControl

