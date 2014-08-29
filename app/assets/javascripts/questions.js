$(document).ready(function(){
  $("#question_answer_type").change(function(){
    var option = $("#question_answer_type").val();
    
    if (option == "T"){
      $("#rb_question").hide();
      $("#rb_question input").prop("disabled", true);
      $("#cb_question").hide();
      $("#cb_question input").prop("disabled", true);
    }
    else if (option == "C"){
      $("#rb_question").hide();
      $("#rb_question input").prop("disabled", true);
      $("#cb_question").show();
      $("#cb_question input").prop("disabled", false);
    }
    else if (option == "R"){
      $("#cb_question").hide();
      $("#cb_question input").prop("disabled", true);
      $("#rb_question").show();
      $("#rb_question input").prop("disabled", false);
    }
  }).trigger( "change" );

  $("input.radio_question").change(function() {
    $("input.radio_question").prop("checked", false);
    $(this).prop("checked", true);
  });

  $("#btn_create").click(function(){
    var level_id = $("#level_id").val();
    var subject_id = $("#subject_id").val();
    window.location = "/admin/questions/new?subject_id=" + subject_id + 
      "&level_id=" + level_id;
  });
}); 



