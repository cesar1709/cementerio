<?php
 require'/clases/conexion.php';
$status="";
//vriables
if (isset($_POST[“nit_parroquia”])) {
$nit=$_POST['nit_parroquia'];
$nomparroquia=$_POST['nom_par'];
$nomparroco=$_POST['nom_pco_par'];
$direccion=$_POST['dir_par'];
$telefono=$_POST['tel_par'];
/*$ncementerio=$_POST['nom_cem'];
$dcementerio=$_POST['dir_cem'];
$tcementerio=$_POST['telefono1'];
$ecementerio=$_POST['email'];
$=$_POST['tel_par'];
*/
$sql="insert into parroquias(nit_parroquia,nom_par,nom_pco_par,dir_par,tel_par) values('$nit','$nomparroquia','$nomparroco','$direccion','$telefono')";

$ejecutar=mysql_query($sql,$conexion);}
if(!$ejecutar){
    
    echo"hubo error";

}else{
    echo"dastos guardados<br><a href='index.php'>volver</a>";
}


?>