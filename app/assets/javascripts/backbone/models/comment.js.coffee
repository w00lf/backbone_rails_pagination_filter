class Dummy2.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  defaults:
    title: null

class Dummy2.Collections.CommentsCollection extends Backbone.Collection
  model: Dummy2.Models.Comment
  initialize: (model, args) ->
    @url = ->
      args.post_url + "/features"