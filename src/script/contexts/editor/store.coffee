{Dispatcher, ReduceStore, Immutable} = require 'vendor'

class EditorStore extends ReduceStore
  getInitialState: ->
    Immutable
      id: '0'
      text: ''

  reduce: (state, action) ->
    if action.type == 'EditorAction:inputText'
      state.set 'text', action.text

    else if action.type == 'EditorAction:changeActive'
      Immutable
        id: action.sentences.id
        text: action.sentences.text

    else if action.type == 'EditorAction:cleanUp'
      @getInitialState()

    else
      state


module.exports = new EditorStore Dispatcher
