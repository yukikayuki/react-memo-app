{Dispatcher, ReduceStore, Immutable} = require 'vendor'

class EditorStore extends ReduceStore
  getInitialState: ->
    Immutable
      text: ''
      id: 1

  reduce: (state, action) ->
    if action.type == 'EditorAction:inputText'
      state.set 'text', action.text

    else if action.type == 'EditorAction:changeActive'
      Immutable
        text: action.text
        id: action.id
    else
      state


module.exports = new EditorStore Dispatcher
