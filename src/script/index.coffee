{React, $, Container} = require 'vendor'
jade = require 'react-jade'

Editor = require './components/editor/index.coffee'
EditorAction = require './contexts/editor/action.coffee'
EditorStore = require './contexts/editor/store.coffee'
View = require './components/view/index.coffee'
Sentences = require './components/sentences/index.coffee'
SentencesAction = require './contexts/sentences/action.coffee'
SentencesStore = require './contexts/sentences/store.coffee'
SentencesControl = require './components/sentences_control/index.coffee'
SentencesUtils = require './contexts/sentences/utils.coffee'

# 初期化
SentencesAction.fetch()


# TODO こいつらの管理方法を考える
change = (sentence) ->
  EditorAction.change sentence.text
  SentencesAction.change sentence.id, sentence.text

template = jade.compileFile "#{__dirname}/template.jade"

class App extends React.Component
  @getStores: ->
    [EditorStore, SentencesStore]

  @calculateState: (prevState) ->
    editor: EditorStore.getState()
    sentences: SentencesStore.getState()

  render: ->
    editor = $ Editor, {change: change, id : @state.editor.id, text: @state.editor.text}
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

