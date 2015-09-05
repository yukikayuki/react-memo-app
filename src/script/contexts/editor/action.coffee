{Dispatcher, _} = require 'vendor'

SentencesStore = require '../sentences/store.coffee'

keys =
  inputText: 'EditorAction:inputText'
  changeActive: 'EditorAction:changeActive'
  cleanUp: 'EditorAction:cleanUp'

module.exports = class EditorAction
  @change: (text) ->
    Dispatcher.dispatch type: keys.inputText, text: text

  @changeActive: (sentenceId) ->
    sentences = SentencesStore.getState().sentences
    s = _.findWhere sentences, {id: sentenceId}

    Dispatcher.dispatch type: keys.changeActive, sentences: s

  @cleanUp: ->
    Dispatcher.dispatch type: keys.cleanUp
