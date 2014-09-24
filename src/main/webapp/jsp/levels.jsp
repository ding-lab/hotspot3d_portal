

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Genome Levels Information</TITLE>
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
      </font><font size="1">&gt;&gt;&nbsp; <a href="levels.jsp">Genome Levels</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<br><br>

<table cellSpacing=3 cellPadding=5 width=537 align=center border=0 height="20">
<tr><td align=center>
<FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="5"><i>Every Level Groups</I></FONT>
</td></tr>
</table>
<br>
<table cellSpacing=3 cellPadding=5 width=537 align=center border=0 height="182">
  <tr>
    <td width="200" height="168">
      
      <table border="0" width="115%" height="184">
        <tr>
          <td width="50%" height="30"><a href="./alllevels.jsp"><b><font size="2">All Genomes Levels</font></b></a></td>
        </tr>
        <tr>
          <td width="50%" height="30"><a href="./elevels.jsp"><b><font size="2">Eukaryota  Genomes Levels</a></b></font></td>  
        </tr>
        <tr>
    <td width="50%" height="29"><a href="./blevels.jsp"><b><font size="2">Bacteria Genomes Levels</font></b></a></td>
        </tr>
        <tr>
   <td width="50%" height="29"><a href="./alevels.jsp"><b><font size="2">Archaea Genomes Levels</font></b></a></td>
        </tr>
		
        <tr>
          <td width="50%" height="29"></td>
        </tr>
		
      </table>
      
      　</td>
    <td width="300" height="168">　<FONT size=2>&nbsp;</font><font size="2">&nbsp; 
      </font><FONT 
            face="Arial, Helvetica, sans-serif" size=2>All genomes will be divided three categories,<p>Archaea, Bacteria, Eukaryota for displaying </p>detailedly except as the whole. 
			<br>    
     
      </font>
      
	  <p>&nbsp;</p>
      <p>&nbsp;</p>
	 
    </td>
  </tr>
</table>


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
