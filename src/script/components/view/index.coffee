{React, marked} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/template.jade"

class View extends React.Component
  constructor: (props) ->
    @props = props

  render: ->
    md = marked @props.text.toString(), {sanitize: false}
    template md: md


module.exports = View
