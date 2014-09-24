<%@ page contentType="text/html;charset=GB2312" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hotspot 3D: Visualize Protein Mutations</title>
    <jsp:include page="jsp/includes/html-header.jsp" />
</head>
<body class="home">

<div class="container">
<div class="row">
    <%@include file="/jsp/includes/page-header.jsp"%>
</div>
<div class="row">
    <%@include file="/jsp/includes/main-menu.jsp"%>
</div>
<div class="row">
    <div class="content">

        <div class="col-lg-6 col-sm-6">
            <div class="well-text">
                <p>3D mutation proximity visualization portal, is a World Wide Web resource for comprehensive access to the 3D proximity information of cancer mutations regarding complete and ongoing cancer genomic projects around the world. We provides the largest available and most detailed monitoring of cancer genomics projects.
                </p>
            </div>
            <div class="well-form">
                <h3>View Proteins by Position</h3>
                <form action="jsp/singlevariant.jsp" method="post" role="form" class="form-horizontal">
                    <div class="form-group">
                        <label for="link" class="col-sm-4 control-label">Search Terms:</label>
                        <div class="col-sm-8">
                            <textarea name="link" id="link" class="form-control"></textarea>
                            <p class="small" style="margin: 5px 0 0 0;">Example: chr18 48591846</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">&nbsp;</label>
                        <div class="col-sm-8">
                            <input type="checkbox" name="onevariant" id="onevariant" value="">&nbsp;<label for="onevariant">hg18</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-8">
                            <button type="submit" class="btn btn-default">Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="well-form">
                <h3>Search for Cancer Genes</h3>

                <form action="jsp/searchresult.jsp" method="post" role="form" class="form-horizontal">
                    <div class="form-group">
                        <label for="cancers" class="col-sm-4 control-label">Cancer:</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="cancers" id="cancers">
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
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">Type:</label>
                        <div class="col-sm-8" style="padding-top: 6px;">

                            <input type="radio" value="1" checked name="interaction" for="protein-complex">
                            <label id="protein-complex" style="font-weight: normal">
                                Protein complex
                            </label>
                            &nbsp;&nbsp;&nbsp;

                            <input type="radio" value="0" name="interaction">
                            <label id="interaction" style="font-weight: normal">
                                Single protein
                            </label>

                        </div>
                    </div>

                    <div class="form-group">

                        <label for="hugo-gene" class="col-sm-4 control-label">
                            HUGO Gene:
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="hugo-gene" name="gene" placeholder="TCEB1">
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="max-distance" class="col-sm-4 control-label">
                            Max Distance:
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="max-distance" name="sdis" placeholder="10">
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="max-p" class="col-sm-4 control-label">
                            Max P-value:
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="max-p" name="pvalue" placeholder="0.0001">
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-8">
                            <button type="submit" class="btn btn-default">Search</button>
                        </div>
                    </div>

                </form>
            </div> <!-- /well-form -->
        </div>
        <div class="col-lg-6 col-sm-6">
            <div class="well-table">
                <h3 style="padding-left: 15px">Browse TCGA Cancer Types</h3>
                <%
                    ResultSet rs=null;
                    String sql = "select * from TCGA_cancers";
                    rs = submitjobBean.executeQuery(sql);
                %>

                <table class="table table-condensed list-cancer" id="tcga-list">
                    <thead>
                    <tr>
                        <th class="title">
                            Name
                        </th>
                        <th class="description">
                            Description
                        </th>
                        <th class="number" data-hide="phone">
                            Mutations
                        </th>
                        <th class="number" data-hide="phone">
                            Close&nbsp;pairs
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <% while(rs.next()) { %>
                    <tr>
                        <td class="title">
                            <a href="jsp/singlecancer.jsp?cancer=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
                        </td>
                        <td class="description">
                            <%=rs.getString(2)%>
                        </td>
                        <td class="number">
                            <%=rs.getString(3)%>
                        </td>
                        <td class="number">
                            <%=rs.getString(4)%>
                        </td>
                    </tr>
                    <% }
                        submitjobBean.close();
                    %>
                    </tbody>

                </table>
            </div> <!-- / well-table -->

        </div> <!-- /col-lg-6 -->

    </div> <!-- /content -->

</div><!-- /row -->

<div class="row">
    <%@include file="jsp/includes/footer.html"%>
</div> <!-- /row -->

</div> <!-- /container -->

<jsp:include page="jsp/includes/js-libs.jsp"/>

</body>
</html>
