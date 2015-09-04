EditorAction = require './contexts/editor/action.coffee'
SentencesAction = require './contexts/sentences/action.coffee'
SentencesUtils = require './contexts/sentences/utils.coffee'

module.exports =
    initializeState: ->
      sentencesPromise = SentencesUtils.fetch()
      sentencesPromise.then (data) ->
        SentencesAction.reset data
        SentencesAction.changeActive data[0].id
        EditorAction.changeActive data[0].id
