function toggleSearchFields(){$("#s_tipo").val()=="1"||$("#s_tipo").val()=="2"?($("#tipo1").show(),$("#tipo3").hide()):$("#s_tipo").val()=="3"?($("#tipo1").hide(),$("#tipo3").show()):($("#tipo1").hide(),$("#tipo3").hide())}$(document).ready(function(){toggleSearchFields();var e,t;$("#citum_profesional_id").val()==""&&($("#citum_profesional_id").parent().hide(),$("#citum_especialidad_id").parent().hide()),t=$("#citum_profesional_id").html(),e=$("#citum_especialidad_id").html(),$("#citum_servicio_id").change(function(){var t,n,r;t=$("#citum_servicio_id :selected").text(),n=t.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g,"\\$1"),r=$(e).filter("optgroup[label="+n+"]").html(),r?($("#citum_especialidad_id").html(r),$("#citum_especialidad_id").prepend("<option value=''></option>").val(""),$("#citum_especialidad_id").parent().show()):($("#citum_especialidad_id").empty(),$("#citum_especialidad_id").parent().hide(),$("#citum_profesional_id").empty(),$("#citum_profesional_id").parent().hide())}),$("#citum_especialidad_id").change(function(){var e,n,r;e=$("#citum_especialidad_id :selected").text(),n=e.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g,"\\$1"),r=$(t).filter("optgroup[label="+n+"]").html(),console.log(r),r?($("#citum_profesional_id").html(r),$("#citum_profesional_id").prepend("<option value=''></option>").val(""),$("#citum_profesional_id").parent().show()):($("#citum_profesional_id").empty(),$("#citum_profesional_id").parent().hide())}),$("#s_tipo").change(function(){toggleSearchFields()})});