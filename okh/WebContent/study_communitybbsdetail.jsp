<%@page import="studysrc.comment_bbsDto"%>
<%@page import="java.util.List"%>
<%@page import="studysrc.CombbsService"%>
<%@page import="studysrc.ICombbsService"%>
<%@page import="studysrc.CombbsDto"%>
<%@page import="user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="_main.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
List<comment_bbsDto> list= (List<comment_bbsDto>)request.getAttribute("detail");
List<CombbsDto> list1=(List<CombbsDto>)request.getAttribute("detail1");
String sseq = request.getParameter("seq");
int seq=Integer.parseInt(sseq);
ICombbsService service = CombbsService.getInstance();


if(list==null||list.size()==0){
	%>
	<form action="CommunityControl">
	<div class="wrap">
		<table border="1">
			<col width="600"> <col width="200">
			<tr>
			<td colspan="2"><div class="myinfo">작성자<%= list1.get(0).getId() %>
												조회수 <%=list1.get(0).getReadcount() %>
												댓글수 <%=list1.get(0).getCommentcount() %> 
												<input type="hidden" name="parent" value="<%=seq %>"> 
			 					 </div></td>
			 
				
			</tr>
			<tr>	
				<td><h2 class="title"><%=list1.get(0).getId() %> <%=list1.get(0).getTitle() %> <br>
				<%=list1.get(0).getWdate() %><hr/></h2>
				</td>	
				
					<td	rowspan="2">
					<div class="like">
						<button type="button">좋아요</button><br>
						<button type="button">싫어요</button>
					</div>
					</td>
				
			</tr>
			<tr>
				<td><article class="content">
						<%=list1.get(0).getContent()%><br>
					모임날짜 <%=list1.get(0).getJoindate() %>
					</article>
				</td>
			</tr>
			
			<tr>
				
			</tr>
		</table>
	<a href="CommunityControl?command=list">글목록</a>
	<a href="CommunityControl?command=update&seq=<%=list1.get(0).getSeq() %>">수정</a>
	<a href="CommunityControl?command=delet&seq=<%=list1.get(0).getSeq() %>">삭제</a>
	<br>


	<table border="1">
		<col width="400"> <col width="100">
		<%if(list==null||list.size()==0){
					
				%><tr>
					<td colspan="2">등록된 댓글이 없습니다.</td>
					</tr>
					
					
					
				<%
		}else{
			for(int i = 0;i<list.size();i++){
				%>
			
		<tr>
			<td> <%= list.get(i).getCommentid() %><br><%=list.get(i).getCommentwdate() %>작성
			<td rowspan="2"><input type="button" value="같이해요!">  </td>
		</tr>
		<tr>
			<td><%=list.get(i).getCommentcontent() %> </td>
		</tr>

	<%
			}
		}
	%>
	</table>



<form action="CommunityControl">
	<table>
	<tr>
		<th> 댓 글 </th>
	</tr>
				<col width="100"> <col width="700">
				<tr>
				
					<td colspan="2">
						<input type="text" id="id" readonly="readonly" value="<%=mem.getId() %>" size="100">
						<input type="hidden" name="id" value="<%=mem.getId() %>">
		 				<input type="hidden" name="command" value="commentAF">
		 				<input type="hidden" name="parent" value="<%=seq %>">
		 				<%System.out.println(seq); %>
					</td>
				</tr>
				
				
				
				<tr>
					
					<td colspan="2">
						<textarea name="content" id="summernote"></textarea>
					</td>
				</tr>
				<tr>
			 		<td colspan="2">
			 			<input type="submit" value="댓글달기" > <input type="reset" id="cancel" value="리셋"> 
			 			
			 		</td>
		 		</tr>
				
			</table>
		</div>
	</form>
<%
}else{
%>

<form action="CommunityControl">
<div class="wrap">
	<table border="1">
		<col width="600"> <col width="200">
		<tr>
		<td colspan="2"><div class="myinfo">작성자<%= list.get(0).getBbsid() %>
											조회수 <%=list.get(0).getBbsreadcount() %>
											댓글수 <%=list.get(0).getBbscommentcount() %> 
											<input type="hidden" name="parent" value="<%=seq %>"> 
		 					 </div></td>
		 
			
		</tr>
		<tr>	
			<td><h2 class="title"><%=list.get(0).getBbstagname() %> <%=list.get(0).getBbstitle() %> <br>
			<%=list.get(0).getBbswdate() %><hr/></h2>
			</td>	
			
				<td	rowspan="2">
				<div class="like">
					<button type="button">좋아요</button><br>
					<button type="button">싫어요</button>
				</div>
				</td>
			
		</tr>
		<tr>
			<td><article class="content">
					<%=list.get(0).getBbscontent()%><br>
				모임날짜 <%=list.get(0).getBbsjoindate() %>
				</article>
			</td>
		</tr>
		
		<tr>
			
		</tr>
	</table>
<a href="CommunityControl?command=list">글목록</a>
<a href="CommunityControl?command=update&seq=<%=list.get(0).getBbsseq() %>">수정</a>
<a href="CommunityControl?command=delet&seq=<%=list.get(0).getBbsseq() %>">삭제</a>
<br>


<table border="1">
	<col width="400"> <col width="100">
	<%if(list==null||list.size()==0){
				
			%><tr>
				<td colspan="2">등록된 댓글이 없습니다.</td>
				</tr>
				
				
				
			<%
	}else{
		for(int i = 0;i<list.size();i++){
			%>
		
	<tr>
		<td> <%= list.get(i).getCommentid() %><br><%=list.get(i).getCommentwdate() %>작성
		<td rowspan="2"><input type="button" value="같이해요!">  </td>
	</tr>
	<tr>
		<td><%=list.get(i).getCommentcontent() %> </td>
	</tr>

<%
		}
	}
%>
</table>




<table>
<tr>
	<th> 댓 글 </th>
</tr>
			<col width="100"> <col width="700">
			<tr>
			
				<td colspan="2">
					<input type="text" id="id" readonly="readonly" value="<%=mem.getId() %>" size="100">
					<input type="hidden" name="id" value="<%=mem.getId() %>">
	 				<input type="hidden" name="command" value="commentAF">
				</td>
			</tr>
			
			
			
			<tr>
				
				<td colspan="2">
					<textarea name="content" id="summernote"></textarea>
				</td>
			</tr>
			<tr>
		 		<td colspan="2">
		 			<input type="submit" value="댓글달기" > <input type="reset" id="cancel" value="리셋"> 
		 			
		 		</td>
	 		</tr>
			
		</table>
	</div>
</form>
<%
}
%>
<script type="text/javascript">

$(document).ready(function() {
     $('#summernote').summernote({
             height: 200,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
     });
     
});
</script>








</body>
</html>