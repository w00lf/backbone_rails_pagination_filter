class Dummy2.Views.PostsEditView extends Backbone.View

  template: JST["backbone/templates/posts/edit"]

  el: '#posts'

  events:
    "submit #edit-post" : "update"

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    @

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()
    title = $('#title').val()
    content = $('#content').val()
    @model.save({title: title, content: content},
                success: (post) =>
                    @model = post
                    window.location.hash = "/#{@model.id}")