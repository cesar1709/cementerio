<?php
if(!isset($_SESSION)){
    session_start();
}
include('../clases/conexion.php');
class usuarios extends conexion{
    function __construct(){
        $this->db=conexion::instancia();
    }
    function login(){
        $usuario=$this->db->select("SELECT * FROM usuarios WHERE usuario='".strtoupper($_POST['usuario'])."';");
        if(sizeof($usuario)>0){
            $usuario=$usuario[0];
            if(password_verify ($_POST['clave'] , $usuario['clave'])){
                $_SESSION['usuario']=$usuario;
                echo json_encode(array('success'=>true,'message'=>array('title'=>'BIENVENIDO','content'=>'Hola '.ucwords(strtolower($usuario['nombres'])))));
            }else{
                echo json_encode(array('success'=>false,'message'=>array('title'=>'ERROR','content'=>'Contraseña Incorrecta.')));
            }
        }else{
            echo json_encode(array('success'=>false,'message'=>array('title'=>'ERROR','content'=>'Usuario no Registrado.')));   
        }
    }
    function newUser(){

    }
    function updateUser(){

    }
    function deleteUser(){

    }
}
$clase= new usuarios();
$clase->{$_POST["function"]}();
?>