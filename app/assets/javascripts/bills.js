$(document).ready(function () {
  $('#bill_due_date').datepicker();
  // When the entity is changed we need to update relevant info
  $("#bill_entity_id").focusout(function () {
    console.log($("#bill_entity_id").find(":selected").text());
    // This needs to use the entity info to populate the exemption selects.  This should set a global value and then run the update check for select fields
    // Or this should post an ajax request with the new entity_id, the view would run whats below
    $('[id$=user_id]'); // Relevant select fields, inject new select data
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
