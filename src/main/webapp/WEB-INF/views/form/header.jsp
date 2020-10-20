<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMESEEK</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
</head>
<body>

   <header> 
      <div class="header">
         <div class="logo">
            <a href="#">HOME<span>SEE</span>K</a>
         </div>
         
         <ul class="nav">
   
            <li><a href="#">전체 방 조회</a></li>
            <li><a href="#">방 올리기</a></li> 
            
            <li><div class="dropdown">
                 <button class="dropbtn">게시판</button>
                    <div class="dropdown-content">
                      <a href="#">공지사항</a>
                      <a href="#">Q & A</a>
                    </div>
            </div></li>
                        
            <li><a href="#">채팅</a></li> 
            <li><a href="#">후원하기</a></li> 
            <li><a href="#">Kr | En</a></li> 

            <li>
            <span class="login">
               <a href="loginform.do">LOGIN | REGIST</a>
            </span>
            </li>
           
            
         </ul>
      </div>
   </header>
</body>
</html>