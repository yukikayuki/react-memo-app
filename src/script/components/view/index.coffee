{React, marked} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/template.jade"

class View extends React.Component
  @propTypes:
    text: React.PropTypes.string

  render: ->
    md = marked @props.text.toString(), {sanitize: false}
    template md: md


module.exports = View
