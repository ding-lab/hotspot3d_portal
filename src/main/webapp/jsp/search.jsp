<%@ page contentType="text/html;charset=GB2312" %>
<%@ page language="java" import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> 3D Mutation Proximity System </TITLE>
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
	<FONT face="Arial, Helvectica, sans-serif" 
      size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
	  
  </TR>
  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
      </font><font size="1">&gt;&gt;&nbsp; <a href="search.jsp">Search</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<table border="0" width="500" align="center">
    <FORM action="searchresult.jsp" method="post">
  <tr>
    <td width="100%" align="left">

      <p><font size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TCGA Cancers:&nbsp;&nbsp;&nbsp; </b></font>

      <select name="cancers">
          <option value="all">All cancers</option>
          <option value="blca">blca</option>
          <option value="brca">brca</option>
          <option value="cesc">cesc</option>
          <option value="coadread">coadread</option>
          <option value="gbm">gbm</option>
          <option value="kirc">kirc</option>
          <option value="laml">laml</option>
          <option value="luad">luad</option>
          <option value="lusc">lusc</option>
          <option value="ov">ov</option>
          <option value="prad">prad</option>
          <option value="stad">stad</option>
          <option value="ucec">ucec</option>
          <option value="hnsc">hnsc</option>
          <option value="kirp">kirp</option>
          <option value="lgg">lgg</option>
          <option value="paad">paad</option>
          <option value="skcm">skcm</option>
          <option value="thca">thca</option>
      </select>
      </p>

      <p><font size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interaction Type:&nbsp;&nbsp;&nbsp; </b></font>
      <input type="radio" value="1"  checked name="interaction">&nbsp;&nbsp;&nbsp;<font size="2">Protein complex</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" value="0"  name="interaction">&nbsp;&nbsp;&nbsp;
      <font size="2">One protein</font>&nbsp;&nbsp;&nbsp;
      </p>
      <p><font size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HUGO Gene Name:&nbsp; </b></font><input type="text" name="gene" size="8" value="TCEB1" style="border: 1 solid #0099FF"></p>

      <p><font size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Maximal 3D Distance:&nbsp; </b></font><input type="text" name="sdis" size="8" value="10" style="border: 1 solid #0099FF"></p>

      <p><font size="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Maximal P-value:&nbsp; </b></font><input type="text" name="pvalue" size="8" value="0.0001" style="border: 1 solid #0099FF"></p>          

      <p> &nbsp;</p>
      <p align="center"><INPUT type=submit value=Submit >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <INPUT type=reset value=Reset>　</p>

    </td>
  </tr>
  </form>

</table>

<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="20">
    <TR vAlign=top><TD width="737" height="1">
      <hr width="80%" color="#008080">
      </TD>
    </TR>
</table>

<table border="0" width="757" height="2" align="center">
  <tr>
    <td width="100%" height="1" align="center"><FONT face="Arial, Helvetica, sans-serif" size=2>Copyrignt? Ding lab in TGI Washington University at St. Louis.</font></td> 
  </tr>
</table>


</body>
</html>

