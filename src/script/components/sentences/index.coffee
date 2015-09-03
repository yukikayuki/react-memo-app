{React, $} = require 'vendor'
jade = require 'react-jade'

Sentence = require './sentence.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

class Sentences extends React.Component
  render: ->
    sentences = @props.sentences.map (s) ->
      $ Sentence, {text: s.text, id: s.id}

    template sentences: sentences

module.exports = Sentences
