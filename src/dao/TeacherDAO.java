package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import utils.CheckSameUtils;
import vo.TeacherUser;

public class TeacherDAO extends BaseDAO{
	public static TeacherUser login(String userid,String pwd) {
		String sql = "SELECT * FROM teacher WHERE teacherid=?;";
		openConnection();

    	TeacherUser u = new TeacherUser();

    	try {
    		pstmt = getPStatement(sql);
    		pstmt.setString(1, userid);
    		ResultSet result = pstmt.executeQuery();

    		if(result.next()){
    			String spwd = result.getString("password");
    			u.setPassword(spwd);

    			if(u.isValid(pwd)){
    				u.setName(result.getString("teachername"));
    				u.setDescription(result.getString("description"));
    				u.setUserid(userid);
    				System.out.println("User Login:"+u.getName());
    				//setCacheMap(userid, "teacher");

        			return u;
    			}
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}finally{
    		closeConnect();
    	}
    	return null;
	}

	public static boolean updatePwd(String tid, String password, String newpwd){
		// 检查密码是否正确
		if (login(tid, password) == null) {
			return false;
		}

		// 执行更新密码
		String sql = "UPDATE teacher SET password= ? WHERE teacherid = ?";
		openConnection();
		pstmt = getPStatement(sql);

		try {
			pstmt.setString(1, newpwd);
			pstmt.setString(2, tid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnect();
		}

		return true;
	}

	public static JSONArray getCourseSelectAndStudentNameList(String teacherid, String courseid) throws SQLException, JSONException {
		JSONArray resultlist = new JSONArray();
    	String sql = "SELECT courseselect.grade,courseselect.studentid,student.name"
    			+ " FROM courseselect,student"
    			+ " where courseselect.teacherid = ? and courseselect.courseid = ? and courseselect.studentid = student.userid;";
    	openConnection();
		pstmt = getPStatement(sql);

		pstmt.setString(1, teacherid);
		pstmt.setString(2, courseid);
		ResultSet result = pstmt.executeQuery();
		while(result.next()){
			JSONObject obj= new JSONObject ();
			obj.put("stuid", result.getString("studentid"));
			obj.put("name", result.getString("name"));
			obj.put("grade", result.getInt("grade"));
			resultlist.put(obj);
		}
		result.close();
		closeConnect();
		return resultlist;
	}

	public static JSONArray getCourseSelectAndStudentNameListWithId(String teacherid, String courseid, String studentid) throws SQLException, JSONException {
		JSONArray resultlist = new JSONArray();
    	String sql = "SELECT courseselect.grade,courseselect.studentid,student.name"
    			+ " FROM courseselect,student"
    			+ " where courseselect.teacherid = ? and courseselect.courseid = ? and courseselect.studentid = ? and courseselect.studentid = student.userid;";
    	openConnection();
		pstmt = getPStatement(sql);

		pstmt.setString(1, teacherid);
		pstmt.setString(2, courseid);
		pstmt.setString(3, studentid);
		ResultSet result = pstmt.executeQuery();
		while(result.next()){
			JSONObject obj= new JSONObject ();
			obj.put("stuid", result.getString("studentid"));
			obj.put("name", result.getString("name"));
			obj.put("grade", result.getInt("grade"));
			resultlist.put(obj);
		}
		result.close();
		closeConnect();
		return resultlist;
	}

	public static boolean updateGrade(String teacherid, String courseid, String studentid, int grade){
		String sql = "UPDATE courseselect SET grade= ? WHERE teacherid = ? and courseid = ? and studentid = ?;";
		openConnection();
		pstmt = getPStatement(sql);

		try {
			pstmt.setInt(1, grade);
			pstmt.setString(2, teacherid);
			pstmt.setString(3, courseid);
			pstmt.setString(4, studentid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnect();
		}

		return true;
	}

	public static JSONArray getCourseListIsSelected(String teacherid) throws SQLException, JSONException {
		JSONArray courselist=new JSONArray();
		openConnection();

		String teachercoursesql="select courseid from courseteacher where teacherid = ?;";
		pstmt = getPStatement(teachercoursesql);
        pstmt.setString(1, teacherid);
        ResultSet checkresult = pstmt.executeQuery();
        List<String> selectedcourseid =new ArrayList<String>();//存储该老师已选课程id
        while(checkresult.next()){
        	selectedcourseid.add(checkresult.getString("courseid"));
		}
        checkresult.close();


		String coursesql="select * from course;";
		pstmt=getPStatement(coursesql);
		ResultSet result=pstmt.executeQuery();
		while(result.next()) {
			JSONObject obj=new JSONObject();
			obj.append("courseid", result.getString("courseid"));
			obj.append("coursename", result.getString("coursename"));
			obj.append("studentcount", result.getInt("studentcount"));
			obj.append("createtime", result.getString("createtime"));

			if(selectedcourseid.indexOf(result.getString("courseid"))==-1){//课程未选
				obj.append("c_isselected", 0);
			}
			else obj.append("c_isselected", 1);

			courselist.put(obj);
		}
		return courselist;
	}

	//通过教师id取出该教师所有课程(name+no)
	public static JSONArray getCourseForTeacher(String teacherid) throws SQLException, JSONException {
		JSONArray resultlist = new JSONArray();
    	String sql = "select courseid,coursename from courseteacher where teacherid = ?;";
    	openConnection();
		pstmt = getPStatement(sql);

		pstmt.setString(1, teacherid);
		ResultSet result = pstmt.executeQuery();
		while(result.next()){
			JSONObject obj= new JSONObject ();
			obj.put("courseid", result.getString("courseid"));
			obj.put("coursename", result.getString("coursename"));
			resultlist.put(obj);
		}
		result.close();
		closeConnect();
		return resultlist;
	}

    public static JSONArray getCourseSection(String teacherid, String courseid) throws SQLException, JSONException {
        JSONArray resultlist = new JSONArray();
        String sql = "SELECT course_section"
                + " FROM file"
                + " where teacherid = ? and courseid = ? and studentid is null and file_type = 0;";
        openConnection();
        pstmt = getPStatement(sql);

        pstmt.setString(1, teacherid);
        pstmt.setString(2, courseid);
        ResultSet result = pstmt.executeQuery();
        while(result.next()){
            JSONObject obj= new JSONObject ();
            obj.put("section", result.getInt("course_section"));
            resultlist.put(obj);
        }
        result.close();
        closeConnect();
        return resultlist;
    }
    public static TreeMap<String,List<String>> getHomeworkPath(String courseId, String courseSection) throws SQLException {
		TreeMap<String,List<String>> map=new TreeMap<>();
		int section=Integer.parseInt(courseSection);
		String sql="select * from file where courseid = ? and course_section = ? and teacherid is null and file_type = 0";
		openConnection();
		pstmt=getPStatement(sql);
		pstmt.setString(1,courseId);
		pstmt.setInt(2,section);
		ResultSet result=pstmt.executeQuery();

		String outPath=System.getProperty("user.dir");
		while(result.next()){
			String file_url = result.getString(outPath+"file_url");
			String studentId=result.getString("studentid");
			CheckSameUtils.readFile(map,studentId,file_url);
		}
		result.close();
		closeConnect();
		return map;
	}

}
