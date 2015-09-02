{React, $, Container} = require 'vendor'
jade = require 'react-jade'

Editor = require './components/editor/index.coffee'
EditorAction = require './contexts/editor/action.coffee'
EditorStore = require './contexts/editor/store.coffee'
View = require './components/view/index.coffee'
Sentences = require './components/sentences/index.coffee'

change = (value) ->
  console.info 'fire change event from editor'
  EditorAction.change(value)

template = jade.compileFile "#{__dirname}/template.jade"

sentencesData = [{text: "aa"}, {text: "bb"}, {text: "cc"}]

class App extends React.Component
  @getStores: ->
    [EditorStore]

  @calculateState: (prevState) ->
    editor: EditorStore.getState()

  render: ->
    editor = $ Editor, {change: change, value: @state.editor.value}
    view = $ View, {value: @state.editor.value}
    sentences = $ Sentences, {sentences: sentencesData}

    template editor: editor, view: view, sentences: sentences

appContainer =  Container.create App

window.addEventListener 'load', ->
  React.render(
      $ appContainer
      document.getElementById('app')
  )

