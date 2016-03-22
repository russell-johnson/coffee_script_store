$(document).ready ->
  baseUrl = 'http://devpoint-ajax-example-server.herokuapp.com/api/v1'
  $.ajax
    url: "#{baseUrl}/products"
    type: 'GET'
    success: (data) ->
      for product in data.products
        $.ajax
          url: '/product_card'
          type: 'GET'
          data:
            product: product
          success: (data) ->
            $('#products').append data
          error: (data) ->
            console.log data
    error: (data) ->
      console.log data


  $(document).on 'click', '.show', (e) ->
    e.preventDefault()
    id = $(this).data('id')
    $.ajax
      url: "#{baseUrl}/products/#{id}"
      type: 'GET'
      success: (data) ->
        $.ajax
          url: '/product_detail'
          type: 'GET'
          data:
            product: data.product
          success: (data) ->
            $('#products').empty()
            $('#products').append data
          error: (data) ->
      error: (data) ->
        console.log('error')

  $(document).on 'click', '.delete', (e) ->
    e.preventDefault()
    id = $(this).data('id')
    $.ajax
      url: "#{baseUrl}/products/#{id}"
      type: 'DELETE'
      success: (data) ->
        console.log('success')
      error: (data) ->
        console.log('error')
