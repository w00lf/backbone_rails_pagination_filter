class Dummy2.Views.PostsIndexView extends Backbone.View

  el: '#posts'

  template: JST["backbone/templates/posts/index"]

  events:
    "keyup #search input" : "search_posts"
    "change #order select" : "reorder_posts"

  initialize: ->
    console.log(@collection)
    @render()
    @collection.on('reset', @addAll, @);
    @collection.fetch
      success: ->
        tags.pager()
      silent:true

  addAll: ->
    @collection.forEach(@addOne, @)

  addOne: (model) ->
    @view = new Dummy2.Views.PostView({model: model})
    @$el.find('tbody').append @view.render().el

  pagination: ->
    view = new Dummy2.Views.PaginatedView({ collection : @collection })

  reorder_posts: (e) ->
    order = $(e.target).val()
    @collection.order(order)
    @$el.find('tbody tr').remove()
    @addAll()

  rerenderAll: ->
    @$el.find('tbody tr').remove()
    @addAll()
  
  search_posts: (e) ->
    word = $(e.target).val()
    @collection.search(word)

  render: ->
    console.log('rerender posts')
    console.log(@collection)
    @$el.html @template()
    @addAll()
    @pagination()
    @