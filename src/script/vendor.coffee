React = require 'react'
$ = React.createElement

flux = require 'flux'
Dispatcher = new flux.Dispatcher()

fluxUtils = require 'flux/utils'
ReduceStore = fluxUtils.ReduceStore
Container = fluxUtils.Container

Immutable = require 'immutable-store'


module.exports =
  React: React
  $: $
  Dispatcher: Dispatcher
  ReduceStore: ReduceStore
  Immutable: Immutable
  Container: Container
