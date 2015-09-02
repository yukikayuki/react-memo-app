{React} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/sentence.jade"

class Sentence extends React.Component
  render: ->
    template text: @props.text

module.exports = Sentence
