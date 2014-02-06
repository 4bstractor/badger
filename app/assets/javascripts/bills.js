$(document).ready(function () {
  $('#bill_due_date').datepicker();
  $("#bill_entity_id").focusout(function () {
    console.log($("#bill_entity_id").find(":selected").text());
    $("#selected_entity_users");
  });
});

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
  $('[id$=expiration_date]').datepicker();
}

$.datepicker.setDefaults({dateFormat: 'yy-mm-dd'});
