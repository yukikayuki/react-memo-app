{React} = require 'vendor'
jade = require 'react-jade'

EditorAction = require '../../contexts/editor/action.coffee'
SentencesAction = require '../../contexts/sentences/action.coffee'

template = jade.compileFile "#{__dirname}/sentence.jade"

class Sentence extends React.Component
  @propTypes:
    id: React.PropTypes.string
    isActive: React.PropTypes.bool

  onRemove: (e) ->
    e.stopPropagation()

    if confirm('文章を削除します')
      SentencesAction.remove @props.id
      EditorAction.cleanUp()

  onClick: ->
    EditorAction.changeActive @props.id
    SentencesAction.changeActive @props.id

  render: ->
    template
      text: @props.text
      isActive: @props.isActive
      onClick: @onClick.bind(this)
      onRemove: @onRemove.bind(this)

module.exports = Sentence
