package utils;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream;
import org.apache.commons.compress.utils.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.*;
import java.nio.charset.Charset;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * @author Ryan
 * @date 2020/9/22 19:48
 */
public class CheckSameUtils {
    /**
     * 以下分别是字符串比较算法和计算重复率的函数
     */
    public static int lcs(String X, String Y){
        int m=X.length();
        int n=Y.length();
        int[][] dp=new int[m+1][n+1];
        for(int i=1;i<=m;i++){
            for(int j=1;j<=n;j++){
                if(X.charAt(i-1)==Y.charAt(j-1)){
                    dp[i][j]=dp[i-1][j-1]+1;
                }else{
                    dp[i][j]=Math.max(dp[i-1][j],dp[i][j-1]);
                }
            }
        }
        return dp[m][n];
    }
    public static int levenshtein(String X,String Y){
        int m=X.length();
        int n=Y.length();
        int[][] dp=new int[m+1][n+1];
        for(int i=0;i<=m;i++){
            dp[i][0]=i;
        }
        for(int j=0;j<=n;j++){
            dp[0][j]=j;
        }
        int temp=0;
        for(int i=1;i<=m;i++){
            for(int j=1;j<n+1;j++){
                if(X.charAt(i-1)==Y.charAt(j-1)){
                    temp=0;
                }else{
                    temp=1;
                }
                dp[i][j]=Math.min(Math.min(dp[i-1][j-1]+temp,dp[i][j-1]+1),dp[i-1][j]+1);
            }
        }
        return m - dp[m][n];
    }

    //字符串去除空格，返回新的字符串
    public static String delSpace(String str){
        StringBuilder sb=new StringBuilder();
        for(int i=0;i<str.length();i++){
            if(str.charAt(i)!=' '){
                sb.append(str.charAt(i));
            }
        }
        return sb.toString();
    }

    public static double comStrings(String x,String y,int choice){
        x=delSpace(x);
        y=delSpace(y);
        int m=x.length(),n=y.length();
        int sameLength=0;
        if(choice==1) sameLength=lcs(x,y);
        else if(choice==2) sameLength=levenshtein(x,y);
        return (double)sameLength/m;
    }

    public static double calRepeatRate(List<String> code1,List<String> code2,int choice){
        if(code1.size()==0||code2.size()==0) return 0;
        int countAll=0,countRepeat=0;
        for(int i=0;i<code1.size();i++){
            countAll+=code1.get(i).length();
            for(int j=0;j<code2.size();j++){
                int d=code1.get(i).length()-code2.get(j).length();
                if(Math.abs(d)>15) continue;
                double repeatRate=0;
                if(choice==1) repeatRate=comStrings(code1.get(i),code2.get(j),1);
                else if(choice==2) repeatRate=comStrings(code1.get(i),code2.get(j),2);
                if(repeatRate>0.8){
                    countRepeat+=code1.get(i).length();
                    code2.remove(j);
                }
            }
        }
        return (double)countRepeat/countAll;
    }

    //读取单个文件
    public static void readFile(TreeMap<String,List<String>> map, String studentId, String path){
        List<String> list=new ArrayList<>();
        File f=new File(path);
        Scanner sc= null;
        try {
            sc = new Scanner(f);
        } catch (FileNotFoundException e) {
            System.out.println("文件不存在: "+path);
            e.printStackTrace();
        }
        while(sc.hasNextLine()){
            String s = sc.nextLine();
            String finalString=processString(s);
            if(finalString.length()==0||(finalString.length()==2&&finalString.equals(");"))) continue;
            list.add(finalString);
        }
        map.put(studentId,list);
    }
    //多线程环境下读取所有文件夹内所有文件
    public static void readFile2(ConcurrentHashMap<String,List<String>> map, String studentId, String path){
        //List<String> list=new ArrayList<>();
        File f=new File(path);
        List<String> fileList=new ArrayList<>();
        dfs(path,fileList);
//        Scanner sc= null;
//        try {
//            sc = new Scanner(f);
//        } catch (FileNotFoundException e) {
//            System.out.println("文件不存在: "+path);
//            e.printStackTrace();
//        }
//        while(sc.hasNextLine()){
//            String s = sc.nextLine();
//            String finalString=processString(s);
//            if(finalString.length()==0||(finalString.length()==2&&finalString.equals(");"))) continue;
//            list.add(finalString);
//        }
        map.put(studentId,fileList);
    }
    //处理字符串的方法，去掉空格和String
    public static String processString(String s){
        if(s.equals("    ")||s.equals("endmodule")) return "";
        String newS=s.replaceAll(" ","");
        for(int i=0;i<newS.length()-1;i++){
            if(newS.substring(i,i+2).equals("//")){
                return newS.substring(0,i);
            }
        }
        return newS;
    }
    private static ZipArchiveInputStream getZipFile(File zipFile) throws Exception {
        return new ZipArchiveInputStream(new BufferedInputStream(new FileInputStream(zipFile)));
    }

    public static void unZipFile(String src, String descDir) throws IOException {
        File zipFile=new File(src);
        try (ZipArchiveInputStream inputStream = getZipFile(zipFile)) {
            File pathFile = new File(descDir);
            if (!pathFile.exists()) {
                pathFile.mkdirs();
            }
            ZipArchiveEntry entry = null;
            while ((entry = inputStream.getNextZipEntry()) != null) {
                if (entry.isDirectory()) {
                    File directory = new File(descDir, entry.getName());
                    directory.mkdirs();
                } else {
                    OutputStream os = null;
                    try {
                        os = new BufferedOutputStream(new FileOutputStream(new File(descDir, entry.getName())));
                        //输出文件路径信息
                        //LOG.info("解压文件的当前路径为:{}", descDir + entry.getName());
                        IOUtils.copy(inputStream, os);
                    } finally {
                        IOUtils.closeQuietly(os);
                    }
                }
            }

        } catch (Exception e) {
            //LOG.error("[unzip] 解压zip文件出错", e);
        }
    }
    public static void unZipFileOld(String zipPath,String descDir)throws IOException{
        File zipFile=new File(zipPath);
        if(!zipFile.exists()){
            throw new IOException("需解压文件不存在");
        }
        File pathFile=new File(descDir);
        if(!pathFile.exists()){
            pathFile.mkdirs();
        }
        ZipFile zip=new ZipFile(zipFile, Charset.forName("GBK"));
        for (Enumeration entries = zip.entries(); entries.hasMoreElements();) {
            ZipEntry entry = (ZipEntry) entries.nextElement();
            String zipEntryName = entry.getName();
            InputStream in = zip.getInputStream(entry);
            String outPath = (descDir + File.separator + zipEntryName).replaceAll("\\*", "/");
            // 判断路径是否存在,不存在则创建文件路径
            System.out.println(outPath);
            File file = new File(outPath.substring(0, outPath.lastIndexOf('/')));
            if (!file.exists()) {
                file.mkdirs();
            }
            // 判断文件全路径是否为文件夹,如果是上面已经上传,不需要解压
            if (new File(outPath).isDirectory()) {
                continue;
            }
            // 输出文件路径信息
            in.close();
        }
    }
    /**
     * 初始化xls文件，将学生的id填入。
     */
    public static Map<String,HSSFRow> initXlsFile(List<String> list,File f,HSSFWorkbook wholeFile,HSSFSheet result,FileOutputStream os){
        Map<String,HSSFRow> map=new HashMap<>();

        HSSFRow row = result.createRow(0);
        if(row==null) System.out.println("row==null");
        for(int i=1;i<=list.size();i++){
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(list.get(i-1));
            //map.put(list.get(i-1),i);
        }
        for(int i=1;i<=list.size();i++){
            HSSFRow row1 = result.createRow(i);
            row1.createCell(0).setCellValue(list.get(i-1));
            //row1.createCell(1).setCellValue(12312);
            map.put(list.get(i-1),row1);
        }
        return map;
    }
    /**
     * dfs查询一个文件夹内部的所有内容，将他们放在List<String>中
     */
    public static void dfs(String dest,List<String> fileList){
        File ff=new File(dest);
        String[] list = ff.list();
        for(String s:list){
            String path=dest+"\\"+s;
            File f=new File(path);
            if(f.isDirectory()){
                dfs(path,fileList);
            }else if(s.substring(s.length()-2,s.length()).equals(".v")){
                Scanner sc= null;
                try {
                    sc = new Scanner(f);
                } catch (FileNotFoundException e) {
                    System.out.println("文件不存在: "+path);
                    e.printStackTrace();
                }
                while(sc.hasNextLine()){
                    String ss = sc.nextLine();
                    String finalString=processString(ss);
                    if(finalString.length()==0||(finalString.length()==2&&finalString.equals(");"))) continue;
                    fileList.add(finalString);
                }
            }
        }
    }
}
