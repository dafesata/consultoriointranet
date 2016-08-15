$(document).ready(function() {
	$('#profesional_persona_attributes_tipoid').change(function() {
    	var selectedtipo;
    	selectedtipo = $('#profesional_persona_attributes_tipoid option:selected').val();
    	return $('#tipo_identidad').val(selectedtipo);
  	});
  	$('#profesional_persona_attributes_sexo').change(function() {
    	var selectedtipo;
    	selectedtipo = $('#profesional_persona_attributes_sexo option:selected').val();
    	return $('#Sexo').val(selectedtipo);
  	});

    $('#profesional_persona_attributes_fecha_nac_3i').change(function() {
      var days,months,years, ages;
      days=$('#profesional_persona_attributes_fecha_nac_3i option:selected').val();
      months=$('#profesional_persona_attributes_fecha_nac_2i option:selected').val();
      years=$('#profesional_persona_attributes_fecha_nac_1i option:selected').val();
      ages = getAge(parseInt(days),parseInt(months),parseInt(years));                  
      $('#a_os').val(parseInt(ages.years));
      $('#meses').val(parseInt(ages.months)); 
    });  

  $('#profesional_persona_attributes_fecha_nac_2i').change(function() {
      var days,months,years, ages;
      days=$('#profesional_persona_attributes_fecha_nac_3i option:selected').val();
      months=$('#profesional_persona_attributes_fecha_nac_2i option:selected').val();
      years=$('#profesional_persona_attributes_fecha_nac_1i option:selected').val();
      ages = getAge(parseInt(days),parseInt(months),parseInt(years));                  
      $('#a_os').val(parseInt(ages.years));
      $('#meses').val(parseInt(ages.months)); 
    });  

    $('#profesional_persona_attributes_fecha_nac_1i').change(function() {
      var days,months,years, ages;
      days=$('#profesional_persona_attributes_fecha_nac_3i option:selected').val();
      months=$('#profesional_persona_attributes_fecha_nac_2i option:selected').val();
      years=$('#profesional_persona_attributes_fecha_nac_1i option:selected').val();
      ages = getAge(parseInt(days),parseInt(months),parseInt(years));                  
      $('#a_os').val(parseInt(ages.years));
      $('#meses').val(parseInt(ages.months));     
    });  

     $('.profesional-form').form({
      on: "submit",
    fields: {

      numero_id:    {
        identifier  : 'profesional_numero_id',
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
        identifier  : 'profesional_persona_attributes_primer_nombre',
        rules: [
          {
            type   : 'empty',
            prompt : 'Introduzca Primer Nombre'
          }
        ]
      },
      primer_apellido:    {
        identifier  : 'profesional_persona_attributes_primer_apellido',
        rules: [
          {
            type   : 'empty',
            prompt : 'Introduzca Primer Apellido'
          }
        ]
      },
      eps_id:    {
        identifier  : 'profesional_reg_med',
        rules: [
          {
            type   : 'empty',
            prompt : 'Introduzca Tarjeta Profesional o Registro Medico'
          }
        ]
      }
      
    }
    });


 });  