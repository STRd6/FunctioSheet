#= require lib/namespace

#= require lib/underscore-1.3.1
#= require lib/backbone-0.9.1
#= require lib/jquery-1.7.1
#= require lib/coffee-script-1.3.1

namespace "Functio.Models", (Models) ->
  class Models.Row extends Backbone.Model

  class Models.Table extends Backbone.Collection
