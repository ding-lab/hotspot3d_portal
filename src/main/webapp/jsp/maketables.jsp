

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Genome Information</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/nbf.css" rel="stylesheet" type="text/css">

</HEAD>

<BODY>

<br><br><br>
<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="135">
  <TBODY>
  <TR vAlign=top>
    <TD width=77 height="80">&nbsp;</TD>
    <TD width=644 height="80"><font face="Arial, Helvectica, sans-serif" size="6"><b>Published <I><U><FONT COLOR="#800000">Genomes</U></I></FONT>  Levels Information </b></font><BR><br>            
<% java.util.Date date = new java.util.Date(); %>
	<FONT face="Arial, Helvectica, sans-serif" 
      size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
  </TR>
  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
      </font><font size="1">&gt;&gt;&nbsp; <a href="groups.jsp">Genome Levels</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<table border="0" width="550" height="21" align="center">
  <FORM action="groups.jsp" method="post">
      <tr>
        <td>
 <font size="2">&nbsp;Levels:&nbsp;</font><input type="text" name="level" size="3" style="border: 1 solid #0099FF">
 <font size="2">&nbsp;&nbsp;&nbsp;&nbsp;category:&nbsp;</font><input type="radio" value="Archaea"  name="category">&nbsp;&nbsp;&nbsp;            
 <font size="2">Archaea</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="Bacteria" name="category">&nbsp;&nbsp;&nbsp;            
 <font size="2">Bacteria</font>&nbsp;&nbsp;&nbsp; <input type="radio" value="Eukaryota" name="category">&nbsp;&nbsp;       <font size="2">Eukaryota</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=submit value=Submit >
	  </td> 
   </tr>
  </form>
</table>

<br><br><br>

<% 
   
 //  String category = request.getParameter("category");
 //  不同的级别得到不同级别的表  
 //   

     String level = "38";
 
 //  String level1 = "level" + level;   // 对全部的 genomes
 //  String level1 = "alevel" + level;  // 对 Archaea genomes  共
 //  String level1 = "blevel" + level;  // 对 Bacteria genomes
   String level1 = "elevel" + level;  // 对 Eukaryota genomes
  
   ResultSet rs=null; 
   ResultSet rs1=null;

    //String sql = "select * from genome";
 
 // String sql = "select * from genome where category = 'Archaea'";
 // String sql = "select * from genome where category = 'Bacteria'";
    String sql = "select * from genome where category = 'Eukaryota'";


   rs = submitjobBean.executeQuery(sql); 

   while(rs.next())
     {
	   
	 if ( Integer.parseInt(rs.getString(1))  <=  Integer.parseInt(level) ){  

         String sql1 = "insert into "+level1+"(lineage,genomes) values('"+rs.getString(5)+"','"+rs.getString(3)+";"+"')";
         int i = submitjobBean.executeUpdate(sql1);
        // submitjobBean.close();

	       }else{
            
		    String[] arr = countBean.getArray(rs.getString(5),";");
			String lineage = null;
			for (int j=0;j<Integer.parseInt(level);j++)
		      {
				if (j == 0){ lineage = arr[j];} else{ lineage = lineage + arr[j]; }
				lineage = lineage + ";";
			  }
		
			%>
            <%=level1%><%=lineage%>
			 
			<%

            String sql2 = " select * from "+level1+" where lineage = '"+lineage+"'";
            rs1 = submitjobBean.executeQuery(sql2);

            if ( !rs1.next()) {
				
    						   String group = rs.getString(3) + ";";

							   %>
                               <%=group%>
                         	   <%
                              
							   String sql3 = "insert into "+level1+"(lineage,genomes) values('"+lineage+"','"+group+"')";
                               int k = submitjobBean.executeUpdate(sql3);
		                       submitjobBean.close();

			                   }else{
								  								  			  
                                    String group1 = rs.getString(3) + ";";
                                    String group2 = rs1.getString(2) + group1;
							        String sql4 = "update "+level1+" set genomes = '"+group2+"' where lineage = '"+lineage+"'";
                                    int l = submitjobBean.executeUpdate(sql4);
                                    submitjobBean.close();

							   }
               submitjobBean.close();
	          }  
	     }
       submitjobBean.close();

   // String sqldelete = "delete from "+level2+"";
    //submitjobBean.executeUpdate(sqldelete); 
  
  %>
</table>
<p></p>
<br><br>

<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="20">
  <TR vAlign=top><TD width="737" height="1">
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<table border="0" width="757" height="2" align="center">
  <tr>
    <td width="100%" height="1" align="center"><FONT 
            face="Arial, Helvetica, sans-serif" size=2>Copyrignt? Bioinformatics Group in SCCAS.</font></td> 
  </tr>
</table>

</body>
</html>
