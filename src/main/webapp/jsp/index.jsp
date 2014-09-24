

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> 3D Mutation Proximity System </TITLE>
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
      size=2 COLOR="#66CCFF"><B><%=date%></B></FONT></TD>

  </TR>

  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<table cellSpacing=3 cellPadding=5 width=783 align=center border=0 height="20">
  <tr>
    <td width="107" height="8"><a href="./index.jsp"><font size="4"><i>Home</i></font></a></td>
    <td width="640" height="8"><font size="3"><b>Welcome and Introduction!!!</b></font></td>
  </tr>
</table>

<table cellSpacing=3 cellPadding=5 width=837 align=center border=0>
  <tr>
    <td width="161" height="168" valign=top>
      <table border="0" width="115%" height="100">
        <tr>
            <td width="50%" ><a href="./tcgacancers.jsp"><b><font size="2">TCGA Cancers List</font></b></a></td>
        </tr>
        <tr>
            <td width="50%" ><font size="2"><b><a href="./cosmic.jsp">COSMIC database</a></b></font></td>  
        </tr>
        <tr>
            <td width="50%" ><a href="./search.jsp"><b><font size="2">Search</font></b></a></td>
        </tr>
        <tr>
            <td width="50%" ><a href="./insert.jsp"><b><font size="2">User Input</font></b></a></td>
        </tr>
        <tr>
            <td width="50%" ><a href="./insert.jsp"><b><font size="2">For administrator</font></b></a></td>
        </tr>

        <tr>
            <td width="50%" ></td>
        </tr>
		
      </table>
      
      　</td>

    <td width="640" height="100"> 
      <p><FONT 
            face="Arial, Helvetica, sans-serif" size=2>&nbsp;&nbsp;&nbsp; 3D mutation proximity visualization portal, is a World Wide Web resource for comprehensive access to the 3D proximity information of cancer mutations regarding complete and ongoing cancer genomic projects around the world. We provides the largest available and most detailed monitoring of cancer genomics projects.     
      </font></p>
      <p><font size="2"><b>Example:&nbsp; &nbsp;</b> chr18 48591846 </font> 
      <FORM action="singlevariant.jsp" method="post">
          <p><TEXTAREA cols=40 name=link rows=2 row="2" style="border: 1 solid #0099FF"></TEXTAREA></p> 

          <input type="checkbox" name="onevariant" value=""><font size="2">hg18</font><br>
          <p> </p>
      <INPUT type=submit value=Submit >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      &nbsp; <INPUT type=reset value=Reset>　</p>
  
  </form>

    </td>
  </tr>

<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="20">
  <TR vAlign=top>
    <TD width="737" height="1">
      <hr width="80%" color="#008080">
    </TD>
  </TR>
</table>
<table border="0" width="757" height="2" align="center">
  <tr>
    <td width="100%" height="1" align="center"><FONT 
            face="Arial, Helvetica, sans-serif" size=2>Copyrignt? Ding lab in TGI Washington University at St. Louis.</font></td>
  </tr>
</table>

<% 
/*
Connection conn; 
java.lang.String strConn; 

Class.forName("org.gjt.mm.mysql.Driver").newInstance(); 
conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","98101120"); 
Statement stmt=conn.createStatement(); 
ResultSet rs=null; 
rs=stmt.executeQuery("select * from genome");

rs.close(); 
stmt.close(); 
conn.close(); 
*/
%> 

</body>
</html>
