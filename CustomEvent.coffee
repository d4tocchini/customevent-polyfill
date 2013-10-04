CustomEvent = (event, params) ->
  params = params or
    bubbles: false
    cancelable: false
    detail: `undefined`

  evt = document.createEvent "CustomEvent"
  evt.initCustomEvent event, params.bubbles, params.cancelable, params.detail
  evt
CustomEvent:: = window.Event::
window.CustomEvent = CustomEvent