
$(function(){
 $("#employee_addresses_attributes_0_chek").on('change', function(){
   if ($('#employee_addresses_attributes_0_chek').is(':checked')){  
     $('#one1').hide() };
    if (!$("#employee_addresses_attributes_0_chek").is(":checked")) {
    // do something if the checkbox is NOT checked
    $('#one1').show() ;
}
 });
});

// $(function(){
//   $(document).on('load',function(){
//     var d_id = $('#designation_ids').html();
//     $('#designation_ids').hide();
//   })
// })

$( document ).ready(function() {
  
    $('#designation_ids').hide();
});



$(function(){
 $('form').on('submit', function() {   
   var f = $("#employee_first_name").val();
   var l = $("#employee_last_name").val();
   var num = $("#employee_mobile").val();
   var mail = $("#employee_email").val();
   var did = $("#employee_designation_id").val();
   var d = parseInt(did)
   var e_valid = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
   if ((f == "") || (f.length > 15)) {
     $('#fspan').html("First name is required in less than 15 length")
     alert('name is required')
     return false
   }
   if (/^[A-Za-z\s]+$/.test(f)){
     $('#fspan').html("correct first name")
   }else {
     $('#fspan').html("plz dont write any  symbol and numbers(123)")
      alert("name  will not accept any whitespace'_' any symbol'@$'")
   }
   if (l == ""){
     $('#lspan').html("last name is required")
     alert('last name is required')
     return false
   }
   if (/^[A-Za-z]+$/.test(l)){
     $('#lspan').html("correct last name")
   }else {
     $('#lspan').html("plz dont write any symbol and any whitespace and numbers(123)")
      alert("last name  will not accept any whitespace'_' any symbol'@$'")
   }
   if ( (num.length != 10) || (num == "" )) {
     $('#mspan').html("mobile_number can  be in 10 number");
     alert('mobile is 10 digit like 4564655544')
     return false
   };
   
   if (/^[0-9]{1,10}$/.test(num)){
     $('#mspan').html("correct mobile number ")
   }else {
     $('#mspan').html("plz dont write any symbol and letter and whitespace ")
      alert("mobile  will  accept only 10 numbers")
   }
   if (mail == ""){
     $('#espan').html("email is required")
     alert('email is required')
     return false
   };
   if (e_valid.test(mail)){
     $('#espan').html("correct email address ")
   }else {
     $('#espan').html("Invalid Email")
     alert("plz write correct email like 'demo78@dummy.com'")
     return false
   }
   // if (did == ''){
   //   $('desispan').innerHTML = "please select correct designation"
   //   return false
   // }
    var d_id = $('#designation_ids').html();
    if (d_id.includes(d)){
      $('#desigspan').html("correct designation")
      
    }else{
      $('#desigspan').html("select correct designation")
      alert('wrong desination')
      return false
    }   
});
});





  


