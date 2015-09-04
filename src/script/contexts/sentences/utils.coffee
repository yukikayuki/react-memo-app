{Promise} = require 'vendor'

dummy = [{id: 1, text: "# hello react + coffeescript + react-jade"}, {id: 2, text: "react"}, {id: 3, text: "coffee + react-jade"}]

module.exports = class SentencesUtils
  @fetch: ->
    new Promise (resolve) ->
      setTimeout ->
        resolve(dummy)
      , 1000
