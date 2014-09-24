
<%@ page contentType="text/html;charset=GB2312" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />


<%
    String rownum = request.getParameter("rowkey");
    ResultSet rs = null;

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

<!DOCTYPE html>
<html lang="en">
<head>
    <TITLE> 3D Mutation Proximity System in TGI </TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

    <%@include file="/jsp/includes/html-header.jsp"%>

    <script type="text/javascript" src="JSmol.min.js"></script>
    <script type="text/javascript" src="js/Jmol2.js"></script>

</head>

<body class="sub">
<div class="container">
<div class="row">
    <%@include file="/jsp/includes/page-header.jsp"%>
</div>
<div class="row">
    <%@include file="/jsp/includes/main-menu.jsp"%>
</div>
<div class="row">
    <div id="jsmol-sample-info">
        <div class="col-lg-4 col-sm-12">
            <div class="name">
                <h2><%=cancerinfo%></h2>
            </div>
        </div>
        <div class="col-lg-8 col-sm-12">
            <div class="cancer-data">
                <p>
                    <span class="lbl">PDBID:</span> <span class="value"><%=pdbid%></span>&nbsp;
                    <span class="lbl">3D Distance:</span> <span class="value"><%=sdis%></span>&nbsp;
                    <span class="lbl">1D Distance:</span> <span class="value"><%=ld%></span>
                </p>
            </div>
        </div>
    </div>

    <div id="jsmol-canvas">
        <form>
            <div id="jsmolviewer">
                <script type="text/javascript">
                    jmolInitialize("./jmol");
                    jmolSetAppletColor("black", "white", "red");
                    jmolApplet("100%",
                            "load pdb/<%=pdbid%>.pdb;" +
                                    "set antialiasdisplay true;" + "" +
                                    "wireframe off;" +
                                    "spacefill off;" +
                                    "cartoons; color structure;" +
                                    "select <%=pdbcon1%>:<%=chain1%>;"+
                                    "spacefill;" +
                                    "color [138,255,0];" +
                                    "select <%=pdbcon2%>:<%=chain2%>;" +
                                    "spacefill;" +
                                    "color [138,255,0];");
                </script>
            </div>
        </form>
    </div>
</div>
<div class="row">
    <div id="jsmol-controls">
        <div class="col-lg-4 col-sm-6">
            <p><strong>Labels:</strong></p>
            <form class="form-inline">
                <label class="checkbox-inline">
                    <script>
                        jmolCheckbox("select <%=pdbcon1%>:<%=chain1%>.CA;" +
                                "font label 30;" +
                                "color label lightgreen;" +
                                "set labelfront;" +
                                "label <%=aac1%>;",
                                "label off",
                                "<%=aac1%>");
                    </script>
                </label>
                <label class="checkbox-inline">
                    <script>
                        jmolCheckbox("select <%=pdbcon2%>:<%=chain2%>.CA;" +
                                "font label 30;" +
                                "color label lightgreen;" +
                                "set labelfront;" +
                                "label <%=aac2%>;",
                                "label off",
                                "<%=aac2%>");
                    </script>
                </label>
            </form>
        </div>
        <div class="col-lg-8 col-sm-6">
            <p><strong>Colors:</strong></p>
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <form class="form-inline">
                        Chain <%=chain1%>:
                        <script>
                            jmolMenu([
                                ["select :<%=chain1%>; color deeppink", "deep pink", true],
                                ["select :<%=chain1%>; color white", "white"],
                                ["select :<%=chain1%>; color skyblue", "skyblue"],
                                ["select :<%=chain1%>; color yellow", "yellow"],
                                ["select :<%=chain1%>; color salmon", "salmon"],
                                ["select :<%=chain1%>; color palegreen", "palegreen"],
                                ["select :<%=chain1%>; color black", "black"]
                            ]);
                        </script>
                    </form>
                </div>
                <div class="col-lg-4 col-sm-4">
                    <form class="form-inline">
                        Chain <%=chain2%>:
                        <script>
                            jmolMenu([
                                ["select :<%=chain1%>; color deeppink", "deep pink", true],                                      ["select :<%=chain2%>; color white", "white"],
                                ["select :<%=chain2%>; color skyblue", "sky blue"],
                                ["select :<%=chain2%>; color yellow", "yellow"],
                                ["select :<%=chain2%>; color salmon", "salmon"],
                                ["select :<%=chain2%>; color palegreen", "palegreen"],
                                ["select :<%=chain2%>; color black", "black"]

                            ]);
                        </script>
                    </form>
                </div>
                <div class="col-lg-4 col-sm-4">
                    <form class="form-inline">
                        Background:
                        <script>
                            jmolMenu([
                                ["background black", "black", true],
                                ["background white", "white"],
                                ["background skyblue", "sky blue"],
                                ["background yellow", "yellow"],
                                ["background salmon", "salmon"],
                                ["background palegreen", "pale green"]
                            ]);
                        </script>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
<div class="content">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
    <div class="mut-table-header category-1">
        <h4>
            Mutation 1

        <span class="mut-info">
            (<%=gene1%>&nbsp;
            <%=pdbcon1%>&nbsp;
            <%=type1%>&nbsp;
            <%=chain1%>)
        </span>
        </h4>
    </div>
    <table class="table table-condensed mut-table" >
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
        <p>Sorry , no record !</p>
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
                if ( (tgene1.equals(gene1) && tpdbcon1.equals(pdbcon1)) && (!tgene2.equals(gene2) || !tpdbcon2.equals(pdbcon2)) )
                {
                    tgene   = tgene2;
                    tpdbcon = tpdbcon2;
                    taac    = taac2;
                    ttype   = ttype2;
                    tchain  = tchain2;
                    tdomain = tdomain2;
                }

                // another end
                if ( (tgene2.equals(gene1) && tpdbcon2.equals(pdbcon1)) && (!tgene1.equals(gene2) || !tpdbcon1.equals(pdbcon2)) )
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
        <tr class="categorized">
            <td class="category-item-1">
                <form>
                    <script type="text/javascript">
                        jmolCheckbox("select <%=tpdbcon%>:<%=tchain%>; spacefill; color [138,255,0];", "label off", "");
                    </script>
                </form>
            </td>

            <td class="category-item-1"><%=tgene%></td>
            <td class="category-item-1"><%=tpdbcon%></td>

            <td class="category-item-1">
                <form>
                    <script type="text/javascript">
                        jmolCheckbox("select <%=tpdbcon%>:<%=tchain%>.CA; font label 20; color label black; set labelfront; label <%=taac%>;", "label off", "");
                    </script>
                </form>
            </td>

            <td class="category-item-1"><%=taac%></td>
            <td class="category-item-1"><%=ttype%></td>
            <td class="category-item-1"><%=tchain%></td>
            <td class="category-item-1"><%=tdomain%></td>
        </tr>

        <%} } }%>

    </table>
</div> <!-- /mutation 1 column -->
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
    <div class="mut-table-header category-2">
        <h4>
            Mutation 2

        <span class="mut-info">
            (<%=gene2%>&nbsp;
            <%=pdbcon2%>&nbsp;
            <%=type2%>&nbsp;
            <%=chain2%>)
        </span>
        </h4>
    </div>
    <table class="table table-condensed mut-table">
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

        <tr class="categorized">
            <td class="category-item-2">
                <form>
                    <script type="text/javascript">
                        jmolCheckbox("select <%=tpdbcon%>:<%=tchain%>; spacefill; color [138,255,0];", "label off", "");
                    </script>
                </form>
            </td>

            <td class="category-item-2"><%=tgene%></td>
            <td class="category-item-2"><%=tpdbcon%></td>

            <td class="category-item-2">
                <form>
                    <script type="text/javascript">
                        jmolCheckbox("select <%=tpdbcon%>:<%=tchain%>.CA; font label 20; color label black; set labelfront; label <%=taac%>;", "label off", "");
                    </script>
                </form>
            </td>

            <td class="category-item-2"><%=taac%></td>
            <td class="category-item-2"><%=ttype%></td>
            <td class="category-item-2"><%=tchain%></td>
            <td class="category-item-2"><%=tdomain%></td>
        </tr>

        <%

                    }

                }

            }

        %>
    </table>
</div> <!-- /mutation 2 column -->
</div>
</div> <!-- /row (mutation info) -->

<div class="row">
    <%@include file="/jsp/includes/footer.html"%>
</div> <!-- /row (footer)-->

</div> <!-- /container (page)-->

<%@include file="/jsp/includes/js-libs.jsp"%>

</body>
</html>




