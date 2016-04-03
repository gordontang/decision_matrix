// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('a#add-another').click(function() {
    $('#alternative-list li:first').clone().find('input').val('')
    .end().appendTo('#alternative-list');
  });

  $('.delete-alternative').live('click', function() {
    if ($('#alternative-list li').length > 1)
  $(this).parent().remove();
    else
  alert('You need at least one alternative.')
  });
});