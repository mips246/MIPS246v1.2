package servlet;

import dao.FileDAO;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.SQLException;

public class DeleteFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void init() throws ServletException {
        // Put your code here
    }
    public DeleteFileServlet() {
        super();
    }

    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        String method = request.getParameter("method");

        if("TeacherDelete".equals(method)) {
            System.out.println("< Teacher Delete File >");
            int fileno = Integer.parseInt(request.getParameter("fileno"));
            String fileurl = request.getParameter("fileurl");
            String filepath = System.getProperty("user.dir") + URLDecoder.decode(fileurl,"UTF-8");
            File deleteFile = new File(filepath);
            boolean delret = false;
            boolean dbret = false;
            if(deleteFile.exists() && deleteFile.isFile()){
                delret = deleteFile.delete();
            }
            if(delret){
                System.out.println("< Teacher Delete File From Disk >");
                dbret = FileDAO.delete(fileno);
            }

            if (dbret) {
                System.out.println("< Teacher Delete File Success >");
                try {
                    //jsonObject.append("statusCode", 1);
                    jsonObject.append("message", "success");
                    jsonArray.put(jsonObject);

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }else{
                System.out.println("< Teacher Delete File Failed >");
                try {
                    //jsonObject.append("statusCode", 0);
                    jsonObject.append("message", "failed");
                    jsonArray.put(jsonObject);

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
            out.println(jsonArray);
        }
    }
}
