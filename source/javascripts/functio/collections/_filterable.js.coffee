namespace "Functio.Collections", (Collections) ->
  Collections.Filterable =
    filtered: (criteriaFunction) ->
      sourceCollection = this
      filteredCollection = new sourceCollection.constructor

      applyFilter = ->
        filteredCollection.reset(sourceCollection.select(criteriaFunction));

      sourceCollection.bind("change", applyFilter);
      sourceCollection.bind("add", applyFilter);
      sourceCollection.bind("remove", applyFilter);

      applyFilter()

      return filteredCollection
