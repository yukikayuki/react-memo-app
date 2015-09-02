{React, $} = require 'vendor'

Editor = require './components/editor/index.coffee'

window.addEventListener 'load', ->
  React.render(
      $(Editor)
      document.getElementById('app')
  )

