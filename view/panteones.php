<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/panteones.css">
    <link rel="stylesheet" href="../font-awesonme/css/fontawesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,600,700" rel="stylesheet">

</head>

<body>
    <center>
        <form class="form-horizontal">
            <fieldset>

                <!-- Form Name -->
                <legend>Ingreso de Panteones</legend>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 col-sm-4 col-xl-4 control-label" for="textinput">Panteon</label>
                    <div class="col-md-4 col-sm-4 col-xl-4">
                        <input id="textinput" name="textinput" type="text" placeholder="Ingrese nombre panteon" class="form-control input-md">

                    </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                    <label class="col-md-4 col-sm-4 col-xl-4 control-label" for="selectbasic">Parroquia</label>
                    <div class="col-md-4 col-sm-4 col-xl-4">
                        <select id="selectbasic" name="selectbasic" class="form-control">
                            <option value="1">seleccionar</option>
                        </select>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 col-sm-4 col-xl-4 control-label" for="Panteon">Numero Inicial</label>
                    <div class="col-md-4 col-sm-4 col-xl-4">
                        <input id="Panteon" name="Panteon" type="text" placeholder="Ingrese numero inicial de Panteon" class="form-control input-md">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4  col-sm-4 col-xl-4 control-label" for="textinput">Numero Final</label>
                    <div class="col-md-4 col-sm-4 col-xl-4">
                        <input id="textinput" name="textinput" type="text" placeholder="Ingrese Numero Final de Panteon" class="form-control input-md">

                    </div>
                </div>

                <!-- Multiple Radios (inline) -->
                <div class="form-group">
                    <label class="col-md-4 col-sm-4 col-xl-4 control-label" for="radios">Seleccionar</label>
                    <div class="col-md-4 col-sm-4 col-xl-4">
                        <label class="radio-inline" for="radios-0">
                            <input type="radio" name="radios" id="radios-0" value="1" checked="checked">
                            Osarios
                        </label>
                        <label class="radio-inline" for="radios-1">
                            <input type="radio" name="radios" id="radios-1" value="2">
                            Ceniarios
                        </label>
                        <label class="radio-inline" for="radios-2">
                            <input type="radio" name="radios" id="radios-2" value="3">
                            Tumbas
                        </label>
                    </div>
                </div>

                <!-- Button (Double) -->
                <div class="form-group">
                    <label class="col-md-4 col-sm-4 col-xl-4 control-label" for="button1id"></label>
                    <div class="col-md-8 col-sm-8 col-xl-8">
                        <button id="button1id" name="button1id" class="btn btn-success">Good Button</button>
                        <button id="Guardar" name="Guardar" class="btn btn-warning">Buscar</button>
                    </div>
                </div>

            </fieldset>
        </form>
    </center>


</body>

</html>