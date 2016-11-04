/**
 * Created by horo on 2016/10/14.
 */
$(function () {
    $("#cao").click(function () {
        $("#update-btn").hide();
        $("#add-btn").show();
    })
    $("#shanchu-yes").click(function () {
        $(".bianji").hide();
        $(".shanchu").show();
        $("#shanchu-yes").hide();
        $("#shanchu-no").show();
    })
    $("#shanchu-no").click(function () {
        $(".bianji").show();
        $(".shanchu").hide();
        $("#shanchu-yes").show();
        $("#shanchu-no").hide();
    })
})
function add() {
    var staffname = $("#staffname").val();
    var staffsex = $("#staffsex").val();
    var staffpost = $("#staffpost").val();
    var staffskill = $("#staffskilllevel").val();
    var staffpicture = pathList;
    var staffdepartment = $("#staffdepartment").val();
    var staffcard = $("#staffcard").val();
    var staffcall1 = $("#staffcall1").val();
    var staffcall2 = $("#staffcall2").val();
    var staffrank = $("#staffrank").val();
    var staffstatus = $("#staffstatus").val();
    var url = domainUrl + "/serve/service_staff/add";
    var postData = {
        pictureAddress:pathList,
        staffName: staffname,
        staffSex: staffsex,
        staffPost: staffpost,
        staffSkillLevel: staffskill,
        staffPicture: staffpicture,
        staffCardId: staffcard,
        staffCall1: staffcall1,
        staffCall2: staffcall2,
        staffRank: staffrank,
        staffStatus: staffstatus,
        staffDepartment: staffdepartment
    };
    postAjax(url, false, postData, function (data) {
        console.log(JSON.stringify(data))
        alert("添加成功");
        $('#myModal').modal("hide");
        location.reload();
    })
}
function del(id) {
    var url = domainUrl + "/serve/service_staff/del"
    var postData = {id: id}
    postAjax(url, false, postData, function (data) {
        console.log(JSON.stringify(data))
        alert("删除成功")
        location.reload();
    })
}
var pageNp = 1;
var pageList;
function findAll(currentPage) {
    var url = domainUrl + "/serve/service_staff/findAll";
    var limit = 3;
    var getData = {currentPage: currentPage, limit: limit};
    var html = "";
    getAjax(url, false, getData, function (data) {
        pageList = Math.ceil(data.iTotalRecords / limit);
        var num = data.aaData.length;
        console.log(JSON.stringify(data))
        for (var i = 0; i < num; i++) {
            html += '<div class="serve-module-s"> <i class="glyphicon glyphicon-pencil bianji" title="编辑" onclick="make(' + data.aaData[i].id + ','+currentPage+')"></i> <i' +
            ' class="glyphicon' +
            ' glyphicon-remove shanchu" onclick="del(' + data.aaData[i].id + ')"></i> <ul>';
            html += '<li id="staff-mess1"><img src="'+domainFile+'/assets/uploadimg/'+data.aaData[i].staffPicture.pictureAddress+'" alt=""></li> <li' +
                ' id="staff-mess2"> <ul>' +
                ' <li>' + data.aaData[i].staffName + '</li>';
            html += ' <li>职务</li> <li>部门</li> <li>联系方式</li> <li>身份证号</li> </ul> <ul> <li>' + data.aaData[i].staffSex + '</li> <li>' + data.aaData[i].staffPost + '</li> ';
            html += '<li>' + data.aaData[i].staffDepartment + '</li> <li>' + data.aaData[i].staffCall1 + '</li> <li>' + data.aaData[i].staffCardId + '</li> </ul> </li>';
            html += '<li id="staff-mess3"> <ul> <li>人员状态</li> <li>管理权限</li> <li>技能等级</li> </ul> <ul> <li>' + data.aaData[i].staffStatus + '</li> <li>' + data.aaData[i].staffRank + '</li>';
            html += ' <li>' + data.aaData[i].staffSkillLevel + '</li> </ul> </li> </ul> </div>';
        }
        $(".serve-module").html(html)
        if(pageNp == 1){
            pageNp =2;
            $(".tcdPageCode").createPage({
                pageCount: pageList,
                current: currentPage,
                backFn: function (p) {
                    findAll(p)
                }
            });
        }
    })
}
var pageNb = 1;
function findAllb(currentPage) {
    var url = domainUrl + "/serve/service_staff/findAll";
    var limit = 3;
    var getData = {currentPage: currentPage, limit: limit};
    var html = " <tbody> <tr> <th>姓名</th> <th>性别</th> <th>职务</th> <th>部门</th> <th>联系方式</th>" +
        " <th>身份证号</th> <th>人员状态</th> <th>管理权限</th> <th>技能等级</th><th>操作</th> </tr></tbody>";
    getAjax(url, false, getData, function (data) {
        pageList = Math.ceil(data.iTotalRecords / limit);
        var num = data.aaData.length;
        console.log(JSON.stringify(data))
        for (var i = 0; i < num; i++) {
            html+='<tr><td>' + data.aaData[i].staffName + '</td><td>' + data.aaData[i].staffSex + '</td><td>' + data.aaData[i].staffPost + '</td>' +
                '<td>' + data.aaData[i].staffDepartment + '</td><td>' + data.aaData[i].staffCall1 + '</td><td>' + data.aaData[i].staffCardId + '</td>' +
                '<td>' + data.aaData[i].staffStatus + '</td><td>' + data.aaData[i].staffRank + '</td><td>' + data.aaData[i].staffSkillLevel + '</td>' +
                '<td><i class="glyphicon glyphicon-pencil bianji" title="编辑" onclick="make(' + data.aaData[i].id + ','+currentPage+')"></i>' +
                ' <i class="glyphicon glyphicon-remove shanchu" title="删除" onclick="del(' + data.aaData[i].id + ')" style="display:none;"></i></td></tr>';
        }
        $("#aaa").html(html)
        if(pageNb == 1){
            pageNb =2;
            $(".tcdPageCode").createPage({
                pageCount: pageList,
                current: currentPage,
                backFn: function (p) {
                    findAllb(p)
                }
            });
        }
    })
}
function make(id,currentPage) {
    $("#update-btn").show();
    $("#add-btn").hide();
    var url = domainUrl + "/serve/service_staff/findAll";
    var limit = 3;
    var getData = {currentPage: currentPage, limit: limit};
    var name, sex, post, level, pic, ment, card, call1, call2, rank, status, xid;
    getAjax(url, false, getData, function (data) {
        var num = data.aaData.length;
        for (var i = 0; i < num; i++) {
            if (id == data.aaData[i].id) {
                name = data.aaData[i].staffName;
                sex = data.aaData[i].staffSex;
                post = data.aaData[i].staffPost;
                level = data.aaData[i].staffSkillLevel;
                pic = data.aaData[i].staffPicture;
                ment = data.aaData[i].staffDepartment;
                card = data.aaData[i].staffCardId;
                call1 = data.aaData[i].staffCall1;
                call2 = data.aaData[i].staffCall2;
                rank = data.aaData[i].staffRank;
                status = data.aaData[i].staffStatus;
                xid = data.aaData[i].id;
                $("#staffname").val(name);
                $("#staffsex").val(sex);
                $("#staffpost").val(post);
                $("#staffskilllevel").val(level);
                $("#staffpicture").val(pic);
                $("#staffdepartment").val(ment);
                $("#staffcard").val(card);
                $("#staffcall1").val(call1);
                $("#staffcall2").val(call2);
                $("#staffrank").val(rank);
                $("#staffstatus").val(status);
                $("#xid").val(xid);
                // html+=' <tr> <td>员工姓名</td> <td><input type="text" id="staffname" value="'+data.aaData[i].staffName+'"></td> </tr> <tr> <td>员工性别</td> <td> ';
                // html+='<input type="text" id="staffsex" value="'+data.aaData[i].staffSex+'"></td> </tr> <tr> <td>员工职务</td> <td>';
                // html+='<input type="text" id="staffpost" value="'+data.aaData[i].staffPost+'"></td> </tr> <tr> <td>技能等级</td>';
                // html+='<td><input type="text" id="staffskilllevel" value="'+data.aaData[i].staffSkillLevel+'"></td> </tr> <tr> <td style="position: absolute; margin-top: 5px;">员工照片</td> ';
                // html+='<td><input type="text" id="staffpicture" value="'+data.aaData[i].staffPicture+'"></td> </tr>';
                // html+=' <tr> <td>员工部门</td> <td><input type="text" id="staffdepartment" value="'+data.aaData[i].staffDepartment+'"></td> </tr> <tr> <td>身份证号</td>';
                // html+='  <td><input type="text" id="staffcard" value="'+data.aaData[i].staffCardId+'"></td> </tr> <tr> <td>联系方式1</td> <td><input type="text" id="staffcall1" value="'+data.aaData[i].staffCall1+'"></td> </tr>';
                // html+='<tr> <td>联系方式2</td> <td><input type="text" id="staffcall2" value="'+data.aaData[i].staffCall2+'"></td> </tr> <tr> <td>员工权限</td> ';
                // html+='<td><input type="text" id="staffrank" value="'+data.aaData[i].staffRank+'"></td> </tr> <tr> <td>工作状态</td> <td>';
                // html+='<input type="text" id="staffstatus" value="'+data.aaData[i].staffStatus+'"></td> </tr>';

            }
        }
        $('#myModal').modal("show");
    })
}
function update() {
    var staffname = $("#staffname").val();
    var staffsex = $("#staffsex").val();
    var staffpost = $("#staffpost").val();
    var staffskill = $("#staffskilllevel").val();
    var staffpicture = $("#staffpicture").val();
    var staffdepartment = $("#staffdepartment").val();
    var staffcard = $("#staffcard").val();
    var staffcall1 = $("#staffcall1").val();
    var staffcall2 = $("#staffcall2").val();
    var staffrank = $("#staffrank").val();
    var staffstatus = $("#staffstatus").val();
    var id = $("#xid").val();
    var url = domainUrl + "/serve/service_staff/update";
    var postData = {
        id: id,
        staffName: staffname,
        staffSex: staffsex,
        staffPost: staffpost,
        staffSkillLevel: staffskill,
        staffPicture: staffpicture,
        staffCardId: staffcard,
        staffCall1: staffcall1,
        staffCall2: staffcall2,
        staffRank: staffrank,
        staffStatus: staffstatus,
        staffDepartment: staffdepartment
    };
    postAjax(url, false, postData, function (data) {
        console.log(JSON.stringify(data))
        alert("修改成功");
        $('#myModal').modal("hide");
        location.reload();
    })
}