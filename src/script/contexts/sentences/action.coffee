{Dispatcher, Promise} = require 'vendor'

SentencesStore = require './store.coffee'
SentencesUtils = require './utils.coffee'
SentencesKeys = require './keys.coffee'

module.exports = class SentencesAction
  @change: (id, text) ->
    Dispatcher.dispatch type: SentencesKeys.change, id: id, text: text

  @reset: (sentences) ->
    Dispatcher.dispatch type: SentencesKeys.reset, sentences: sentences

  @add: ->
    Dispatcher.dispatch type: SentencesKeys.add

  @changeActive: (id) ->
    s = SentencesStore.getSentence id
    Dispatcher.dispatch type: SentencesKeys.changeActive, sentences: s

  @remove: (id) ->
    Dispatcher.dispatch type: SentencesKeys.remove, id: id

  @save: ->
    data = SentencesStore.getState()
    SentencesUtils.save data

