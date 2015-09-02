{Dispatcher} = require 'vendor'

keys =
  inputText: 'EditorAction:inputText'


module.exports = class EditorAction
  @change: (value) ->
    Dispatcher.dispatch type: keys.inputText, value: value
