jQuery.noConflict();

  // public/javascripts/application.js
  jQuery(document).ready(function($) {
    $('a#add_tag').bind("ajax:success", function (data, status, xhr) {
      $('#tags').append(xhr.responseText);
    });
    
    $('a[data-json-update]').live('click', function () {
      var url = $(this).attr('href');
      $.ajax({
        url: url,
        dataType: "json",
        type: "GET",
        success: function (data, status, xhr) {
          $.each(data, function (id, value) {
            $('#' + id).html(value);
          });
        }
      });

      return false;
    });
    
  });


  
  
  
