{Dispatcher} = require 'vendor'

keys =
  addSentence: 'SentencesAction:inputText'

# TODO action keyの管理方法を考える
module.exports.actionKeys = keys
module.exports = class SentencesAction
  @change: (id, value) ->
    Dispatcher.dispatch type: keys.addSentence, id: id, value: value
