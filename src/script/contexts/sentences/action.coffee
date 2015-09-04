{Dispatcher} = require 'vendor'

keys =
  addSentence: 'SentencesAction:inputText'
  init: 'SentencesAction:init'
  add: 'SentencesAction:add'

# TODO action keyの管理方法を考える
module.exports.actionKeys = keys
module.exports = class SentencesAction
  @change: (id, text) ->
    Dispatcher.dispatch type: keys.addSentence, id: id, text: text

  @init: (sentences) ->
    Dispatcher.dispatch type: keys.init, sentences: sentences

  @add: (sentence) ->
    Dispatcher.dispatch type: keys.add, sentence: sentence

