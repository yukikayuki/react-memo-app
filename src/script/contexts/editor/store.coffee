{Dispatcher, ReduceStore, Immutable, _} = require 'vendor'

SentenceStore = require '../sentences/store.coffee'

class EditorStore extends ReduceStore
  getInitialState: ->
    Immutable
      text: ''
      id: 1

  reduce: (state, action) ->
    if action.type == 'EditorAction:inputText'
      state.set 'text', action.text

    else if action.type == 'EditorAction:changeActive'
      sentences = SentenceStore.getState().sentences
      s = _.findWhere sentences, {id: action.id}

      Immutable
        text: s.text
        id: s.id

    else
      state


module.exports = new EditorStore Dispatcher
