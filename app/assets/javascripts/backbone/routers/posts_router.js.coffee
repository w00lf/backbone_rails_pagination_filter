class Dummy2.Routers.PostsRouter extends Backbone.Router

  initialize: (options) ->
    @posts = new Dummy2.Collections.PostsCollection(options.posts)

  routes:
    "index"       : "index"
    "new"         : "newPost"
    ":id"         : "show"
    ":id/edit"    : "edit"
    ".*"          : "index"

  index: ->
    @view = new Dummy2.Views.PostsIndexView({ collection: @posts })
    @paginatorView = new Dummy2.Views.PaginatedView({ collection : @posts })

  newPost: ->
    @view = new Dummy2.Views.PostsNewView({collection: @posts})

  show: (id) ->
    post = @posts.get(id)
    @view = new Dummy2.Views.PostsShowView({model: post})

  edit: (id) ->
    post = @posts.get(id)
    @view = new Dummy2.Views.PostsEditView({model: post})