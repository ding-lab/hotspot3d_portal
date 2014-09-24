

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Visualization of 3D proximity results</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/nbf.css" rel="stylesheet" type="text/css">

</HEAD>

<BODY >

<br><br><br>
<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="135">
  <TBODY>
  <TR vAlign=top>
    <TD width=77 height="102">&nbsp;</TD>
    <TD width=644 height="102"><FONT face="Arial, Helvectica, sans-serif" size=6><B> 3D Mutation <I><U><FONT COLOR="#800000">Proximity</U></I></FONT> Visualization Portal</B></FONT><BR><br>            
<% java.util.Date date = new java.util.Date(); %>
	<FONT face="Arial, Helvectica, sans-serif" 
      size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
	  
  </TR>
  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
      </font><font size="1">&gt;&gt;&nbsp; <a href="insert.jsp">User Input</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<table border="0" width="500" align="center">
<FORM action="doinsert.jsp" method="post">
  <tr>
    <td width="100%" align="left">
        <p><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;<b>Upload 3D proximity analysis results for visualization: </font><input type="file" name="name" size="40" style="border: 1 solid #0099FF"></b></p> 
        <p> -- OR -- </p>        
	  <p>&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><b> Input here:&nbsp; &nbsp;</b></font><TEXTAREA cols=58 name=link rows=2 row="2" style="border: 1 solid #0099FF"></TEXTAREA></p> 

      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <INPUT type=submit value=Submit >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      &nbsp; <INPUT type=reset value=Reset>　</p>
    </td>
  </tr>
  </form>

</table>



<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="20">
  <TR vAlign=top><TD width="737" height="1">
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<table border="0" width="757" height="2" align="center">
  <tr>
    <td width="100%" height="1" align="center"><FONT 
            face="Arial, Helvetica, sans-serif" size=2>Copyrignt? Ding lab in TGI Washington University at St. Louis.</font></td>
  </tr>
</table>


</body>
</html>

