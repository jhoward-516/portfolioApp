simplemde = null
$(document).on 'turbolinks:before-visit', ->
  if simplemde?
    simplemde.toTextArea()
    simplemde = null