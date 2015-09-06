{Promise, _} = require 'vendor'

info =
  activeId: '1'
  sentences: [{id: '1', text: "# hello react + coffeescript + react-jade"}, {id: '2', text: "react"}, {id: '3', text: "coffee + react-jade"}]

ls = localStorage
module.exports = class SentencesUtils
  @fetch: ->
    new Promise (resolve) ->
      if ls.getItem('useLocalStorage')
        data = {}
        data.sentences = JSON.parse ls.getItem('sentences')
        data.activeId = JSON.parse ls.getItem 'activeId'
        resolve data

      else
        resolve info

  @save: (data) ->
    new Promise (resolve) ->
      ls.setItem 'useLocalStorage', 1
      ls.setItem 'sentences', JSON.stringify(data.sentences)
      ls.setItem 'activeId', JSON.stringify(data.activeId)
