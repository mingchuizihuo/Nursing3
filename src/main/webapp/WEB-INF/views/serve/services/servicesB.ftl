<html>
<head>
    <link href="${domainUrl}/assets/css/serve/serve.css" rel="stylesheet">
    <link href="${domainUrl}/assets/css/serve/servePublic.css" rel="stylesheet">
    <link href="${domainUrl}/assets/css/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${domainUrl}/assets/css/OutCss/page/page.css" rel="stylesheet" >
    <script src="${domainUrl}/assets/js/jQuery-1.9.1/jquery.min.js"></script>
    <script src="${domainUrl}/assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="${domainUrl}/assets/js/OutJs/date/jquery.date_input.pack.js"></script>
    <link href="${domainUrl}/assets/css/OutCss/date/jquery.data_input.pack.css" rel="stylesheet">
    <script src="${domainUrl}/assets/js/common.js"></script>
    <script src="${domainUrl}/assets/js/serve/services.js"></script>
    <meta charset="utf-8"/>
    <title></title>
</head>
<script>
    var domainUrl = '${domainUrl}' + "/rest";
</script>
<body onload="findAllb()">
<div class="main">
<#include "/common/serveHead.ftl"/>
    <div class="main-body">
        <div id="main-side">
            <ul>
                <a href="${domainUrl}">\
                    <li class="side-list b" id="serve">服务模块</li>
                </a>
                <a href="${domainUrl}/rest/serve/classify/classify">
                    <li class="side-list" id="ify">类别模块</li>
                </a>
                <a href="${domainUrl}/rest/serve/cost/cost">
                    <li class="side-list" id="cost">计费模块</li>
                </a>
                <a href="${domainUrl}/rest/serve/staff/staff">
                    <li class="side-list" id="staff">员工模块</li>
                </a>
                <a href="${domainUrl}/rest/serve/pack/pack">
                    <li class="side-list" id="pack">打包模块</li>
                </a>
            </ul>
        </div>
        <div id="main-show">
            <div id="now-position">
                您当前所在的位置：<span>服务模块</span>
            </div>
            <div class="serve-banner">
                <#--时间控件-->
                <script type="text/javascript">
                    $(function(){
                        $('.date_picker').date_input();
                    })
                </script>
                    <div id="date-input">
                        <date>时间范围</date>
                        <input type="text"  class="date_picker" value="2015-01-01" style="text-align: center">
                        <date>—</date>
                        <input type="text"  class="date_picker" value="2016-01-01" style="text-align: center">
                        <date><input type="button" id="cao" value="搜索" ></date>
                    </div>
                <an><input type="button" id="cao" value="添加服务" data-toggle="modal" data-target="#myModal"> <input
                        type="button" value="取消删除" style="display: none;background-color: red" id="shanchu-no"><input
                        type="button" value="删除服务" " id="shanchu-yes"><a href="${domainUrl}"><input type="button" value="平铺显示"></a>
                </an>
            </div>
            <div class="serve-module">
                <table  id="aaa">

                </table>
            </div>
         <#--分页-->
            <script src="${domainUrl}/assets/js/OutJs/page/page.js"></script>
            <div class="tcdPageCode">
            </div>
        </div>
    </div>
<#include "/common/foot.ftl"/>
<#--模态框-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title  text-center" id="myModalLabel">
                        添加服务
                    </h3>
                </div>
                <div class="modal-body">
                    <table id="add">
                        <tr>
                            <td>服务类别</td>
                            <td><input type="text" id="leibie" class="null"></td>
                        </tr>
                        <tr>
                            <td>服务标题</td>
                            <td><input type="text" id="mingcheng"class="null"></td>
                        </tr>
                        <tr>
                            <td>限制条件</td>
                            <td><input type="text" id="tiaojian"class="null"></td>
                        </tr>
                        <tr>
                            <td>服务人数</td>
                            <td><input type="text" id="renshu"class="null"></td>
                        </tr>
                        <tr>
                            <td style="position: absolute; margin-top: 5px;">服务简介</td>
                            <td><textarea id="jianjie"class="null"></textarea><input type="text" id="xid" style="display: none;">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="add-btn" onclick="add()">添加</button>
                    <button type="button" class="btn btn-primary" id="update-btn" onclick="update()"
                            style="display: none;">修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
</body>
</html>