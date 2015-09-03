{Dispatcher} = require 'vendor'

keys =
  inputText: 'EditorAction:inputText'
  changeActive: 'EditorAction:changeActive'

module.exports = class EditorAction
  @change: (value) ->
    Dispatcher.dispatch type: keys.inputText, value: value

  @changeActive: (sentence) ->
    Dispatcher.dispatch type: keys.changeActive, id: sentence.id, value: sentence.value

