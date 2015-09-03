{Dispatcher, ReduceStore, Immutable} = require 'vendor'

class SentencesStore extends ReduceStore
  getInitialState: ->
    Immutable
      sentences: [{id: 1, text: "aa"}, {id: 2, text: "bb"}, {id: 3, text: "cc"}]

  reduce: (state, action) ->

    if action.type == 'SentencesAction:inputText'
      newSentences = state.sentences.map (s) ->
        if s.id == action.id
          id: action.id
          text: action.value
        else
          s

      state.set 'sentences', newSentences
    else
      state


module.exports = new SentencesStore Dispatcher
