{React, $} = require 'vendor'
jade = require 'react-jade'

Sentence = require './sentence.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

class Sentences extends React.Component
  @propTypes:
    activeId: React.PropTypes.string
    sentences: React.PropTypes.array

  render: ->
    sentences = @props.sentences.map (s) =>
      isActive = @props.activeId == s.id
      $ Sentence, {text: s.text, id: s.id, isActive: isActive}

    template sentences: sentences

module.exports = Sentences
