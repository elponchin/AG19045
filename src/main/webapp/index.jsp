<%-- 
    Document   : index
    Created on : 4 jul. 2020, 0:18:01
    Author     : eduar
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.persistencia.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.persistencia.UsuarioJpaController"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>

<%
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("my_persistence_unit");
    UsuarioJpaController controler = new UsuarioJpaController(emf);

    List<Usuario> lista = new ArrayList<Usuario>();

    lista = controler.findUsuarioEntities();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabla de Usuarios</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <style>
            .caja, .tabla{
                margin: auto;
                width: 600px;
            }
        </style> 
    </head>
    <body>
        <div class="caja">
            <h1>Ingresar Usuario</h1>
            <br>
            <br>
            <form action="/AG19045/AgregarRegistro" method="post">
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputName" name="name" placeholder="Name">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">E-Mail</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="inputEmail" name="email" placeholder="E-Mail">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">Registrar usuario</button>
                    </div>
                </div>
            </form>
        </div>
        <br>
        <br>
        <div class="tabla">
            <h1>Tabla de usuarios</h1>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">E-mail</th>
                        <th scope="col">Password</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Usuario user : lista) {
                    %>
                    <tr>
                        <th> <%= user.getId()%> </th>
                        <td> <%= user.getName()%> </td>
                        <td> <%= user.getEmail()%> </td>
                        <td> <%= user.getPassword()%> </td>
                        <td>
                            <form action="/AG19045/EliminarRegistro" method="post">
                                <button type="submit" class="btn btn-danger" name="eliminar" value="<%= user.getId()%>">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
