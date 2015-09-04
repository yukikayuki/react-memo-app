{React, $, Container} = require 'vendor'
jade = require 'react-jade'

Editor = require './components/editor/index.coffee'
View = require './components/view/index.coffee'
Sentences = require './components/sentences/index.coffee'
SentencesControl = require './components/sentences_control/index.coffee'

EditorStore = require './contexts/editor/store.coffee'
SentencesStore = require './contexts/sentences/store.coffee'

require('./initialize.coffee').initializeState()

template = jade.compileFile "#{__dirname}/template.jade"

class App extends React.Component
  @getStores: ->
    [EditorStore, SentencesStore]

  @calculateState: (prevState) ->
    editor: EditorStore.getState()
    sentences: SentencesStore.getState()

  render: ->
    editor = $ Editor, {id : @state.editor.id, text: @state.editor.text}
    view = $ View, {text: @state.editor.text}
    sentences = $ Sentences, {sentences: @state.sentences.sentences, activeId: @state.sentences.activeId}
    sentencesControl = $ SentencesControl

    template editor: editor, view: view, sentences: sentences, sentencesControl: sentencesControl

appContainer =  Container.create App

window.addEventListener 'load', ->
  React.render(
      $ appContainer
      document.getElementById('app')
  )

