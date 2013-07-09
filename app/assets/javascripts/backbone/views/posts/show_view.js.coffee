class Dummy2.Views.PostsShowView extends Backbone.View

  template: JST["backbone/templates/posts/show"]

  el: '#posts'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @