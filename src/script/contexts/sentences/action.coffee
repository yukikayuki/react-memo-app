{Dispatcher, Promise} = require 'vendor'

keys =
  addSentence: 'SentencesAction:inputText'
  reset: 'SentencesAction:reset'
  add: 'SentencesAction:add'
  changeActive: 'SentencesAction:changeActive'

# TODO action keyの管理方法を考える
module.exports.actionKeys = keys
module.exports = class SentencesAction
  @change: (id, text) ->
    Dispatcher.dispatch type: keys.addSentence, id: id, text: text

  @reset: (sentences) ->
    Dispatcher.dispatch type: keys.reset, sentences: sentences

  @add: (sentence) ->
    Dispatcher.dispatch type: keys.add, sentence: sentence

  @changeActive: (id) ->
    Dispatcher.dispatch type: keys.changeActive, id: id

