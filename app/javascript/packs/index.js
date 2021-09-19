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
          url: "/employees/employees_destroy",
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
    var search = $("#searchbox").val();
    $.ajax({
          url: "/employees/",
          type: "GET", 
          dataType: "script",
         
          data: {"designate": f , "search": search}
          // success: function(repsonse){...},
          // error: function(repsonse){...}           
    });
  })
})

$(document).ready(function(){
  $('#searchbutton').click(function(){
    var designate = $("#designations").val();
    var search = $("#searchbox").val();
    $.ajax({
          url: "/employees/",
          type: "GET", 
          dataType: "script",
         data: {"designate": designate , "search": search}                 
    });
  })
})


