/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Contact;
import java.sql.*;
/**
 *
 * @author ayush
 */
public class ContactDao {
    private final Connection con;

    public ContactDao(Connection con) {
        this.con = con;
    }
    public boolean saveMessage(Contact mssg){
        boolean f=false;
        try{
            String query="insert into message(name,email,subject,content) values(?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, mssg.getName());
            pstmt.setString(2, mssg.getEmail());
            pstmt.setString(3, mssg.getSubject());
          
            pstmt.setString(4, mssg.getMessage());
            pstmt.executeUpdate();
            f = true;
        }catch(Exception e){
            e.printStackTrace();
            
        }
        return f;
    }
}
