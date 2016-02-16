//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .
//= require bootstrap-datepicker

$(document).ready(function(){
  $('.datepick').datepicker({
      format: "dd/mm/yyyy",
      weekStart: 1,
      autoclose: true,
      todayHighlight: true
  });
});
