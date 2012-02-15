namespace "Functio.Views", (Views) ->
  class Views.Base extends Backbone.View
    initialize: ->
      # Force jQuery Element
      @el = $(@el)

    include: (module) ->
      Object.extend this, module(this, this)
