$(document).ready(function() {
   toggleSearchFields();
   $('#citum_paciente_id').parent().hide();
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
    if (espec !="CANCER DE MAMA"){
    options = $(profesional).filter("optgroup[label=" + escaped_espec + "]").html();  
    }else{
      options = $(profesional).filter("optgroup[label=PSICOLOGIA]").html();  
    }
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

  $('.search_paciente').search({
    apiSettings: {
      action: 'search', url: '/pacientes/searchpaciente?query={query}'

    },
    fields: {    
      results: 'paciente',  
      title   : 'numero_id'      
    },
    minCharacters : 3,
    onSelect: function(result, response) {            
            
            $('#citum_paciente_id').val(result.numero_id); 
            $('#primer_nombre').val(result.persona.primer_nombre);             
            $('#segundo_nombre').val(result.persona.segundo_nombre);             
            $('#primer_apellido').val(result.persona.primer_apellido);             
            $('#segundo_apellido').val(result.persona.segundo_apellido);             
            return true;
        },
    onResultsOpen: function(){
            $('#citum_paciente_id').val(""); 
            $('#primer_nombre').val("");             
            $('#segundo_nombre').val(""); 
            $('#primer_apellido').val(""); 
            $('#segundo_apellido').val(""); 
      }
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

  