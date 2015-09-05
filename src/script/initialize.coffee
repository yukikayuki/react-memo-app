EditorAction = require './contexts/editor/action.coffee'
SentencesAction = require './contexts/sentences/action.coffee'
SentencesUtils = require './contexts/sentences/utils.coffee'

module.exports =
    initializeState: ->
      sentencesPromise = SentencesUtils.fetch()
      sentencesPromise.then (data) ->
        SentencesAction.reset data.sentences
        SentencesAction.changeActive data.activeId
        EditorAction.changeActive data.activeId
