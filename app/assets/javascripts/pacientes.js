// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
	$('#paciente_persona_attributes_tipoid').change(function() {
    	var selectedtipo;
    	selectedtipo = $('#paciente_persona_attributes_tipoid option:selected').val();
    	return $('#tipo_identidad').val(selectedtipo);
  	});
  	$('#paciente_persona_attributes_sexo').change(function() {
    	var selectedtipo;
    	selectedtipo = $('#paciente_persona_attributes_sexo option:selected').val();
    	return $('#Sexo').val(selectedtipo);
  	});

    $('#paciente_persona_attributes_fecha_nac_3i').change(function() {
      var days,months,years, ages;
      days=$('#paciente_persona_attributes_fecha_nac_3i option:selected').val();
      months=$('#paciente_persona_attributes_fecha_nac_2i option:selected').val();
      years=$('#paciente_persona_attributes_fecha_nac_1i option:selected').val();
      ages = getAge(parseInt(days),parseInt(months),parseInt(years));                  
      $('#a_os').val(parseInt(ages.years));
      $('#meses').val(parseInt(ages.months)); 
    });  

  $('#paciente_persona_attributes_fecha_nac_2i').change(function() {
      var days,months,years, ages;
      days=$('#paciente_persona_attributes_fecha_nac_3i option:selected').val();
      months=$('#paciente_persona_attributes_fecha_nac_2i option:selected').val();
      years=$('#paciente_persona_attributes_fecha_nac_1i option:selected').val();
      ages = getAge(parseInt(days),parseInt(months),parseInt(years));                  
      $('#a_os').val(parseInt(ages.years));
      $('#meses').val(parseInt(ages.months)); 
    });  

    $('#paciente_persona_attributes_fecha_nac_1i').change(function() {
      var days,months,years, ages;
      days=$('#paciente_persona_attributes_fecha_nac_3i option:selected').val();
      months=$('#paciente_persona_attributes_fecha_nac_2i option:selected').val();
      years=$('#paciente_persona_attributes_fecha_nac_1i option:selected').val();
      ages = getAge(parseInt(days),parseInt(months),parseInt(years));                  
      $('#a_os').val(parseInt(ages.years));
      $('#meses').val(parseInt(ages.months));     
    });  

    $('.search_eps').search({
    apiSettings: {
      action: 'search', url: '/eps/searcheps?query={query}'

    },
    fields: {    
      results: 'eps',  
      title   : 'nombre'
      
    },
    minCharacters : 3,
    onSelect: function(result, response) {            
            
            $('#paciente_eps_id').val(result.codigo_eps); 
            $('#nombre_eps').val(result.nombre);             
            return true;
        },
    onResultsOpen: function(){
        $('#paciente_eps_id').val("");           
        $('#nombre_eps').val("");           
      }
    });

    $('.paciente-form').form({
      on: "submit",
    fields: {

      numero_id:    {
        identifier  : 'paciente_numero_id',
        rules: [
          {
            type   : 'empty',
            prompt : 'Introduzca numero de identificacion Valido'
          },
          {
            type  : 'minLength[2]',
            prompt: 'Introduzca numero de identificacion'
          }
        ]
      },
      primer_nombre:    {
        identifier  : 'paciente_persona_attributes_primer_nombre',
        rules: [
          {
            type   : 'empty',
            prompt : 'Introduzca Primer Nombre'
          }
        ]
      },
      primer_apellido:    {
        identifier  : 'paciente_persona_attributes_primer_apellido',
        rules: [
          {
            type   : 'empty',
            prompt : 'Introduzca Primer Apellido'
          }
        ]
      },
      eps_id:    {
        identifier  : 'paciente_eps_id',
        rules: [
          {
            type   : 'empty',
            prompt : 'Introduzca EPS'
          }
        ]
      }
      
    }
    });
  


 });  


  function getAge(sday,smonth,syear) {
  var now = new Date();
  var today = new Date(now.getFullYear(),now.getMonth(),now.getDate());    
  var yearNow = now.getFullYear();
  var monthNow = now.getMonth() +1;
  var dateNow = now.getDate();


  /*var dob = new Date(dateString.substring(6,10),
                     dateString.substring(0,2)-1,                   
                     dateString.substring(3,5)                  
                     );*/

  var yearDob = syear;
  var monthDob = smonth;
  var dateDob = sday;
  var age = {};
  var ageString = "";
  var yearString = "";
  var monthString = "";
  var dayString = "";
 

  yearAge = yearNow - yearDob;

  if (monthNow >= monthDob)
    var monthAge = monthNow - monthDob ;
  else {
    yearAge--;
    var monthAge = 12 + monthNow -monthDob ;
  }

  if (dateNow >= dateDob)
    var dateAge = dateNow - dateDob;
  else {
    monthAge--;
    var dateAge = 31 + dateNow - dateDob;

    if (monthAge < 0) {
      monthAge = 11;
      yearAge--;
    }
  }

  age = {
      years: yearAge,
      months: monthAge,
      days: dateAge
      };

  return age;
}



//alert(getAge('27/08/1950').months);


