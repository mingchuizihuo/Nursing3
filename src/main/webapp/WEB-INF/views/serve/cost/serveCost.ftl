<html>
<head>
    <link rel="stylesheet" href="${domainUrl}/assets/css/serveAdd.css">
    <link rel="stylesheet" href="${domainUrl}/assets/css/publicStyle.css">
    <script src="${domainUrl}/assets/js/jQuery-1.4.2/jquery.min.js"></script>
    <script src="${domainUrl}/assets/js/common.js"></script>
    <link href="${domainUrl}/assets/css/bootstrap/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="${domainUrl}/assets/js/serve/cost.js"></script>
    <meta charset="utf-8">
    <title></title>
</head>
<script>
    var domainUrl = '${domainUrl}'+"/rest";
</script>
<body>
<div class="title-div" style="width: 500px;">&nbsp;&nbsp;&nbsp;添加计费模板</div>
<div class="class-main" style="width: 500px;">
    <div style="width: 335px; margin: 0px auto; text-align: right;">
        <input type="text" id="jijia"  class="form-control" >
        <input type="button" onclick="add()" value="添加">
    </div>
</div>
</body>
</html>