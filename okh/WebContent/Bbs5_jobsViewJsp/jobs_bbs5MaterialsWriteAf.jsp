<%@page import="user.UserDto"%>
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
<title>jobs_bbs5MaterialsWriteAf.jsp</title>
</head>
<body>
<%
newbbs5HWCodingVO techwritedto = (newbbs5HWCodingVO)request.getAttribute("techwritedto");
newbbs5HWCodingVO return1 = (newbbs5HWCodingVO)request.getAttribute("return1");
if(return1 == null && techwritedto == null){

%>
<script type="text/javascript">
alert("제목과 내용을 입력해주세요");
location.href = "../BBSHWCodingController?command=techbbs1";
</script>
<%
}else{

	newbbs5HWCodingServiceImpl service = newbbs5HWCodingService.getInstance();
	
	//글 작성 부분.
boolean isS = service.writeBbs(techwritedto);

	
//로그인 정보 확인 부분. //로그인한id가져오기
	Object ologin = session.getAttribute("login");

	UserDto mem = null;//null로 초기화.
	
	if(ologin != null){
		mem = (UserDto)ologin;
		//로그인 정보 가지고 오나 확인 부분.
		System.out.println("mem : " + mem.toString());
	}else{
		System.out.println("로그인한 정보 없음.");
	}
	

if(isS){
%>
	<script type="text/javascript">
	alert("HW 글 추가 성공");
	
	<%
	//여기서 글 작성 하면 점수 올라가게 해주는 것 해보자. 정상적으로 글 작성 하면 점수 올라가는 것.
		byte score = 10;//글 작성 하면 10점.
		String writeID =  mem.getId();
		service.writeBbsMemSCORE(score, writeID);
	%>
	
	location.href = "BBSHWCodingController?command=main";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("다시 입력해 주세요.");
	location.href = "BBSHWCodingController?command=techbbs";
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

















<%-- 

기존 하다가 망한 코드

<%@page import="user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jobs_bbs5MaterialsWriteAf.jsp</title>
</head>
<body>
	<%

Object ologin = session.getAttribute("login");
UserDto mem = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert("로그인해 주십시오");
	location.href = "../index.jsp";	
	</script>	
	<%
	return;
}
mem = (UserDto)ologin;

%>

<%
BbsMaterialsBeanDtoVO dto = (BbsMaterialsBeanDtoVO)request.getAttribute("Materialswritedto");
//싱글톤 호출 부분.
jobsBbs5MaterialsServiceImpl service = jobsBbs5MaterialsService.getInstance();

boolean isS = service.writePds(dto);
//확인 코드.
	System.out.println("isS : " + isS);
if(isS){
%>
	<script type="text/javascript">
	alert("글 입력 완료");
	location.href="BBSmaterialsController?command=list";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("다시 입력해 주세요.");
	location.href="BBSmaterialsController?command=list";
	</script>
<%
}
%>
</body>
</html> --%>