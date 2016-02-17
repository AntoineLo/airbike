//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-datepicker
//= require underscore
//= require gmaps/google
//= require_tree .

$(document).ready(function(){
  $('.datepick').datepicker({
      format: "dd/mm/yyyy",
      weekStart: 1,
      autoclose: true,
      todayHighlight: true
  });
});
