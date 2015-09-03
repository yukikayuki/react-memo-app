{Dispatcher, ReduceStore, Immutable} = require 'vendor'

class EditorStore extends ReduceStore
  getInitialState: ->
    Immutable
      value: ''
      id: 1

  reduce: (state, action) ->
    if action.type == 'EditorAction:inputText'
      state.set 'value', action.value

    else if action.type == 'EditorAction:changeActive'
      Immutable
        value: action.value
        id: action.id
    else
      state


module.exports = new EditorStore Dispatcher
