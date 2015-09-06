{Dispatcher, ReduceStore, Immutable, _} = require 'vendor'

class SentencesStore extends ReduceStore
  getInitialState: ->
    Immutable
      sentences: []
      activeId: '0'
      activeText: ''

  reduce: (state, action) ->
    if action.type == 'SentencesAction:change'
      newSentences = state.sentences.map (s) ->
        if s.id == action.id
          id: action.id
          text: action.text
        else
          s

      state.set('sentences', newSentences)
      .set('activeText', action.text)

    else if action.type == 'SentencesAction:reset'
      state.set 'sentences', action.sentences

    else if action.type == 'SentencesAction:add'
      newId = _.uniqueId(new Date().getTime())

      s = state.sentences.map (_s) ->
        _s

      Immutable
        sentences: s.concat(id: newId, text: '')
        activeId: newId
        activeText: ''

    else if action.type == 'SentencesAction:changeActive'
      state.set('activeId', action.sentences.id)
      .set('activeText', action.sentences.text)

    else if action.type == 'SentencesAction:remove'
      s = _.reject state.sentences, (s) ->
        s.id == action.id

      Immutable
        sentences: s
        activeId: '0'
        activeText: ''

    else
      state

  getSentence: (id) ->
    sentences = @getState().sentences
    _.findWhere sentences, {id: id}


module.exports = new SentencesStore Dispatcher
