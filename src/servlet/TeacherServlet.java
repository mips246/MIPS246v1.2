package servlet;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import dao.AdminDAO;
import dao.FileDAO;
import dao.TeacherDAO;
import utils.CheckSameUtils;
import vo.MyFile;

public class TeacherServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void init() throws ServletException {
		// Put your code here
	}
	
	public TeacherServlet() {
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
		
		if("updatePwd".equals(method)) {
			System.out.println("< Teacher Modify Password >");
			String oldPassword  = request.getParameter("oldPassword");		//原密码
			String password     = request.getParameter("newPassword");		//新密码
			String teacherid    = request.getParameter("userid");
			
			boolean ret = TeacherDAO.updatePwd(teacherid, oldPassword, password);
			
			if (ret) {
				System.out.println("< Teacher Modify Password Success >");
				try {
					//jsonObject.append("statusCode", 1);
					jsonObject.append("message", "success");
					jsonArray.put(jsonObject);
					
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}else{
				System.out.println("< Teacher Modify Password Failed >");
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
		else if("selectCourseSelectAndStudentName".equals(method)) {
			System.out.println("< Teacher Load Course Select Table And Student Table >");
			String teacherid = request.getParameter("teacherid");
			String courseid = request.getParameter("courseid");
			
			try{
				jsonArray = TeacherDAO.getCourseSelectAndStudentNameList(teacherid, courseid);
			}catch(SQLException|JSONException e) {
				e.printStackTrace();
			}
			out.println(jsonArray);
			
		}
		else if("selectCourseSelectAndStudentNameWithId".equals(method)) {
			System.out.println("< Teacher Load Course Select Table And Student Table >");
			String teacherid = request.getParameter("teacherid");
			String courseid = request.getParameter("courseid");
			String studentid = request.getParameter("studentid");
			
			try{
				jsonArray = TeacherDAO.getCourseSelectAndStudentNameListWithId(teacherid, courseid, studentid);
			}catch(SQLException|JSONException e) {
				e.printStackTrace();
			}
			out.println(jsonArray);
			
		}
		else if("selectAllCourseForTeacher".equals(method)) {
			System.out.println("< Teacher Load Course Name And Course No >");
			String teacherid = request.getParameter("teacherid");
			
			try{
				jsonArray = TeacherDAO.getCourseForTeacher(teacherid);
			}catch(SQLException|JSONException e) {
				e.printStackTrace();
			}
			out.println(jsonArray);
			
		}
		else if("updateGrade".equals(method)) {
			System.out.println("< Teacher Update Grade >");
			String teacherid = request.getParameter("teacherid");
			String courseid = request.getParameter("courseid");
			String studentid = request.getParameter("studentid");
			int grade = Integer.parseInt(request.getParameter("grade"));
			boolean ret = TeacherDAO.updateGrade(teacherid, courseid, studentid, grade);
			
			if (ret) {
				System.out.println("< Teacher Update Grade Success >");
				try {
					//jsonObject.append("statusCode", 1);
					jsonObject.append("message", "success");
					jsonArray.put(jsonObject);
					
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}else{
				System.out.println("< Teacher Update Grade Failed >");
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
		else if("updateHWGrade".equals(method)) {
			System.out.println("< Teacher Update Homework Grade >");
			/*
			String filename = request.getParameter("filename");
			String courseid = request.getParameter("courseid");
			String studentid = request.getParameter("studentid");
			*/
			int fileno = Integer.parseInt(request.getParameter("fileno"));
			int grade = Integer.parseInt(request.getParameter("grade"));
			
			//boolean ret = FileDAO.updateHWGrade(filename, courseid, studentid, grade);
			boolean ret = FileDAO.updateHWGrade(fileno, grade);
			
			if (ret) {
				System.out.println("< Teacher Update Homework Grade Success >");
				try {
					//jsonObject.append("statusCode", 1);
					jsonObject.append("message", "success");
					jsonArray.put(jsonObject);
					
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}else{
				System.out.println("< Teacher Update Homework Grade Failed >");
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
		else if("selectStudentHomeworkList".equals(method)) {
			System.out.println("< Teacher Get Student Homework List >");
			String courseid = request.getParameter("courseid");
			String studentid = request.getParameter("studentid");
			
			MyFile file=new MyFile();
			file.setCourseid(courseid);
			file.setStudentid(studentid);
			file.setFiletype(0);
			
			try{
				jsonArray = FileDAO.teacherGetStudentHW(file);
			}catch(SQLException|JSONException e) {
				e.printStackTrace();
			}
			out.println(jsonArray);
		}
		else if("selectTeacherFileWithCourseid".equals(method)) {
			System.out.println("< Teacher Get File List With Courseid >");
			String courseid = request.getParameter("courseid");
			String teacherid = request.getParameter("teacherid");

			MyFile file=new MyFile();
			file.setCourseid(courseid);
			file.setTeacherid(teacherid);

			try{
				jsonArray = FileDAO.teacherGetFile(file);
			}catch(SQLException|JSONException e) {
				e.printStackTrace();
			}
			out.println(jsonArray);
		}
		else if("getCourseSection".equals(method)) {
			System.out.println("< Teacher Get Course Section >");
			String teacherid = request.getParameter("teacherid");
			String courseid = request.getParameter("courseid");

			try{
				jsonArray = TeacherDAO.getCourseSection(teacherid, courseid);
			}catch(SQLException|JSONException e) {
				e.printStackTrace();
			}
			out.println(jsonArray);

		}
		else if("checkSame".equals(method)){
			System.out.println("< 进入查重模块 >");
			MyFile myfile = new MyFile();

			String courseId=request.getParameter("courseId");
			String courseSection=request.getParameter("courseSection");
			String teacherId=request.getParameter("teacherId");

			myfile.setFileurl(File.separator + "WebRoot" + File.separator + courseId + File.separator + teacherId + File.separator + "CheckSame.txt");
			myfile.setStudentid(null);
			myfile.setCourseid(courseId);
			myfile.setTeacherid(teacherId);
			myfile.setFiletype(4);
			myfile.setCoursesection(Integer.parseInt(courseSection));

			/**
			 * 这一段代码的逻辑是这样的：需要用多线程解压学生文件，返回的concurrentHashMap是一个
			 * 学生id——>解压后的文件内容List<String>的映射
			 */
			ConcurrentHashMap<String,List<String>> concurrentHashMap=new ConcurrentHashMap<>();
			Map<String,String> studentIdToFilePath=null;
			try {
				studentIdToFilePath=TeacherDAO.getHomeworkPath(courseId,courseSection);
			} catch (SQLException throwables) {
				throwables.printStackTrace();
			}
			ExecutorService executorService=Executors.newFixedThreadPool(10);
			for(String stId:studentIdToFilePath.keySet()){
				UnzipRunnableTask task=new UnzipRunnableTask(stId,studentIdToFilePath.get(stId),concurrentHashMap);
				executorService.execute(task);
			}
			executorService.shutdown();
			while(!executorService.isTerminated()){
			}
			Thread tt=new Thread(new Runnable() {
				@Override
				public void run() {
					try {
						String path=System.getProperty("user.dir")+File.separator+"WebRoot"+File.separator+courseId+File.separator+teacherId+File.separator;
						System.out.println(path);
						File f=new File(path+"CheckSame.txt");

						Date time = new Date();
						java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
						String filetime = df.format(time);
						myfile.setCreatetime(filetime);
						myfile.setFilename("CheckSame.txt");
						FileDAO.insert(myfile);

						FileOutputStream os=null;
						try {
							os=new FileOutputStream(f);
						} catch (FileNotFoundException e) {
							e.printStackTrace();
						}
						//创建excel表对象
						//HSSFWorkbook wholeFile=new HSSFWorkbook();
						//创建这个excel表内的sheet
						//HSSFSheet result = wholeFile.createSheet("result");
						List<String> list=new ArrayList<>(concurrentHashMap.keySet());
						Map<String,Integer> studentIndex=new HashMap<>();
						for(int i=0;i<list.size();i++){
							studentIndex.put(list.get(i),i+1);
						}

						TreeMap<String,List<String>> treeMap=new TreeMap<>();
						for(String s:concurrentHashMap.keySet()){
							treeMap.put(s,concurrentHashMap.get(s));
						}
						List<String> studentList=new ArrayList<>(treeMap.keySet());
						File resultTxt=new File(path+"CheckSame.txt");

						resultTxt.createNewFile();

						FileOutputStream ops=null;
						ops=new FileOutputStream(resultTxt);
						for(int i=0;i<studentList.size()+1;i++){
							if(i==0){
								ops.write("查重+\t".getBytes("utf-8"));
							}else{
								String s=studentList.get(i-1)+"\t";
								ops.write(s.getBytes("UTF-8"));
							}
						}
						ops.write("\n".getBytes("UTF-8"));
						//Map<String, HSSFRow> studentIdToHSSFRow = CheckSameUtils.initXlsFile(studentList, f,wholeFile,result,os);
						DecimalFormat decimalFormat=new DecimalFormat("#0.000");
						for(String stId1:treeMap.keySet()){
							String stId1s=stId1+"\t";
							ops.write(stId1s.getBytes("UTF-8"));
							for(String stId2:treeMap.keySet()){
								if(stId1.compareTo(stId2)>0){
									List<String> list1=treeMap.get(stId1);
									List<String> list2=treeMap.get(stId2);
									double v = CheckSameUtils.calRepeatRate(list1, list2, 2);
									if(v>1) v=1;
									//studentIdToHSSFRow.get(stId1).createCell(studentIndex.get(stId2)).setCellValue(v);
									String compareAns=decimalFormat.format(v)+"\t";
									ops.write(compareAns.getBytes("UTF-8"));
								}
							}
							ops.write("\n".getBytes("UTF-8"));
						}
						ops.close();
						try {
							//wholeFile.write(os);
							os.flush();
						} catch (IOException e) {
							e.printStackTrace();
						}
						try {
							os.close();
						} catch (IOException e) {
							e.printStackTrace();
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			});
			tt.start();
//			Thread t=new Thread(new Runnable() {
//				@Override
//				public void run() {
//					TreeMap<String, List<String>> map;
//
//					try {
//						String path=System.getProperty("user.dir")+File.separator+"WebRoot"+File.separator+courseId+File.separator+teacherId+File.separator;
//						System.out.println(path);
//						File f=new File(path+"CheckSame.xls");
//
//						Date time = new Date();
//						java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//						String filetime = df.format(time);
//						myfile.setCreatetime(filetime);
//						myfile.setFilename("CheckSame.xls");
//						FileDAO.insert(myfile);
//
//						FileOutputStream os=null;
//						//获取学生id和文件内容的键值映射。
//						map=TeacherDAO.getHomeworkPathAndFileName(courseId,courseSection);
//						try {
//							os=new FileOutputStream(f);
//						} catch (FileNotFoundException e) {
//							e.printStackTrace();
//						}
//						//创建excel表对象
//						HSSFWorkbook wholeFile=new HSSFWorkbook();
//						//创建这个excel表内的sheet
//						HSSFSheet result = wholeFile.createSheet("result");
//						List<String> list=new ArrayList<>(map.keySet());
//						Map<String,Integer> studentIndex=new HashMap<>();
//						for(int i=0;i<list.size();i++){
//							studentIndex.put(list.get(i),i+1);
//						}
//						List<String> studentList=new ArrayList<>(map.keySet());
//						Map<String, HSSFRow> studentIdToHSSFRow = CheckSameUtils.initXlsFile(studentList, f,wholeFile,result,os);
//						for(String stId1:map.keySet()){
//							for(String stId2:map.keySet()){
//								if(stId1.compareTo(stId2)>0){
//									List<String> list1=map.get(stId1);
//									List<String> list2=map.get(stId2);
//									double v = CheckSameUtils.calRepeatRate(list1, list2, 1);
//									if(v>1) v=1;
//									studentIdToHSSFRow.get(stId1).createCell(studentIndex.get(stId2)).setCellValue(v);
//								}
//							}
//						}
//						try {
//							wholeFile.write(os);
//							os.flush();
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
//						try {
//							os.close();
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
//
//					} catch (SQLException throwables) {
//						throwables.printStackTrace();
//					}
//				}
//			});
//			t.start();
			try {
				jsonArray.put(0,"true");
			} catch (JSONException e) {
				e.printStackTrace();
			}
			out.println(jsonArray);
		}
		out.close();
	}
	static class UnzipRunnableTask implements Runnable{
		private String id;
		private String path;
		private ConcurrentHashMap<String,List<String>> map;
		public UnzipRunnableTask(String id,String path, ConcurrentHashMap<String,List<String>> map){
			this.id=id;
			this.path=path;
			this.map=map;
		}
		@Override
		public void run() {
			int i=path.length()-1;
			for(;i>=0;i--){
				if(path.charAt(i)=='\\'){
					break;
				}
			}
			String dest=path.substring(0,i+1)+"temp";
			try {
				CheckSameUtils.unZipFile(path,dest);
			} catch (IOException e) {
				e.printStackTrace();
			}
			CheckSameUtils.readFile2(map,id,dest);
//			File f=new File(dest);
//			f.delete();
		}
	}
}

