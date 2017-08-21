simplemde = null
$(document).on 'turbolinks:before-visit', ->
  if simplemde?
    simplemde.toTextArea()
    simplemde = null

$(document).on 'turbolinks:load', ->
  simplemde = new SimpleMDE({
    autofocus: true,
    element: $('.blog-mde')[0],
    hideIcons: ["preview", "side-by-side", "fullscreen"],
    status: false,
    
    })
