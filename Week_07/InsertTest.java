package com.example.demo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertTest {

    public static void main(String[] args) throws Exception{
        InsertTest test =   new InsertTest();
        //test.addOne();// 100000数据 单条执行 耗时321984毫秒
        //test.batchInsert();// 100000数据 每批1000条执行 耗时143375毫秒，性能提高不明显
        // 望老师指点，还能怎样提高性能

    }
    public void addOne() throws SQLException {
        //获取连接
        Connection conn = DbUtil.getConnection();
        //sql
        String sql = "INSERT INTO shop_order" +
                "(user_id, amount, state)" +
                "VALUES(?,?,?);";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql); //预编译SQL，减少sql执行

            long start = System.currentTimeMillis();
            for(int i=0;i<100000;i++){
                //预编译
                //传参
                ptmt.setLong(1, 1);
                ptmt.setInt(2, 1000);
                ptmt.setInt(3, 1);

                //执行
                ptmt.execute();
            }
            System.out.println(System.currentTimeMillis() - start);
            // 10 万数据，一次拿连接，一次预编  依次插入   321984

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public void batchInsert() throws SQLException {
        //获取连接
        Connection conn = DbUtil.getConnection();
        //sql
        String sql = "INSERT INTO shop_order" +
                "(user_id, amount, state)" +
                "VALUES(?,?,?);";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql); //预编译SQL，减少sql执行
            conn.setAutoCommit(false);

            long start = System.currentTimeMillis();
            for(int i=0;i<100000;i++){
                //预编译
                //传参
                ptmt.setLong(1, 1);
                ptmt.setInt(2, 1000);
                ptmt.setInt(3, 1);
                ptmt.addBatch();
                if(i%1000 == 0){
                    ptmt.executeBatch();
                }
                //执行
            }
            ptmt.executeBatch();
            conn.commit();
            System.out.println(System.currentTimeMillis() - start);
            // 批量  143375

            ptmt.close();
            conn.close();

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
