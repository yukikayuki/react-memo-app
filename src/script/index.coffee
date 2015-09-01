{React, $} = require 'vendor'

Editor = require './editor/index.coffee'

window.addEventListener 'load', ->
  React.render(
      $(Editor)
      document.getElementById('app')
  )
