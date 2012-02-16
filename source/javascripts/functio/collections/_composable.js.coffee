namespace "Functio.Collections", (Collections) ->
  Collections.Composable =
    composed: (compositionFunction) ->
      sourceCollection = this
      composedCollection = new sourceCollection.constructor [], {}

      applyFuction = ->
        composedCollection.reset(compositionFunction.call(sourceCollection, sourceCollection))

      sourceCollection.bind("change", applyFuction)
      sourceCollection.bind("add", applyFuction)
      sourceCollection.bind("remove", applyFuction)

      applyFuction()

      return composedCollection
