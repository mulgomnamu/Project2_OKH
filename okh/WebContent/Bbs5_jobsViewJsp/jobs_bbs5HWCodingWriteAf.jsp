<%@page import="jobs_BBS5.newbbs5HWCodingServiceImpl"%>
<%@page import="jobs_BBS5.newbbs5HWCodingService"%>
<%@page import="jobs_BBS5.newbbs5HWCodingVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
<title>jobs_bbs5HWCodingWriteAf</title>
</head>
<body>
<%
newbbs5HWCodingVO techwritedto = (newbbs5HWCodingVO)request.getAttribute("techwritedto");
newbbs5HWCodingVO return1 = (newbbs5HWCodingVO)request.getAttribute("return1");
if(return1 == null && techwritedto==null){

%>
<script type="text/javascript">
alert("제목과 내용을 입력해주세요");
location.href="../BBSHWCodingController?command=techbbs1";
</script>
<%
}else{

	newbbs5HWCodingServiceImpl service = newbbs5HWCodingService.getInstance();
	
	//글 작성 부분.
boolean isS = service.writeBbs(techwritedto);

if(isS){
%>
	<script type="text/javascript">
	alert("HW 글 추가 성공");
	location.href="BBSHWCodingController?command=techbbs";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("다시입력해주세요");
	location.href="BBSHWCodingController?command=techbbs";
	</script>
<%
}
}
%>
<script type="text/javascript">

</script>
<%-- <%
Cookie c = new Cookie("tagname", tagname) ;
 
// 쿠키 유효기간을 설정한다. 초단위 : 60*60*24= 1일
c.setMaxAge(60*60*24) ;
 
// 응답헤더에 쿠키를 추가한다.
response.addCookie(c) ;

Cookie[] cookies = request.getCookies() ;

if(cookies != null){
     
    for(int i=0; i < cookies.length; i++){
        Cookie c1 = cookies[i] ;
         
        // 저장된 쿠키 이름을 가져온다
        String cName = c1.getName();
         System.out.println(cName);
        // 쿠키값을 가져온다
        String cValue = c1.getValue() ;
         
        System.out.println(cValue);
    }
}
%>
 
         /* 
         $.cookie('쿠키명');                  //쿠키불러오기
         $.cookie('쿠키명','value',{expired:7});   //쿠키사용기간정의 일단위이다
         $.cookie('쿠키명',null);               //쿠키삭제
         $.removeCookie('name');               //성공적으로삭제시 트루반환한다
         $.removeCookie('name',{path:'/'});      //path지정시 같이써줘야삭제된다
         $.cookie('name', 'value', {expires: 7, path: '/', domain: 'naver.co.kr', secure: false});
         expires : 만료일, 해당 쿠키를 유지하는 기간
         path : 경로설정, 이 사이트의 모든 페이지가 해당된다면 '/' 이고 특정 폴더라면 경로를 적어줌
         domain : 쿠키가 적용될 도메인, 기본 설정은 쿠키가 만들어진 도메인
         secure : 기본 설정은 false 이고 true/false 로 입력가능, true일 경우 https 프로토콜만 적용
         //   /으로하면 모든페이지에서쿠키사용할수있고, 아예지정을안하면 현재페이지에만적용한다 
         */
    --%>
</body>
</html>





















<%-- <%@page import="jobs_BBS5.BbsHWCodingBeanDtoVO"%>
<%@page import="jobs_BBS5.jobsBbs5ModelService"%>
<%@page import="jobs_BBS5.jobsBbs5ModelServiceImpl"%>
<%@page import="jobs_BBS5.BbsBoardBeanDtoVO"%>
<%@page import="user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jobs_bbs5HWCodingWriteAf.jsp</title>
</head>
<body>
	<%

Object ologin = session.getAttribute("login");
UserDto mem = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert("로그인해 주십시오");
	location.href = "index.jsp";	
	</script>	
	<%
	return;
}
mem = (UserDto)ologin;

%>

<%
BbsHWCodingBeanDtoVO dto = (BbsHWCodingBeanDtoVO)request.getAttribute("hwbbswritedto");
//싱글톤 호출 부분.
jobsBbs5ModelServiceImpl service = jobsBbs5ModelService.getInstance();

boolean isS = service.writeBbs(dto);

if(isS){
%>
	<script type="text/javascript">
	alert("글 입력 완료");
	location.href="BBSHWCodingController?command=list";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("다시 입력해 주세요.");
	location.href="BBSHWCodingController?command=list";
	</script>
<%
}
%>
</body>
</html> --%>