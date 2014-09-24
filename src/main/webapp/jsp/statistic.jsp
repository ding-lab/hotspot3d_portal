

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Genome Statistic</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/nbf.css" rel="stylesheet" type="text/css">

</HEAD>

<BODY>

<br><br><br>
<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="135">
  <TBODY>
  <TR vAlign=top>
    <TD width=77 height="102">&nbsp;</TD>
    <TD width=644 height="102"><font face="Arial, Helvectica, sans-serif" size="6"><b>
      Published <I><U><FONT COLOR="#800000">Genomes</U></I></FONT> Statistic information  </b></font><BR><br>            
    
<% java.util.Date date = new java.util.Date(); %>
	<FONT face="Arial, Helvectica, sans-serif" 
      size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
	  
  </TR>
  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
      </font><font size="1">&gt;&gt;&nbsp; <a href="statistic.jsp">Genome Statistic</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>
</table>

<table border="0" width="500" height="21" align="center">
  <FORM action="statistic.jsp" method="post">
      <tr>
        <td>
 <font size="2">&nbsp;&nbsp;&nbsp;&nbsp;category:&nbsp;</font><input type="radio" value="Archaea" name="category">&nbsp;&nbsp;&nbsp;            
 <font size="2">Archaea</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="Bacteria" name="category">&nbsp;&nbsp;&nbsp;            
 <font size="2">Bacteria</font>&nbsp;&nbsp;&nbsp; <input type="radio" value="Eukaryota" name="category">&nbsp;&nbsp;       <font size="2">Eukaryota</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=submit value=Submit >
     			
	  </td> 
   </tr>
   </form>
</table>

<br><br><br>

<% 
  
   String category = request.getParameter("category"); 
   ResultSet rs=null; 
   if( category != null ){

         String sql = "select * from genome where category = '"+category+"'";  
		 rs = submitjobBean.executeQuery(sql);
  
  }else{ 
    
	    String sql = "select * from genome";
   	    rs = submitjobBean.executeQuery(sql);
	
	   }
	
  %>

<table border="0" width="450" height="21" align="center">

<% while(rs.next()) { %> 
	 <tr>
     
      <td width="450" height="20" align="left">

		<font size="2" color="#FF0000"><I><%=rs.getString(3)%></I></font>
		<font size="2" ><I><a href=<%=rs.getString(6)%>><%=rs.getString(4)%></a></I></font><br>

	  </td>
     </tr>
	<tr></tr>
   	
<%}

 submitjobBean.close();

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

