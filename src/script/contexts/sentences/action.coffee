{Dispatcher, Promise} = require 'vendor'

dummy = [{id: 1, text: "# hello react + coffeescript + react-jade"}, {id: 2, text: "react"}, {id: 3, text: "coffee + react-jade"}]

EditorAction = require '../editor/action.coffee'

keys =
  addSentence: 'SentencesAction:inputText'
  reset: 'SentencesAction:reset'
  add: 'SentencesAction:add'

# TODO action keyの管理方法を考える
module.exports.actionKeys = keys
module.exports = class SentencesAction
  @fetch: ->
    new Promise (resolve) ->
      setTimeout ->
        resolve()
      , 800
    .then () ->
      SentencesAction.reset dummy
      EditorAction.changeActive dummy[0].id

  @change: (id, text) ->
    Dispatcher.dispatch type: keys.addSentence, id: id, text: text

  @reset: (sentences) ->
    Dispatcher.dispatch type: keys.reset, sentences: sentences

  @add: (sentence) ->
    Dispatcher.dispatch type: keys.add, sentence: sentence

