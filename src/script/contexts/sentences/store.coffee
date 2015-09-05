{Dispatcher, ReduceStore, Immutable, _} = require 'vendor'

class SentencesStore extends ReduceStore
  getInitialState: ->
    Immutable
      sentences: []
      activeId: 0

  reduce: (state, action) ->
    if action.type == 'SentencesAction:inputText'
      newSentences = state.sentences.map (s) ->
        if s.id == action.id
          id: action.id
          text: action.text
        else
          s

      state.set 'sentences', newSentences

    else if action.type == 'SentencesAction:reset'
      state.set 'sentences', action.sentences

    else if action.type == 'SentencesAction:add'
      s = state.sentences.map (_s) ->
        _s

      state.set 'sentences', s.concat(action.sentence)

    else if action.type == 'SentencesAction:changeActive'
      state.set 'activeId', action.id

    else if action.type == 'SentencesAction:remove'
      s = _.reject state.sentences, (s) ->
        s.id == action.id

      state.set 'sentences', s

    else
      state


module.exports = new SentencesStore Dispatcher
