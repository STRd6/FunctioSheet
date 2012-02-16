#= require ./_base

namespace "Functio.Views", (Views) ->
  class Views.Table extends Views.Base
    tagName: "table"

    defaultTitle: "Unnamed Table"

    initialize: =>
      super

      @headerFields = null

      @functioFields =
        dog_age: ->
          @age * 7

    render: =>
      # TODO: Update this to use per row view caching
      @el.empty()

      tbody = $ "<tbody>"

      @collection.each (row) =>
        tableRow = $ "<tr>"

        attributes = row.attributes
        @headerFields ||= Object.keys attributes

        @headerFields.each (field) ->
          tableRow.append $ '<td>', text: attributes[field]

        for key, fn of @functioFields
          tableRow.append $ '<td>', text: fn.call(attributes)

        tbody.append tableRow

      if @headerFields
        thead = $ "<thead>"

        headerRow = $ "<tr>"

        titleRow = $ "<tr>"
        titleRow.append $ '<th>', text: @collection.title || @defaultTitle, colspan: 255

        thead.append titleRow

        @headerFields.each (field) ->
          headerRow.append $ '<th>', text: field

        for key, fn of @functioFields
          headerRow.append $ '<th>', text: key

        thead.append headerRow

        @el.append(thead)

      @el.append(tbody)

      return this
