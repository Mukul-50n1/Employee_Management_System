import $ from 'jquery'
import Rails from "@rails/ujs"

$(function(){
  $('#delete_button').click(function(){
    var index_array = [];
    $(':checkbox:checked').each(function(i){
      index_array[i] = $(this).val();
    });
    if (index_array.length == '0'){
      alert('plz select  some record !')
    }else{
      console.log(index_array)
      if(confirm('You are removing employees record ?')){
        $.ajax({
          url: "/employees/employeesDestroy",
          type: "DELETE", 
          dataType: "script",
          data: {"index_array": index_array}
          // success: function(repsonse){...},
          // error: function(repsonse){...}
        });
      }
    }
  });
});


$(function(){
  $('#designations').change(function(){
    var f = $("#designations").val();
    var token = $('meta[name=csrf-token]').attr('first_name')
    $.ajax({
          url: "/employees/",
          type: "GET", 
          dataType: "script",
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token',token)},
          data: {"designate": f}
          // success: function(repsonse){...},
          // error: function(repsonse){...}           
    });
  })
})