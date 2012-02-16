namespace "Functio.Models", (Models) ->
  class Models.Row extends Backbone.Model

  class Models.Table extends Backbone.Collection
    initialize: (options) ->
      Object.extend @, Functio.Collections.Composable

      @title = options.title
