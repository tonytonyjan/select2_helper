$(document).on 'ready page:change', () ->
  jQuery.fn.extend
    select2_single: (params) ->
      this.each () ->
        if $(this).data('child-field') && child_field = $($(this).data('child-field'))
          $(this).on 'change', () ->
            record_id = this.value
            where_obj = {}
            where_obj[child_field.data('foreign-key')] = record_id
            child_field.select2_single
              ajax:
                data: (term, page) ->
                  term: term
                  page: page
                  where: where_obj
                  model: $(this).data('model')
                  column: $(this).data('column')
          .trigger('change')
      default_params =
        width: '100%'
        initSelection: (element, callback) ->
          callback
            id: element.val()
            text: element.data('init') || ''
        ajax:
          url: '/select2/results'
          dataType: 'json'
          data: (term, page) ->
            term: term
            page: page
            model: $(this).data('model')
            column: $(this).data('column')
          results: (data, page) -> data
      this.select2 $.extend(true, default_params, params)
    select2_multiple: (params) ->
      default_params =
        multiple: true
        width: '100%'
        initSelection: (element, callback) ->
          $(element).val('')
          callback $(element).data('init')
        ajax:
          url: '/select2/results'
          dataType: 'json'
          data: (term, page) ->
            term: term
            page: page
            model: $(this).data('model')
            column: $(this).data('column')
          results: (data, page) ->
            data
      this.select2 $.extend(true, default_params, params)
  $('.select2').select2
    width: '100%'
  $('.select2-single').select2_single()
  $('.select2-multiple').select2_multiple()
  $('.select2-tags-array').select2
    tags: []
    width: '100%'
    initSelection: (element, callback) ->
      $(element).val('')
      callback $(element).data('init').map (value) ->
        id: value, text: value
    createSearchChoice: (term) ->
      id: term, text: term
  $('.select2-tags').select2
    multiple: true
    width: '100%'
    initSelection: (element, callback) ->
      callback $.map(element.val().split(','), (value) -> id: value, text: value)
    createSearchChoice: (term) ->
      id: term, text: term
    ajax:
      url: '/select2/tags'
      dataType: 'json'
      data: (term, page) ->
        term: term
        page: page
        context: $(this).data('context')
      results: (data, page) -> data
  $('.select2-polymorphic').change (e) ->
    model_name = $(this).val()
    column_name = $(this).data('models')[model_name]
    target = $(this).data('target') || '#' + this.id.replace('_type', '_id')
    $(target).select2
      width: '100%'
      initSelection: (element, callback) ->
        callback
          id: element.val()
          text: element.data('text')
      ajax:
        url: '/select2/results'
        dataType: 'json'
        data: (term, page) ->
          term: term
          page: page
          model: model_name
          column: column_name
        results: (data, page) -> data
  $('.select2-polymorphic').trigger('change')