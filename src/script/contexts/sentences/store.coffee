{Dispatcher, ReduceStore, Immutable, Promise} = require 'vendor'

EditorAction = require '../editor/action.coffee'
SentencesAction = require './action.coffee'

class SentencesStore extends ReduceStore
  constructor: ->
    super
    def = [{id: 1, text: "# hello react + coffeescript + react-jade"}, {id: 2, text: "react"}, {id: 3, text: "coffee + react-jade"}]
    new Promise (resolve) ->
      setTimeout ->
        resolve()
      , 800
    .then () ->
      # 直接dispatchしていいのか悩む
      SentencesAction.init def
      EditorAction.changeActive def[0].id

  getInitialState: ->
    Immutable
      sentences: []

  reduce: (state, action) ->
    if action.type == 'SentencesAction:inputText'
      newSentences = state.sentences.map (s) ->
        if s.id == action.id
          id: action.id
          text: action.text
        else
          s

      state.set 'sentences', newSentences

    else if action.type == 'SentencesAction:init'
      state.set 'sentences', action.sentences

    else if action.type == 'SentencesAction:add'
      s = state.sentences.map (_s) ->
        _s

      state.set 'sentences', s.concat action.sentence

    else
      state


module.exports = new SentencesStore Dispatcher
