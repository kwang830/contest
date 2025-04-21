<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    // 메뉴 목록 추출
    var menuList = new Array;
    if(document.menuListForm.tmp_menuNm != null){

        for (var j = 0; j < document.menuListForm.tmp_menuNm.length; j++) {
            menuList[j] = document.menuListForm.tmp_menuNm[j].value;
        }
    }
    var leftStartMenuValue = document.getElementById("menuNo").value;
    if (leftStartMenuValue==null || leftStartMenuValue=="" || leftStartMenuValue=="null") leftStartMenuValue = '1000000';

    var activeMenuValue = document.getElementById("activeMenuNo").value;
    if (activeMenuValue==null || activeMenuValue=="" || activeMenuValue=="null") activeMenuValue = '1000000';

    // 서브 메뉴 생성
    function subMenuTag(menuList, mainMenuNo) {
        var subMenuTag = "";
        menuList.forEach(function(item,index){
            var itemList = item.split('|');

            if ( mainMenuNo == itemList[1] ) {
                subMenuTag += '<li><a href="<c:url value='/'/>'+itemList[5].substr(1)+'">'+itemList[2]+'</a></li>';
            }
        });
        if (subMenuTag != "") subMenuTag = "<ul>"+subMenuTag+"</ul>";
        return subMenuTag;
    }

    var topMenuTag = "";
    var mainMenuTag = "";
    var activeMenuTag = "";

    menuList.forEach(function(item,index){
        var itemList = item.split('|');

        switch(leftStartMenuValue) {
            case itemList[0]:
                topMenuTag = ""+itemList[2]+"";
                break;
            case itemList[1]:
                if(itemList[0] == activeMenuValue){
                    mainMenuTag += '<li class="active"><a href="<c:url value='/'/>'+itemList[5].substr(1)+'">'+itemList[2]+'</a>'
                        + subMenuTag(menuList, itemList[0])
                        + '</li>';
                    activeMenuTag = itemList[2];
                }else{
                    mainMenuTag += '<li><a href="<c:url value='/'/>'+itemList[5].substr(1)+'">'+itemList[2]+'</a>'
                        + subMenuTag(menuList, itemList[0])
                        + '</li>';
                }
                break;
            default:
                break;
        }
    });
</script>

<!-- 홈 아이콘 -->
<div class="nav-item home">
    <a href="/"><img src="/images/icon-home.png" alt="홈"/></a>
</div>
<!-- 1depth 메뉴 항목 -->
<div class="nav-item has-dropdown">
    <button class="nav-button"><script>document.write(topMenuTag);</script> <span class="nav-toggle"></span></button>
</div>
<div class="nav-item has-dropdown">
    <button class="nav-button"><script>document.write(activeMenuTag);</script> <span class="nav-toggle"><img src="/images/icon-nav-arrow.png" alt=""></span></button>
    <ul class="dropdown-menu">
        <script>document.write(mainMenuTag);</script>
    </ul>
</div>
