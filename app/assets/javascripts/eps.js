$(document).ready(function() {

	$('.search-eps')
  .form({
    on: 'submit',
    fields: {
      s_eps: {
        identifier  : 's_eps',
        rules: [
          {
            type   : 'empty',
            prompt : 'Ingresar nombre EPS a la busqueda'
          }
        ]
      }
    }
  });

});