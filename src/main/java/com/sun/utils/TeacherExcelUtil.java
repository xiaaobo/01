package com.sun.utils;

import com.sun.pojo.Teacher;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

public class TeacherExcelUtil {

    public void InfoExcel(PageBean pb, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<Teacher> list = pb.getList();
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页

        HSSFSheet sheet = wb.createSheet("学生信息表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        //判断该表
        //教师课程学生信息
        if ("courseStu".equalsIgnoreCase(pb.getExcel())){
            titleRow.createCell(0).setCellValue("学号");
            titleRow.createCell(1).setCellValue("姓名");
            titleRow.createCell(2).setCellValue("出生日期");
            titleRow.createCell(3).setCellValue("性别");
            titleRow.createCell(4).setCellValue("电话");
            titleRow.createCell(5).setCellValue("邮箱");
            titleRow.createCell(6).setCellValue("班级");
            titleRow.createCell(7).setCellValue("专业名称");
            titleRow.createCell(8).setCellValue("院系");
            //遍历将数据放到excel列中
            for (Teacher teacher : list) {
                HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
                dataRow.createCell(0).setCellValue(teacher.getStu().getS_id());
                dataRow.createCell(1).setCellValue(teacher.getStu().getS_name());
                dataRow.createCell(2).setCellValue(teacher.getStu().getS_birth());
                dataRow.createCell(3).setCellValue(teacher.getStu().getS_sex());
                dataRow.createCell(4).setCellValue(teacher.getStu().getS_tel());
                dataRow.createCell(5).setCellValue(teacher.getStu().getS_email());
                dataRow.createCell(6).setCellValue(teacher.getT_class().getClass_name());
                dataRow.createCell(7).setCellValue(teacher.getProfession().getP_name());
                dataRow.createCell(8).setCellValue(teacher.getFaculty().getF_name());
            }
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String("教师课程学生信息".getBytes(),"iso-8859-1") + ".xls");
        }
        //教师带领班级学生信息
        if ("classStu".equalsIgnoreCase(pb.getExcel())) {
            titleRow.createCell(0).setCellValue("学号");
            titleRow.createCell(1).setCellValue("姓名");
            titleRow.createCell(2).setCellValue("出生日期");
            titleRow.createCell(3).setCellValue("性别");
            titleRow.createCell(4).setCellValue("电话");
            titleRow.createCell(5).setCellValue("邮箱");
           /* titleRow.createCell(6).setCellValue("班级");*/
            //遍历将数据放到excel列中
            for (Teacher teacher : list) {
                HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
                dataRow.createCell(0).setCellValue(teacher.getStu().getS_id());
                dataRow.createCell(1).setCellValue(teacher.getStu().getS_name());
                dataRow.createCell(2).setCellValue(teacher.getStu().getS_birth());
                dataRow.createCell(3).setCellValue(teacher.getStu().getS_sex());
                dataRow.createCell(4).setCellValue(teacher.getStu().getS_tel());
                dataRow.createCell(5).setCellValue(teacher.getStu().getS_email());
               /* dataRow.createCell(6).setCellValue(teacher.getT_class().getClass_name());*/
            }
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String("教师带领班级学生信息".getBytes(),"iso-8859-1") + ".xls");
        }
        //教师课程学生成绩
        if ("courseStuRank".equalsIgnoreCase(pb.getExcel())) {
            titleRow.createCell(0).setCellValue("学号");
            titleRow.createCell(1).setCellValue("姓名");
            titleRow.createCell(2).setCellValue("班级");
            titleRow.createCell(3).setCellValue("分数");
            titleRow.createCell(4).setCellValue("学分");
            titleRow.createCell(5).setCellValue("排名");
            for (Teacher teacher : list) {
                HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
                dataRow.createCell(0).setCellValue(teacher.getStu().getS_id());
                dataRow.createCell(1).setCellValue(teacher.getStu().getS_name());;
                dataRow.createCell(2).setCellValue(teacher.getT_class().getClass_name());
                dataRow.createCell(3).setCellValue(teacher.getScore().getS_score());
                dataRow.createCell(4).setCellValue(teacher.getCourse().getCredit());
                dataRow.createCell(5).setCellValue(teacher.getScore().getRank());
            }
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String("教师课程学生成绩".getBytes(),"iso-8859-1") + ".xls");
        }
        //教师带领班级成绩
        if ("classStuRank".equalsIgnoreCase(pb.getExcel())) {
            titleRow.createCell(0).setCellValue("学号");
            titleRow.createCell(1).setCellValue("姓名");
            titleRow.createCell(2).setCellValue("授课老师");
            titleRow.createCell(3).setCellValue("课程");
            titleRow.createCell(4).setCellValue("分数");
            titleRow.createCell(5).setCellValue("学分");
            titleRow.createCell(6).setCellValue("排名");
            for (Teacher teacher : list) {
                HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
                dataRow.createCell(0).setCellValue(teacher.getStu().getS_id());
                dataRow.createCell(1).setCellValue(teacher.getStu().getS_name());
                dataRow.createCell(2).setCellValue(teacher.getT_name());
                dataRow.createCell(3).setCellValue(teacher.getCourse().getC_name());
                dataRow.createCell(4).setCellValue(teacher.getScore().getS_score());
                dataRow.createCell(5).setCellValue(teacher.getCourse().getCredit());
                dataRow.createCell(6).setCellValue(teacher.getScore().getRank());
            }
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String("教师带领班级成绩".getBytes(),"iso-8859-1") + ".xls");
        }
        //教师带领班级平均成绩
        if ("classStuAvgRank".equalsIgnoreCase(pb.getExcel())) {
            titleRow.createCell(0).setCellValue("学号");
            titleRow.createCell(1).setCellValue("姓名");
            titleRow.createCell(2).setCellValue("平均分");
            titleRow.createCell(3).setCellValue("排名");
            for (Teacher teacher : list) {
                HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
                dataRow.createCell(0).setCellValue(teacher.getStu().getS_id());
                dataRow.createCell(1).setCellValue(teacher.getStu().getS_name());
                dataRow.createCell(2).setCellValue(teacher.getScore().getS_score());
                dataRow.createCell(3).setCellValue(teacher.getScore().getRank());
            }
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String("教师带领班级平均成绩".getBytes(),"iso-8859-1") + ".xls");
        }
        //教师带领班级总成绩
        if ("classStuSumRank".equalsIgnoreCase(pb.getExcel())) {
            titleRow.createCell(0).setCellValue("学号");
            titleRow.createCell(1).setCellValue("姓名");
            titleRow.createCell(2).setCellValue("课程数量");
            titleRow.createCell(3).setCellValue("总分");
            titleRow.createCell(4).setCellValue("排名");
            for (Teacher teacher : list) {
                HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
                dataRow.createCell(0).setCellValue(teacher.getStu().getS_id());
                dataRow.createCell(1).setCellValue(teacher.getStu().getS_name());
                dataRow.createCell(2).setCellValue(teacher.getScore().getCount());
                dataRow.createCell(3).setCellValue(teacher.getScore().getS_score());
                dataRow.createCell(4).setCellValue(teacher.getScore().getRank());
            }
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String("教师带领班级总成绩".getBytes(),"iso-8859-1") + ".xls");
        }

        OutputStream os = response.getOutputStream();
        wb.write(os);
        os.flush();
        os.close();


    }
}
