ready = -> 
  $('.new_book').bind 'ajax:success', (e, data, status, xhr) -> 
    alert('Book added!!!') 
  
$(document).ready(ready) || $(document).on('page:load', ready) || $(document).on('page:update', ready)

