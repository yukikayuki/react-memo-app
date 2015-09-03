{Dispatcher, _} = require 'vendor'

SentenceStore = require '../sentences/store.coffee'

keys =
  inputText: 'EditorAction:inputText'
  changeActive: 'EditorAction:changeActive'

module.exports = class EditorAction
  @change: (value) ->
    Dispatcher.dispatch type: keys.inputText, value: value

  @changeActive: (sentenceId) ->
    sentences = SentenceStore.getState().sentences
    s = _.findWhere sentences, {id: sentenceId}

    Dispatcher.dispatch type: keys.changeActive, id: s.id, value: s.text

