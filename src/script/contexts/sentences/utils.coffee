{Promise} = require 'vendor'

info =
  activeId: '1'
  sentences: [
    {id: '1', text: "# Hello \n- React\n- CoffeeScript\n- react-jade"}
    {id: '2', text: "React"}
    {id: '3', text: "CoffeeScript + react-jade"}
  ]

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
