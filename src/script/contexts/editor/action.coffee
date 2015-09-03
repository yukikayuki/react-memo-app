{Dispatcher} = require 'vendor'

keys =
  inputText: 'EditorAction:inputText'
  changeActive: 'EditorAction:changeActive'

module.exports = class EditorAction
  @change: (text) ->
    Dispatcher.dispatch type: keys.inputText, text: text

  @changeActive: (sentenceId) ->
    Dispatcher.dispatch type: keys.changeActive, id: sentenceId

