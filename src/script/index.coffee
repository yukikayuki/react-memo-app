{React, $, Container} = require 'vendor'
jade = require 'react-jade'

Editor = require './components/editor/index.coffee'
EditorAction = require './contexts/editor/action.coffee'
EditorStore = require './contexts/editor/store.coffee'
View = require './components/view/index.coffee'
Sentences = require './components/sentences/index.coffee'
SentencesAction = require './contexts/sentences/action.coffee'
SentencesStore = require './contexts/sentences/store.coffee'

# TODO こいつらの管理方法を考える
change = (sentence) ->
  EditorAction.change sentence.value
  SentencesAction.change sentence.id, sentence.value

template = jade.compileFile "#{__dirname}/template.jade"

class App extends React.Component
  @getStores: ->
    [EditorStore, SentencesStore]

  @calculateState: (prevState) ->
    editor: EditorStore.getState()
    sentences: SentencesStore.getState()

  render: ->
    editor = $ Editor, {change: change, id : @state.editor.id, value: @state.editor.value}
    view = $ View, {value: @state.editor.value}
    sentences = $ Sentences, {sentences: @state.sentences.sentences}

    template editor: editor, view: view, sentences: sentences

appContainer =  Container.create App

window.addEventListener 'load', ->
  React.render(
      $ appContainer
      document.getElementById('app')
  )

