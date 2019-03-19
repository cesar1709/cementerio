<style>
    .baseLogin{
    width:100%;
    height:100%;
    display:flex;
    justify-content:center;
    align-items:center;
    background-color: #222733;
    }
    button.myButton {
        width: 100%;
    }
    button.myButton {
        height: 50px;
        background: #1AAE88;
        border: 0;
        font-size: 16px;
        font-weight: 500;
        line-height: 40px;
        color: #fff;
        -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
    
    }
    button.myButton:hover{
        background: #2cabff; 
        color: #ffffff; 
    }
    button.myButton:active { 
        opacity: 0.6;  
        color: #ffffff; 
        background: #001aff; 
    }
</style>
<script>
    $(document).ready(function(){
    $("#formLogin").submit(function(){
        general.ajax({url:"controller/controller-usuarios.php",data:"formLogin",success:function(rta){
            console.log(rta);
            if(rta.success==true){
                general.inject({url:"view/principal.php",element:"body"});
            }
        }});
    });
    });
</script>
<div class="baseLogin">
    <div class="marcoForm col-12 col-xl-6 col-lg-6" style="color:#fff;">
        <form id="formLogin">
            <div class="myform-top">
                <div class="myform-top-left">
                    <h3>Ingresa a nuestro sitio.</h3>
                    <p>Digita tu usuario y contraseña:</p>
                </div>
                <div class="myform-top-right">
                    <i class="fa fa-key"></i>
                </div>
            </div>
            <center>
                <div class="myform-bottom">                              
                    <div class="form-group">
                        <input type="text" name="usuario" placeholder="INGRESE USUARIO" class="form-control" id="usuario" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <input type="password" name="clave" placeholder="INGRESE CONTRASEÑA" class="form-control" id="clave" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <button class="myButton" id="entrar">Entrar</button>
                        <input type="hidden" name="function" value="login">
                    </div>
                    <div class="form-group">
                    <button type="submit" id="registrarme" class="myButton">Registrarme</button>
                    </div>                       
                </div>
            </center>
        </form>
    </div>
</div>