
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Formulario Registro Parroquia</title>

    <!-- CSS de Bootstrap -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../font-awesonme/css/fontawesome.min.css"> <!--Iconos-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500" >
    <link rel="stylesheet" href="../css/parroquia.css">

  </head>

  <body>
    <div class="my-content" >
        <div class="container" >
            <div class="row">
                <div class="col-sm-12" >
                <h1><strong>CEMENTERIO </strong> MUNICIPAL DE FLORIDABLANCA</h1>
                  <div class="mydescription">
                    <p>Formulario de Registro  </p>
                  </div>
                </div>
            </div>
            <div class="row centrado">
              <div class="col-sm-4 col-sm-offset-3 col-md-4 myform-cont" >
                    <div class="myform-top">
                        <div class="myform-top-left">
                          <h3>Regístrate.</h3>
                            <p>Por favor ingresa los datos de la parroquia</p>
                        </div>
                        <div class="myform-top-right">
                          <i class="fa fa-user"></i>
                        </div>
                    </div>
                    <div class="myform-bottom ">
                      <form role="form" action="c.parroquia.php" method="POST" class="">
                        <div class="form-group  ">
                            <input type="text" name="nit" placeholder="Nit..." class="form-control" id="form-firtsname">
                        </div>
                        <div class="form-group ">
                            <input type="text" name="nomparroquia" placeholder="Nombre Parroquia..." class="form-control" id="form-lastname">
                        </div>
                        <div class="form-group">
                            <input type="text" name="nomparroco" placeholder="Nombre del Parroco..." class="form-control" id="form-parroco">
                        </div>
                        <div class="form-group">
                            <input type="text" name="direccion" placeholder="Direccion..." class="form-control" id="form-direccion">
                        </div>
                        <div class="form-group">
                            <input type="text" name="telefono" placeholder="Telefono..." class="form-control" id="form-telefono">
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" placeholder="Email..." class="form-control" id="form-email">
                        </div>
                        <div class="form-group">
                            <input type="text" name="ncementerio" placeholder="Nombre Cementerio..." class="form-control" id="form-ncementerio">
                        </div>
                        <div class="form-group">
                            <input type="text" name="dcementerio" placeholder="Direccion Cementerio..." class="form-control" id="form-direccioncementerio">
                        </div>
                        <div class="form-group">
                            <input type="text" name="tcementerio" placeholder="Telefono Cementerio..." class="form-control" id="form-telefonocementerio">
                        </div>
                        <div class="form-group">
                            <input type="text" name="ecementerio" placeholder="Email Cementerio..." class="form-control" id="form-emailcementerio">
                        </div>
                        <div class="form-group">
                            <input type="password" name="contraseña" placeholder="Contraseña..." class="form-control" id="form-password">
                        </div>
                        <button type="submit" class="mybtn">Registrarme</button>
                      </form>
                    </div>
              </div>
            </div>
        </div>
      </div>

    <!-- Enlazamos el js de Bootstrap, y otros plugins que usemos siempre al final antes de cerrar el body -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>
