React = require 'react'
$ = React.createElement

flux = require 'flux'
Dispatcher = new flux.Dispatcher()

fluxUtils = require 'flux/utils'
ReduceStore = fluxUtils.ReduceStore
Container = fluxUtils.Container

Immutable = require 'immutable-store'
marked = require 'marked'

_ = require 'underscore'

Promise = require 'bluebird'

module.exports =
  React: React
  $: $
  Dispatcher: Dispatcher
  ReduceStore: ReduceStore
  Immutable: Immutable
  Container: Container
  marked: marked
  _: _
  Promise: Promise
