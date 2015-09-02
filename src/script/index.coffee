{React, $, Container} = require 'vendor'

Editor = require './components/editor/index.coffee'
EditorAction = require './contexts/editor/action.coffee'
EditorStore = require './contexts/editor/store.coffee'

change = (value) ->
  EditorAction.change(value)

class App extends React.Component
  @getStores: ->
    [EditorStore]

  @calculateState: (prevState) ->
    editor: EditorStore.getState()

  render: ->
    $ Editor, {change: change, value: @state.editor.value}

appContainer =  Container.create App

window.addEventListener 'load', ->
  React.render(
      $ appContainer
      document.getElementById('app')
  )

