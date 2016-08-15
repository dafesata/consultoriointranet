
$(document).ready(function() {
	 $('#encuestaseno_desc_resul').parent().hide();
	 $('#encuestaseno_paciente_id').parent().hide();
	 

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
	            
	            $('#encuestaseno_paciente_id').val(result.numero_id); 
	            $('#primer_nombre').val(result.persona.primer_nombre);             
	            $('#segundo_nombre').val(result.persona.segundo_nombre);             
	            $('#primer_apellido').val(result.persona.primer_apellido);             
	            $('#segundo_apellido').val(result.persona.segundo_apellido);             
	            return true;
	    },
	    onResultsOpen: function(){
	            $('#encuestaseno_paciente_id').val(""); 
	            $('#primer_nombre').val("");             
	            $('#segundo_nombre').val(""); 
	            $('#primer_apellido').val(""); 
	            $('#segundo_apellido').val(""); 
	    }
    });

    $('#encuestaseno_resul_mamo').change(function() {
    	var selectedtipo;
    	selectedtipo = $('#encuestaseno_resul_mamo option:selected').text();
    	return $('#encuestaseno_desc_resul').val(selectedtipo);
  	});

  	$('').change(function() {   	

    	
  	});

  	$('.encuestaseno-form').form({   
  		on: 'submit',
  		fields: {
  			edadphijo : {
  				identifier	: 'encuestaseno_edadphijo',
  				depends		: 'encuestaseno_hijos',  				
  				rules	: [{
  					type	: 'empty',
  					prompt	: 'Edad del primer hijo no puede estar en blanco si tiene hijos'
  				}]
  			},
  			pacienteid : {
  				identifier	: 'encuestaseno_paciente_id',
  				rules	: [{
  					type	: 'empty',
  					prompt	: 'Ingrese el documento de identidad del paciente'				
  				},	
  				{
  					type  : 'minLength[2]',
            		prompt: 'Introduzca numero de identificacion'            		
  				}]  				
  			},
  			edadmenopausia : {
  				identifier	: 'encuestaseno_edad_menopausia',
  				depends		: 'encuestaseno_menopausia',  				
  				rules	: [{
  					type	: 'empty',
  					prompt	: 'Edad menopausia no puede estar en blanco si selecciono menopausia'
  				}]
  			},
  			peso :{
  				identifier	: 'encuestaseno_peso',
  				rules		:[{
  					type	: 'empty',
  					prompt	: 'Peso no debe estar en blanco'
  				},{  				
  					type	: 'number',
  					prompt	: 'Introduzca un Peso valido'	
  				}]
  			},
  			talla : {
  				identifier	: 'encuestaseno_talla',
  				rules		: [{
  					type	: 'empty',
  					prompt	: 'Peso no debe estar en blanco'
  				},{  				
  					type	: 'number',
  					prompt	: 'Introduzca una Talla valida'	
  				}]
  			},  
  			menarquia : {
  				identifier	: 'encuestaseno_menarquia',
  				rules		: [{
  					type	: 'empty',
  					prompt	: 'Menarquia no debe estar en blanco'
  				},{
  					type	: 'number',
  					prompt	: 'Introduzca una Edad valida'
  				}]
  			},  			
  			nromamografias : {
  				identifier	: 'encuestaseno_nro_mamografias',
  				rules		: [{
  					type	: 'empty',
  					prompt	: '# de Mamografias no debe estar en blanco'
  				},{
  					type	: 'number',
  					prompt	: 'Introduzca un numero'
  				}]
  			}
  			
  		},
  		onInvalid: function(pacienteid) { 					
				$('.encuestaseno-form').form('add').prompt('search_paciente','error text')
  				
  			}
  	});

  	$("#encuestaseno_talla").change(function(){
    	calculateimc()
  	});

  	$("#encuestaseno_peso").change(function(){
    	calculateimc()
  	});
  	
});
function calculateimc(){
	var imc=0;
    if ($('#encuestaseno_talla').val() != "" && $('#encuestaseno_peso').val() != ""){
	   	imc = $('#encuestaseno_peso').val() / ($('#encuestaseno_talla').val() * $('#encuestaseno_talla').val());	    	    	
	   }
    $('#encuestaseno_imc').val(imc.toFixed(2));
    if (imc>0 && imc<16.00){
    	$('#encuestaseno_equivalente').val("Infrapeso: delgadeza severa");
    }else{
    	if (imc>=16.00 && imc<17){
    		$('#encuestaseno_equivalente').val("Infrapeso: delgadeza moderada");
    	}else{
    		if (imc>=17.00 && imc<18.5){
    			$('#encuestaseno_equivalente').val("Infrapeso: delgadeza aceptable");	
    		}else{
    			if (imc>=18.50 && imc<25){
    				$('#encuestaseno_equivalente').val("Peso Normal");		
    			}else{
    				if (imc>=25 && imc<30){
    					$('#encuestaseno_equivalente').val("Sobrepeso");		
    				}else{
    					if (imc>=30 && imc<35){
    						$('#encuestaseno_equivalente').val("Obeso: Tipo I");			
    					}else{
    						if (imc>=35 && imc<40){
    							$('#encuestaseno_equivalente').val("Obeso: Tipo II");	
    						}else{
    							if (imc>=40 ){
    								$('#encuestaseno_equivalente').val("Obeso: Tipo II");	
    							}else{
    								$('#encuestaseno_equivalente').val("");	
    							}
    						}
    					}
    				}
    			}
    		}
    	}
    }	    	
}