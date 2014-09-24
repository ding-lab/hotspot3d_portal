

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*,java.util.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Put Genome Data in database</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/nbf.css" rel="stylesheet" type="text/css">

</HEAD>

<BODY>

<br><br><br>
<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="135">
  <TBODY>
  <TR vAlign=top>
    <TD width=77 height="102">&nbsp;</TD>
    <TD width=644 height="102"><font face="Arial, Helvectica, sans-serif" size="6"><b>All 
      Published <I><U><FONT COLOR="#800000">Genomes</U></I></FONT>  information System 
      in ScBioGrid</b></font><BR><br>            
    
<% java.util.Date date = new java.util.Date(); %>
	<FONT face="Arial, Helvectica, sans-serif" 
      size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
	  
  </TR>
  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
      </font><font size="1">&gt;&gt;&nbsp; <a href="insert.jsp">For 
      administrator</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<br><br><br>

<%
  
	String category = request.getParameter("category");
	String serialnum = request.getParameter("serialnum");
	String name = request.getParameter("name");
	String lineage = request.getParameter("lineage");
    int levelint = countBean.getCount(lineage,";");
    String level = String.valueOf(levelint); 
	String link = request.getParameter("link");
	
    String sql = "insert into genome(level,category,serialnum,name,lineage,link) values('" + level +"','" + category + "','" + serialnum + "','" + name + "','" + lineage + "','" + link + "')";
  
    int i = submitjobBean.executeUpdate(sql);

    submitjobBean.close();
    
%>

<table border="0" width="681" height="21" align="center">
  <tr>
    <!-- 
	<td width="673" height="20" align="center"><font size="3" color=#FF3300><B><I><%//=name%></I></B></font><font size="3"> &nbsp;&nbsp;has been put in database !</font> </td> 
	 -->
    <td width="673" height="20" align="center"><font size="3" color=#FF3300><font size="2"><I> Sorry , only for administrator !</I></font> </td> 

  </tr>
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

