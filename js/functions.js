var general={
    inject:function(parameters={}){
        $.ajax({
            type:"POST",
            url: parameters.url,
            data:(parameters.data!=undefined)?parameters.data:{},
            dataType: 'html',
            timeout: 5000,
            success: function(html) {
                $(parameters.element).html(html);
                /*$(document).ready(function(parameters.element){
                });*/
            }
        });
    },
    ajax:function ajax(parameters={}){
        let vdata;
        if (typeof parameters.data=="string") {
            event.preventDefault();
            formElement=document.getElementById(parameters.data);
            vdata=new FormData(formElement);
            parameters.processData=false;
            parameters.contentType=false;
        }else{
            vdata=parameters.data;
        }
        if (parameters.timeout==undefined) {
            parameters.timeout=15000;
        }
        if (parameters.processData==undefined) {
            parameters.processData=true;
        }
        if (parameters.contentType==undefined) {
            parameters.contentType="application/x-www-form-urlencoded;charset=UTF-8";
        }
        if (parameters.coverage) {
            coverage.open();
        }
        $.ajax({
            type: "POST",
            data:vdata,
            url: parameters.url,
            dataType: "json",
            processData:parameters.processData,
            contentType:parameters.contentType,
            context:parameters.context,
            timeout: parameters.timeout,
            async: ((parameters.async=='undefined' || parameters.async==true)?true:false),
            success: function(rta) {
                parameters.success(rta,this);
            },error: function(xhr, textStatus, errorThrown){
                console.log(xhr);
                if(parameters.error!=undefined){
                    parameters.error(xhr);
                }
                
            }
        });
    }
};