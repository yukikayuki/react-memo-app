{Dispatcher, ReduceStore, Immutable} = require 'vendor'

class EditorStore extends ReduceStore
  getInitialState: ->
    Immutable
      value: ''

  reduce: (state, action) ->
    state.set 'value', action.value


module.exports = new EditorStore Dispatcher
