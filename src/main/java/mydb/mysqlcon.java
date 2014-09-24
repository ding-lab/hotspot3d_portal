
package mydb;

import java.sql.*;

public class mysqlcon {

    String sConnStr = "jdbc:mysql://localhost/3d_proximity";
    Connection con = null;
    ResultSet rs = null;

    public mysqlcon()
    {

        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            //Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e)
        {
            System.out.println("Driver Not Found: ");
            System.out.println(e.getMessage());
        }

    }


 // ------- Query ------

    public ResultSet executeQuery(String sql)
    {
        rs = null;

        try
        {
            con = DriverManager.getConnection(sConnStr, "3d_proximity", "3d_pr0x1m1ty");

            Statement stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
           
          //stmt.close();
          //con.close();

        }

        catch (Exception ex)
        {
            System.out.println("wrong: ");
            System.out.println(ex.getMessage());
        }

        return rs;
        
    }
    
  
 // ------- Insert ------

    public int executeUpdate(String sql)
    {
        
        int r = 0;
        
        try
        {
            con = DriverManager.getConnection(sConnStr, "3d_proximity", "3d_pr0x1m1ty");
            Statement stmt = con.createStatement();
            r = stmt.executeUpdate(sql);
           
            stmt.close();
            con.close();
        }
        
        catch (Exception ex)
        {
            System.out.println("wrong: ");
            System.out.println(ex.getMessage());
        }

        return r;
    }

 // ------- Close ------
    
    public void close()
    {
        try
        {
            if (rs != null)
            {
                rs.close(); 
            }
            
            con.close();
        }
        
        catch(Exception ex)
        {
            System.out.println(" close failed! ");
            System.out.println(ex.getMessage());
        }
    }



}


