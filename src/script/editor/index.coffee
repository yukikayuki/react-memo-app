{React} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/template.jade"

class Editor extends React.Component
  render: ->
    template()

module.exports = Editor
