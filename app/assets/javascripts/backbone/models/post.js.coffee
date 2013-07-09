class Dummy2.Models.Post extends Backbone.Model
  paramRoot: 'post'

  loadComments: ->
    @features = new Dummy2.Collections.CommentsCollection([], {post_url: @url()});

  get_foo: ->      
    console.log(@url())
    console.log(@.get('id'))
    return (this.sync || Backbone.sync).call @, null, @, url: "#{@url()}/get_foo"


class Dummy2.Collections.PostsCollection extends Backbone.Paginator.requestPager
  model: Dummy2.Models.Post
  url: '/posts'

  paginator_core: 
    type: 'GET'
    dataType: 'json' 
    url: '/posts'

  paginator_ui: 
    firstPage: 1
    currentPage: 1
    perPage: 3
    totalPages: 10

  server_api: 
    'per_page': ->
      @perPage 

    'page':  -> 
      @currentPage

    'sort':  -> 
      if(this.sortField == undefined)
        return 'created'
      @sortField
    'callback': '?'
    'format': 'json'
    
  parse: (response) -> 
    @totalRecords = @totalPages * @perPage;
    response.data;

  search: (word) ->
    self = @
    (this.sync || Backbone.sync).call @, 'post', @, url: "#{@url}/search?word=#{word}", success: (data) ->
      console.log('rerender')
      self.reset(data)
      @collection.trigger('reset')

  order: (order) ->
    self = @
    @fetch({ data: $.param({ order: order }) })

