
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
        <script src="../jmol/Jmol.js" type="text/javascript"></script>
    </HEAD>
    
    <!-- show jmol panel for choosed pair  -->
    
    <% 
        String rownum = request.getParameter("rowkey");
        ResultSet rs = null;

        rownum = "1581";

        // select based on row number | primary key
        String sql = "select * from run_10aa_10AA where rownum = '"+rownum+"'";
        rs = submitjobBean.executeQuery(sql);

        // pair info 
        String gene1 = "";
        String gene2 = "";
        String pdbcon1 = "";
        String pdbcon2 = "";
        String aac1 = "";
        String aac2 = "";
        String type1 = "";
        String type2 = "";
        String chain1 = "";
        String chain2 = "";
        String domain1 = "";
        String domain2 = "";
        
        String pdbid = "";
        String sdis = "";
        String ld = "";
        
        String cancer = "";
        String cancerinfo = "";
        
        if (rs.next())
        {
            gene1   = rs.getString(1);
            pdbcon1 = rs.getString(2);
            aac1    = rs.getString(3);
            type1   = rs.getString(4);
            chain1  = rs.getString(5);
            domain1 = rs.getString(6);

            gene2   = rs.getString(7);
            pdbcon2 = rs.getString(8);
            aac2    = rs.getString(9);
            type2   = rs.getString(10);
            chain2  = rs.getString(11);
            domain2 = rs.getString(12);

            pdbid   = rs.getString(13);
            sdis    = rs.getString(14);
            ld      = rs.getString(15);
            cancer  = rs.getString(16);
            cancerinfo = rs.getString(17);
        } 

        // search close to gene1
        ResultSet rs1 = null;
        String sql1 = "select * from run_10aa_10AA where (gene1 = '"+gene1+"' AND pdbcon1 = '"+pdbcon1+"') OR (gene2 = '"+gene1+"' AND pdbcon2 = '"+pdbcon1+"')";
        rs1 = submitjobBean.executeQuery(sql1);

        // search close to gene2
        ResultSet rs2 = null;
        String sql2 = "select * from run_10aa_10AA where (gene1 = '"+gene2+"' AND pdbcon1 = '"+pdbcon2+"') OR (gene2 = '"+gene2+"' AND pdbcon2 = '"+pdbcon2+"')";
        rs2 = submitjobBean.executeQuery(sql2);

    %>

<BODY>
    <br>
    <br>
    <br>
    <table id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0>
        <tr vAlign=top>
            <td width=77 height="80">&nbsp;</td>
            <td width=644 height="80">
                <font face="Arial, Helvectica, sans-serif" size="6">
                    <b><I><U><font COLOR="#800000"> 3D </U></I></font> Structure Portal </b>
                </font>
                <br><br>
        </tr>
        <tr vAlign=top>
            <td colSpan=2 width="737" height="5">
                <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp;</font>
                <font size="1">&gt;&gt;&nbsp; <a href="tcgacancers.jsp">TCGA cancers List</a>&nbsp;</font>
                <hr width="80%" color="#008080">
            </td>
        </tr>
    </table>
    <br>
    
    <table border="0" width="1000" height="21" align="center">
        <tr>
            <td valign="top">
                <p><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="3"><i><B><%=cancerinfo%></B> </I></FONT></p>
                <p><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="2"><i>pdbid: <%=pdbid%></I></FONT></p>
                <form>
                    <div style="width:400px; height:400px; background-color:#008080; resize:both; overflow:hidden; padding:6px; float:left;">
                        <script type="text/javascript">
                            jmolInitialize("../jmol");
                            jmolApplet("100%", "load ../jmol/models/<%=pdbid%>.pdb; set antialiasdisplay true; background white; wireframe off; spacefill off; cartoons; color structure; select <%=pdbcon1%>:<%=chain1%>; spacefill; color [138,255,0];");
                        </script>
                    </div>
                </form>
                
                <form>
                    <script type="text/javascript">
                        jmolHtml("<font size = 2>");
                        jmolRadioGroup(
                            [
                            ["select <%=pdbcon1%>:<%=chain1%>; spacefill off", "off"],
                            ["select <%=pdbcon1%>:<%=chain1%>; spacefill 20%", "20%"],
                            ["select <%=pdbcon1%>:<%=chain1%>; spacefill 100%","100%","checked"]
                            ], "<font size =2 >"
                       );

                       jmolBr();
                   
                       jmolHtml("mutation style:");
                       jmolBr();
                       jmolRadioGroup(
                               [
                               ["select <%=pdbcon1%>:<%=chain1%>; spacefill; color[138,255,0]", "default"],
                               ["select <%=pdbcon1%>:<%=chain1%>; wireframe 10; spacefill; color cpk", "wireframe"],
                               ["select <%=pdbcon1%>:<%=chain1%>; dots", "dots"]
                               ]
                       );
                   
                       jmolBr();
                   
                       jmolHtml("labels:");
                       jmolBr();
                       jmolCheckbox("select <%=pdbcon1%>:<%=chain1%>.CA; font label 20; color label black; set labelfront; label <%=aac1%>;",  "label off", "<%=aac1%>");
                   
                       jmolBr();
                       jmolBr();
                       jmolHtml("chain <%=chain1%>: ");
                        jmolMenu([
                         ["select :<%=chain1%>; color white", "white"],
                         ["select :<%=chain1%>; color skyblue", "skyblue", "selected"],
                         ["select :<%=chain1%>; color  yellow","yellow"],
                         ["select :<%=chain1%>; color  salmon","salmon"],
                         ["select :<%=chain1%>; color  palegreen","palegreen"],
                         ["select :<%=chain1%>; color  black","black"]
                         ]);
                   
                   
                       jmolBr();
                       jmolBr();
                   
                       jmolHtml("backgroud: ");
                        jmolMenu([
                         ["background white","white", "selected"],
                         ["background skyblue", "skyblue"],
                         ["background yellow", "yellow"],
                         ["background salmon", "salmon"],
                         ["background palegreen", "palegreen"],
                         ["background black", "black"]
                         ]);
                   
                       jmolBr();
                   
                       jmolHtml("  all chains: ");
                        jmolMenu([
                         ["select all; color white","white"], 
                         ["select all; color skyblue", "skyblue", "selected"],
                         ["select all; color  yellow", "yellow"],
                         ["select all; color  salmon", "salmon"],
                         ["select all; color  palegreen", "palegreen"],
                         ["select all; color  black","black"]
                         ]);
                    </script>
                </form>
            </td>

            <td align="left" valign="top">

                <table width="600" border="0">
                    <tr>
                        <td colspan=6><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="3"><i><B>Mutation</B></I></FONT></td>
                    </tr>
                    <tr>
                        <td width=30><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="2"><%=gene1%></td>
                        <td width=20><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="2"><%=pdbcon1%></td>
                        <td width=20><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="2"><%=aac1%></td>
                        <td width=20><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="2"><%=type1%></td>
                        <td width=10><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="2"><%=chain1%></td>
                        <td width=200><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="2"><%=domain1%></td>
                    </tr>
                    <tr> <td colspan = 6 > &nbsp; </td></tr>
                    <tr>
                        <td colspan=6><FONT COLOR="#800000" face="Arial, Helvectica, sans-serif" size="3"><i><B>Close to Mutation </B></I></FONT></td>
                    </tr>

                    <tr> <td colspan = 6 > &nbsp; </td></tr>

                <!-- show mutations close to gene1  -->     
                <%
                    // for searching results

                    String tgene = "";
                    String tpdbcon = "";
                    String taac = "";
                    String ttype = "";
                    String tchain = "";
                    String tdomain = "";

                    String tgene1 = "";
                    String tgene2 = "";
                    String tpdbcon1 = "";
                    String tpdbcon2 = "";
                    String taac1 = "";
                    String taac2 = "";
                    String ttype1 = "";
                    String ttype2 = "";
                    String tchain1 = "";
                    String tchain2 = "";
                    String tdomain1 = "";
                    String tdomain2 = "";
                    
                    String tpdbid = "";
                    String tsdis = "";
                    String tld = "";
                    
                    String tcancer = "";
                    String tcancerinfo = "";

                    // set temp output value
                    if (rs1 == null || !rs1.first())
                    {
                %>
                    <p align="center"><font size="3" color=#FF3300><font size="2"><I> Sorry , no record !</I></font> </p> 
                <% 
                    }
                    else
                    {

                    while (rs1.next())
                    {                  
                        tgene1   = rs1.getString(1);
                        tpdbcon1 = rs1.getString(2);
                        taac1    = rs1.getString(3);
                        ttype1   = rs1.getString(4);
                        tchain1  = rs1.getString(5);
                        tdomain1 = rs1.getString(6);
            
                        tgene2   = rs1.getString(7);
                        tpdbcon2 = rs1.getString(8);
                        taac2    = rs1.getString(9);
                        ttype2   = rs1.getString(10);
                        tchain2  = rs1.getString(11);
                        tdomain2 = rs1.getString(12);
            
                        tpdbid   = rs1.getString(13);
                        tsdis    = rs1.getString(14);
                        tld      = rs1.getString(15);
                        tcancer  = rs1.getString(16);
                        tcancerinfo = rs1.getString(17);

                        // one end
                        //if ( (tgene1.equals(gene1) && tpdbcon1.equals(pdbcon1)) && (!tgene2.equals(gene2) || !tpdbcon2.equals(pdbcon2)) )
                        if ( (tgene1.equals(gene1) && tpdbcon1.equals(pdbcon1)) )
                        {
                           tgene   = tgene2;
                           tpdbcon = tpdbcon2;
                           taac    = taac2;
                           ttype   = ttype2;
                           tchain  = tchain2;
                           tdomain = tdomain2;
                        }

                        // another end
                        //if ( (tgene2.equals(gene1) && tpdbcon2.equals(pdbcon1)) && (!tgene1.equals(gene2) || !tpdbcon1.equals(pdbcon2)) )
                        if ( (tgene2.equals(gene1) && tpdbcon2.equals(pdbcon1))  )
                        {
                           tgene   = tgene1;
                           tpdbcon = tpdbcon1;
                           taac    = taac1;
                           ttype   = ttype1;
                           tchain  = tchain1;
                           tdomain = tdomain1;
                        }

                        // if matching 
                        if (tgene.length()!=0)
                        {
                    %>
                    
                    <script type="text/javascript">
                        jmolHtml('<tr><td align="left" width="60"> <form>')
                        jmolCheckbox('select <%=tpdbcon%>:<%=tchain%>; spacefill; color [138,255,0];', 'label off', '<FONT face="Arial, Helvectica, sans-serif" size="2"><%=tgene%></font></form></td><td align="left" width=10><FONT face="Arial, Helvectica, sans-serif" size="2"><%=tpdbcon%></td> <td align="left" width=70 valign="middle"> <form>');
                    jmolCheckbox('select <%=tpdbcon%>:<%=tchain%>.CA; font label 20; color label black; set labelfront; label <%=taac%>;', 'label off', ' <FONT face="Arial, Helvectica, sans-serif" size="2"><%=taac%></font></form></td> <td width=20><FONT face="Arial, Helvectica, sans-serif" size="2"><%=ttype%></td> <td ><FONT face="Arial, Helvectica, sans-serif" size="2"><%=tchain%></td> <td colspan=3><FONT face="Arial, Helvectica, sans-serif" size="2"><%=tdomain%></td></tr>');
                        </script>


                    <%} } }%>

                    <tr> <td colspan = 6 > &nbsp; </td></tr>

                    <!--  close to mutation 2  -->
                    <%
                    // for searching results

                    tgene = "";
                    tpdbcon = "";
                    taac = "";
                    ttype = "";
                    tchain = "";
                    tdomain = "";

                    tgene1 = "";
                    tgene2 = "";
                    tpdbcon1 = "";
                    tpdbcon2 = "";
                    taac1 = "";
                    taac2 = "";
                    ttype1 = "";
                    ttype2 = "";
                    tchain1 = "";
                    tchain2 = "";
                    tdomain1 = "";
                    tdomain2 = "";
                    
                    tpdbid = "";
                    tsdis = "";
                    tld = "";
                    
                    tcancer = "";
                    tcancerinfo = "";

                    if (rs2 == null || !rs2.first())
                    { }else{
                    
                    while (rs2.next())
                    {                  
                        tgene1   = rs2.getString(1);
                        tpdbcon1 = rs2.getString(2);
                        taac1    = rs2.getString(3);
                        ttype1   = rs2.getString(4);
                        tchain1  = rs2.getString(5);
                        tdomain1 = rs2.getString(6);
            
                        tgene2   = rs2.getString(7);
                        tpdbcon2 = rs2.getString(8);
                        taac2    = rs2.getString(9);
                        ttype2   = rs2.getString(10);
                        tchain2  = rs2.getString(11);
                        tdomain2 = rs2.getString(12);
            
                        tpdbid   = rs2.getString(13);
                        tsdis    = rs2.getString(14);
                        tld      = rs2.getString(15);
                        tcancer  = rs2.getString(16);
                        tcancerinfo = rs2.getString(17);

                        // one end
                        if ( (tgene1.equals(gene2) && tpdbcon1.equals(pdbcon2)) && (!tgene2.equals(gene1) || !tpdbcon2.equals(pdbcon1)) )
                        {
                           tgene   = tgene2;
                           tpdbcon = tpdbcon2;
                           taac    = taac2;
                           ttype   = ttype2;
                           tchain  = tchain2;
                           tdomain = tdomain2;
                        }

                        // another end
                        if ( (tgene2.equals(gene2) && tpdbcon2.equals(pdbcon2)) && (!tgene1.equals(gene1) || !tpdbcon1.equals(pdbcon1)) )
                        {
                           tgene   = tgene1;
                           tpdbcon = tpdbcon1;
                           taac    = taac1;
                           ttype   = ttype1;
                           tchain  = tchain1;
                           tdomain = tdomain1;
                        }


                        // if matching 
                        if (tgene.length()!=0)
                        {
                        %>

                       <script type="text/javascript">
                        jmolHtml('<tr><td align="left" width="60"> <form>')
                        jmolCheckbox('select <%=tpdbcon%>:<%=tchain%>; spacefill; color [138,255,0];', 'label off', '<FONT face="Arial, Helvectica, sans-serif" size="2"><%=tgene%></font></form></td><td align="left" width=10><FONT face="Arial, Helvectica, sans-serif" size="2"><%=tpdbcon%></td> <td align="left" width=70 valign="middle"> <form>');
                    jmolCheckbox('select <%=tpdbcon%>:<%=tchain%>.CA; font label 20; color label black; set labelfront; label <%=taac%>;', 'label off', ' <FONT face="Arial, Helvectica, sans-serif" size="2"><%=taac%></font></form></td> <td width=20><FONT face="Arial, Helvectica, sans-serif" size="2"><%=ttype%></td> <td ><FONT face="Arial, Helvectica, sans-serif" size="2"><%=tchain%></td> <td colspan=3><FONT face="Arial, Helvectica, sans-serif" size="2"><%=tdomain%></td></tr>');
                        </script>

                        <%

                        }

                        } 
                    
                    }

                   %>

                </table>

            </td>
        </tr>
    </table>

    <table id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="20">
        <tr vAlign=top>
            <td width="737" height="1">
                <hr width="80%" color="#008080">
            </td>
        </tr>
    </table>
    
    <table border="0" width="757" height="2" align="center">
        <tr>
            <td width="100%" height="1" align="center"><font face="Arial, Helvetica, sans-serif" size=2>Copyrignt? Ding lab in TGI Washington University at St. Louis.</font></td> 
        </tr>
    </table>

</body>
</html>

