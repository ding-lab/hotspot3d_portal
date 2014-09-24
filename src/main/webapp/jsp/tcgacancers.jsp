

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> 3D Mutation Proximity System in TGI </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/nbf.css" rel="stylesheet" type="text/css">

</HEAD>

<BODY>

<br><br><br>
<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="135">
  <TBODY>
  <TR vAlign=top>
    <TD width=77 height="102">&nbsp;</TD>
    <TD width=644 height="102"><FONT face="Arial, Helvectica, sans-serif" size=6><B> 3D Mutation <I><U><FONT COLOR="#800000">Proximity</U></I></FONT> Visualization Portal</B></FONT><BR><br>            
    
<% java.util.Date date = new java.util.Date(); %>
<FONT face="Arial, Helvectica, sans-serif" size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
</TR>
  
<TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
      </font><font size="1">&gt;&gt;&nbsp; <a href="tcgacancers.jsp">TCGA cancers List</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>
</table>

<% 
   ResultSet rs=null; 
   String sql = "select * from TCGA_cancers";
   rs = submitjobBean.executeQuery(sql);
%>

<table border="0" width="600" height="21" align="center">
    <tr>
        <td width="60" height="30" align="left">
            <font size="3" ><I><B>Cancer type</B></I></font><br><br>
        </td>
        <td width="200" height="30" align="left">
            <font size="3" ><I><B>Detail information</B></I></font><br><br>
        </td>

        <td width="60" height="30" align="left">
            <font size="3" ><I><B>Number of mutations</B></I></font><br><br>
        </td>

        <td width="60" height="30" align="left">
            <font size="3" ><I><B>Number of close pairs</B></I></font><br><br>
        </td>

    </tr>

<% while(rs.next()) { %>

    <tr>
        <td width="60" height="20" align="left">
            <font size="2" ><I><a href=singlecancer.jsp?cancer=<%=rs.getString(1)%>><%=rs.getString(1)%></a></I></font>
        </td>
        <td width="200" height="20" align="left">
            <font size="2" ><I><%=rs.getString(2)%></I></font>
        </td>
        <td width="60" height="20" align="left">
            <font size="2" ><I><%=rs.getString(3)%></I></font>
        </td>
        <td width="60" height="20" align="left">
            <font size="2" ><I><%=rs.getString(4)%></I></font>
        </td>
    </tr>

<% } 
submitjobBean.close();
%> 

</table>

<p></p>
<br><br>

<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="20">
  <TR vAlign=top>
    <TD width="737" height="1">
      <hr width="80%" color="#008080">
    </TD>
  </TR>
</table>

<table border="0" width="757" height="2" align="center">
  <tr>
    <td width="100%" height="1" align="center">
       <FONT face="Arial, Helvetica, sans-serif" size=2>Copyrignt? Ding lab in TGI Washington University at St. Louis.</font></td> 
  </tr>
</table>

</body>
</html>

