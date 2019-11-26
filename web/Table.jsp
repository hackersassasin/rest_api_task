<%-- 
    Document   : Table
    Created on : Apr 3, 2018, 1:02:19 PM
    Author     : WIN 10
--%>

<%@page import="org.json.JSONException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.MalformedURLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONString"%>
<%@page import="org.json.JSONTokener"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>


        <%

           

            String output = "";
            String response1 = "";
            ArrayList<String[]> myUsers = new ArrayList<String[]> ();

            JSONArray jARR = null;
            JSONObject jOB = null;
            try {

                URL url = new URL ( "http://13.232.202.187:8080/myuser/" );
                HttpURLConnection conn = ( HttpURLConnection ) url.openConnection ();
                conn.setRequestMethod ( "GET" );
                conn.setRequestProperty ( "Accept" , "application/json" );

                if ( conn.getResponseCode () != 200 ) {
                    throw new RuntimeException ( "Failed : HTTP error code : "
                            + conn.getResponseCode () );
                }

                BufferedReader br = new BufferedReader ( new InputStreamReader (
                        ( conn.getInputStream () ) ) );

                System.out.println ( "Output from Server .... \n" );
                while ( ( output = br.readLine () ) != null ) {
                    System.out.println ( output );

                    if ( output != null ) {
                        response1 = output;
                    }
                }

              //  out.print ( response1 );

                conn.disconnect ();

                String table = request.getParameter ( "employee" );

                out.print ( "<table class='tb'>" );
                out.print ( "<tbody style='cursor:pointer'>" );

                Object json = new JSONTokener ( response1 ).nextValue ();

                if ( json instanceof JSONArray ) {
                    //you have an object

                    jARR = new JSONArray ( response1 );

                    for ( int i = 0 ; i < jARR.length () ; i ++ ) {

                        JSONObject job = new JSONObject ( jARR.get ( i ).toString () );
                        out.print ( "<tr>" );
                        out.print ( "<th >" );
                        out.print ( job.getInt ("id" )+"" );
                        out.print ( "</th>" );

                        out.print ( "<th >" );
                        out.print ( job.getString ( "name" ) );
                        out.print ( "</th>" );

                        out.print ( "<th >" );
                        out.print ( job.getString ( "email" ) );
                        out.print ( "</th>" );

                        out.print ( "<th >" );
                        out.print ( job.getString ( "phone" ) );
                        out.print ( "</th>" );

                        out.print ( "</tr>" );
                    }
                }

                out.print ( "</tbody>" );
                out.print ( "</table>" );

                out.println ( "</body>" );
                out.println ( "</html>" );

            } catch ( JSONException e ) {
                //e.printStackTrace();
                System.out.println ( " errror" + e.getMessage () );
            } catch ( Exception e ) {
                //e.printStackTrace();
                System.out.println ( " errror" + e.getMessage () );
            }


        %> 

    </body>
</html>
