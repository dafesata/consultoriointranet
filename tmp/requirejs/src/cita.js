$(document).ready(function() {
   toggleSearchFields();
  var especialidad, profesional; 
  if ($('#citum_profesional_id').val() == ""){
    $('#citum_profesional_id').parent().hide();
    $('#citum_especialidad_id').parent().hide();
  }
  
  profesional = $('#citum_profesional_id').html();
  especialidad = $('#citum_especialidad_id').html();

  
  $('#citum_servicio_id').change(function() {
    var servicio, escaped_servicio, options;
    servicio = $('#citum_servicio_id :selected').text();
    escaped_servicio = servicio.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(especialidad).filter("optgroup[label=" + escaped_servicio + "]").html();        
    if (options) {
      
      $('#citum_especialidad_id').html(options);
      $('#citum_especialidad_id').prepend("<option value=''></option>").val('');  
      $('#citum_especialidad_id').parent().show();
    } else {      
      $('#citum_especialidad_id').empty();
      $('#citum_especialidad_id').parent().hide();
      $('#citum_profesional_id').empty();
      $('#citum_profesional_id').parent().hide();
    }
  });

  $('#citum_especialidad_id').change(function() {
    var espec, escaped_espec, options;
    espec = $('#citum_especialidad_id :selected').text();    
    escaped_espec = espec.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(profesional).filter("optgroup[label=" + escaped_espec + "]").html();    
    console.log(options);
    if (options) {
      $('#citum_profesional_id').html(options);
      $('#citum_profesional_id').prepend("<option value=''></option>").val('');  
      $('#citum_profesional_id').parent().show();
    } else {
      $('#citum_profesional_id').empty();
      $('#citum_profesional_id').parent().hide();
    }
  });


  $('#s_tipo').change(function() {
    toggleSearchFields();
  });


});

function toggleSearchFields() {
    if ($("#s_tipo").val() == "1" || $("#s_tipo").val() == "2"){
        $("#tipo1").show();        
        $("#tipo3").hide();
    }else{ 
        if ($("#s_tipo").val() == "3") {
          $("#tipo1").hide();        
          $("#tipo3").show();
        } else {
          $("#tipo1").hide();        
          $("#tipo3").hide();
        }              
    }
       
}

  
;
