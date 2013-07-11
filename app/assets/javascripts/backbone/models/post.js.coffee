class Dummy2.Models.Post extends Backbone.Model
  paramRoot: 'post'

  loadComments: ->
    @features = new Dummy2.Collections.CommentsCollection([], {post_url: @url()});

  get_foo: ->      
    console.log(@url())
    console.log(@.get('id'))
    return (this.sync || Backbone.sync).call @, null, @, url: "#{@url()}/get_foo"


class Dummy2.Collections.PostsCollection extends Backbone.Collection
  model: Dummy2.Models.Post

  url: '/posts'

  query: ''

  per_page: 5

  page_active: 1

  order: ''

  initialize: (collection) ->
    @total_entries = collection.length

  fetch_w_params: (reload) ->
    if(reload) 
      page = 1
    @fetch({ data: { 
                    order: @order,
                    query: @query,
                    per_page: @per_page,
                    page: @page_active
                    } })

  parse: (response) ->
    @total_entries = response.total_entries
    response.results

