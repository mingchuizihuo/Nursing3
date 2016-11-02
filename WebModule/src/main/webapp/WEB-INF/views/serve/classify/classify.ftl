<html>
<head>
    <link href="${domainUrl}/assets/css/serve/classify.css" rel="stylesheet">
    <link href="${domainUrl}/assets/css/serve/servePublic.css" rel="stylesheet">
    <link href="${domainUrl}/assets/css/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="${domainUrl}/assets/js/jQuery-1.9.1/jquery.min.js"></script>
    <script src="${domainUrl}/assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="${domainUrl}/assets/js/common.js"></script>
    <script src="${domainUrl}/assets/js/serve/classify.js"></script>
    <meta charset="utf-8"/>
    <title></title>
</head>
<script>
    var domainUrl = '${domainUrl}' + "/rest";
</script>
<body>
<div class="main">
<#include "/common/serveHead.ftl"/>
    <div class="main-body">
        <div id="main-side">
            <ul>
                <a href="${domainUrl}">
                    <li class="side-list" id="serve">服务模块</li>
                </a>
                <a href="${domainUrl}/rest/serve/classify/classify">
                    <li class="side-list b" id="ify">类别模块</li>
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
                您当前所在的位置：<span>类别模块</span>
            </div>
            <div class="serve-banner">
                <an><input type="button" id="cao" value="添加类别" data-toggle="modal" data-target="#myModal"> <input
                        type="button" value="取消删除" style="display: none;background-color: red" id="shanchu-no"><input
                        type="button" value="删除类别" " id="shanchu-yes">
                </an>
            </div>
            <div class="serve-module">
                <div class="classify-body">
                   <div class="ify-title">
                       <span>
                           <div style="width: 150px; text-align: center;">分类名称</div>
                       </span>
                       <span>
                           <div style="width: 150px; text-align: center;">操作</div>
                       </span>
                   </div>
                    <ul class="ify-body">
                        <li style=" border-top:1px solid #D0D0D0;">
                            <a class="inactive">
                                <div id="ify-left">
                                    <div class="font-text">家政</div>
                                </div>
                            </a>
                            <div id="ify-right">
                                <div class="font-text">
                                    <a class="ifyAdd">添加子类</a>
                                    <a class="ifyDel">删除本类</a>
                                </div>
                            </div>
                            <ul style="display: none;">
                                <li>
                                    <a class="inactive">
                                        <div id="ify-left">
                                            <div class="font-text" style="width: 170px;">|—擦鞋</div>
                                        </div>
                                    </a>
                                    <div id="ify-right">
                                        <div class="font-text">
                                            <a class="ifyAdd">添加子类</a><a class="ifyDel">删除本类</a>
                                        </div>
                                    </div>
                                    <ul style="display: none;">
                                        <li>
                                            <a class="inactive">
                                                <div id="ify-left">
                                                    <div  class="font-text"  style="width: 185px;">|——皮鞋</div>
                                                </div>
                                            </a>
                                            <div id="ify-right">
                                                <a class="ifyDel">
                                                    <div class="font-text">删除本类</div>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a class="inactive">
                                        <div id="ify-left">
                                            <div class="font-text" style="width: 170px;">|—做饭</div>
                                        </div>
                                    </a>
                                    <div id="ify-right">
                                        <div class="font-text">
                                            <a class="ifyAdd">添加子类</a><a class="ifyDel">删除本类</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <script>
                    $(document).ready(function() {
                        $('.inactive').click(function(){
                            if($(this).siblings('ul').css('display')=='none'){
                                $(this).siblings('ul').slideDown(100).children('li');
                                if($(this).parents('li').siblings('li').children('ul').css('display')=='block'){
                                    $(this).parents('li').siblings('li').children('ul').slideUp(100);
                                }
                            }else{
                                //控制自身菜单下子菜单隐藏
                                $(this).siblings('ul').slideUp(100);
                                //控制自身菜单下子菜单隐藏
                                $(this).siblings('ul').children('li').children('ul').slideUp(100);
                            }
                        })
                    });
                </script>
                <#--<select name="" id="sel1"></select>-->
                <#--<select name="" id="sel2" style="display: none;"></select>-->
                <#--<select name="" id="sel3" style="display: none;"></select>-->
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
                        添加类别
                    </h3>
                </div>
                <div class="modal-body">
                    <table class="add">
                        <tr>
                            <td>类别名称</td>
                            <td><input type="text" id="className"></td>
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