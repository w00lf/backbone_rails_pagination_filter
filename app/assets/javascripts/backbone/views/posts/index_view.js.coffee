class Dummy2.Views.PostsIndexView extends Backbone.View

  el: '#posts'

  template: JST["backbone/templates/posts/index"]

  events:
    "keyup #search input" : "search_posts"
    "change #order select" : "reorder_posts"

  initialize: ->
    @render()
    @collection.on('reset', @rerender, @);

  addAll: ->
    @$el.find('tbody tr').remove()
    @collection.forEach(@addOne, @)

  addOne: (model) ->
    @view = new Dummy2.Views.PostView({model: model})
    @$el.find('tbody').append @view.render().el

  reorder_posts: (e) ->
    order = $(e.target).val()
    @collection.order = order
    @collection.fetch_w_params(true)
  
  search_posts: (e) ->
    word = $(e.target).val()
    @collection.query = word
    @collection.fetch_w_params(true)

  rerender: ->
    @addAll()

  render: ->
    @$el.html @template()
    @addAll()
    @