$(document).ready(function () {
  $("#bill_entity_id").focusout(function () {
    console.log($("#bill_entity_id").find(":selected").text());
    $("#selected_entity_users")
  });
});
