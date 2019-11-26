<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>REST API TASK</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>

        <form method="post" action="POST_ToRESTAPI">


            <table align="center" width="30%" >
                <tr>
                    <td>
                        <pre >
                                ID            : <input type="text" name="id" value="" size="45"/>

                                Name            : <input type="text" name="name" value="" size="45"/>

                                Email          : <input type="text" name="email" value="" size="45"/>

                                Phone          : <input type="text" name="phone" value="" size="45"/>
                        </pre>  
                </tr>

                <tr>
                    <td><input type="submit" class="button" value="Submit" /></td>
                    <td><input type="submit" class="button" value="Update" onclick="form.action='PUT_ToRESTAPI';"/></td>
                    <td><input type="submit" class="button" value="Delete" onclick="form.action='DEL_ToRESTAPI';"/></td>
                    <td><input type="button" class="button" value="Reset" /></td>
                    <td><input type="button" class="button" value="Reload" /></td>
                </tr>



                <tr>
                    <jsp:include page="Table.jsp" >
                        <jsp:param name="abc" value="employee"/>
                    </jsp:include>  

                </tr>
            </table>
        </form>
    </body>
</html>
