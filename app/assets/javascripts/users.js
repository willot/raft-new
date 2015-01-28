// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


$('document').ready(function(){
  $('#write_message').click(function(event){
    event.preventDefault();

    var urlMessageNew = $(this).attr('href')


    $.get(urlMessageNew, function(form){
      console.log('test')
      $('#jsform').append(form);
    });
  });

  $('body').on('submit', '#new_message',function(event){
    event.preventDefault();
    var urlpost = $(this).attr('action');
    var data=$(this).serialize();
    var container_form =$(this).closest('#new_message')

    $.post(urlpost, data, function(response){
      $('body').find('#title_label_message').html("")
    })

  })
})
