
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates and open the template
 * in the editor.
 */
/**
 *
 * @author Rajesh
 */
public class PUT_ToRESTAPI extends HttpServlet {

    static ArrayList<MyUser> myUsers = null;

    @Override
    protected void doPost ( HttpServletRequest req , HttpServletResponse resp ) throws ServletException , IOException {
        //   super.doPost ( req , resp ); //To change body of generated methods, choose Tools | Templates.
        
        PrintWriter out = resp.getWriter();
       try{
        String name = req.getParameter ( "name" );
        String id = req.getParameter ( "id" );
        String email = req.getParameter ( "email" );
        String phone = req.getParameter ( "phone" );

        
  
                                URL url = new URL("http://localhost:8082/myuser/"+id);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setDoOutput(true);
                conn.setRequestMethod("PUT");
                conn.setRequestProperty("Content-Type", "application/json");

                                String input = null ;

                                try{
                                //String input = "{\"name\":\"Atul Ghumare\",\"email\":\"atul@gmail.com\",\"phone\":\"123456795\"}";
                                    JSONObject object = new JSONObject ();
                                    object.accumulate ( "name", name);
                                    object.accumulate ( "email", email);
                                    object.accumulate ( "phone", phone);

                                    input = object.toString ();

                                }catch(JSONException je){

                                }

                OutputStream os = conn.getOutputStream();
                os.write(input.getBytes());
                os.flush();

                if (conn.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
        //			throw new RuntimeException("Failed : HTTP error code : "
        //				+ conn.getResponseCode());
                }

                BufferedReader br = new BufferedReader(new InputStreamReader(
                                (conn.getInputStream())));

                String output;
                System.out.println("Output from Server .... \n");
                while ((output = br.readLine()) != null) {
                        System.out.println(output);
                }

                conn.disconnect();
                
                
                 out.println("<html>");
                 out.println("<body>");
            
           
                out.println("</body>");
                out.println("</html>");
                
                
                                resp.sendRedirect("Home.jsp");
                
	  } catch (MalformedURLException e) {
		e.printStackTrace();
                out.println("error 1" +e.getMessage ());
	  } catch (IOException e) {
		e.printStackTrace();
                out.println("error 2"+e.getMessage ());
	 }catch (Exception e) {
		e.printStackTrace();
                out.println("error 3"+e.getMessage ());
	 }
    }
    
}
