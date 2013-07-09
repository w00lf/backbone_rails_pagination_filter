class Dummy2.Views.PaginatedView extends Backbone.View
  events: 
    'click a.servernext': 'nextResultPage',
    'click a.serverprevious': 'previousResultPage',
    'click a.orderUpdate': 'updateSortBy',
    'click a.serverlast': 'gotoLast',
    'click a.page': 'gotoPage',
    'click a.serverfirst': 'gotoFirst',
    'click a.serverpage': 'gotoPage',
    'click .serverhowmany a': 'changeCount'

  tagName: 'aside'

  el: '#pagination'

  template: JST["backbone/templates/pagination"]

  initialize: ->
    console.log('fooo')
    @collection.on('reset', @render, this)
    @collection.on('sync', @render, this)
    @render()

  render: ->
    console.log('render')
    console.log(@collection.info())
    html = @template(@collection.info())
    @$el.html(html)

  updateSortBy: (e) ->
    e.preventDefault();
    currentSort = $('#sortByField').val()
    @collection.updateOrder(currentSort)

  nextResultPage: (e) ->
    e.preventDefault()
    @collection.requestNextPage()

  previousResultPage: (e) ->
    e.preventDefault()
    @collection.requestPreviousPage()

  gotoFirst: (e) ->
    e.preventDefault()
    @collection.goTo(@collection.information.firstPage)

  gotoLast: (e) ->
    e.preventDefault()
    @collection.goTo(@collection.information.lastPage)

  gotoPage: (e) ->
    e.preventDefault()
    page = $(e.target).text()
    @collection.goTo(page)

  changeCount: (e) ->
    e.preventDefault()
    per = $(e.target).text()
    @collection.howManyPer(per)
