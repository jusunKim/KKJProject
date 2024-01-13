<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .header_nav {
            height: 50px;
            width: 400px;
            display: flex;
            font-size:15px;
            margin: 0 auto; /* 수평 가운데 정렬 */
        }

        .header_nav1, .header_nav2 {
            width: 130px;
            border: 1px solid #c7c7c7;
            background-color: transparent;
            cursor: pointer;
            
        }

        .header_nav3 {
            width: 140px;
            border: 1px solid #c7c7c7;
            background-color: transparent;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 10px; 
            cursor: pointer;
            
        }

        .header_nav1 {
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
        }

        .header_nav3 {
            border-top-right-radius: 30px;
            border-bottom-right-radius: 30px;
        }

        .circle_button {
            background-color: #01d1ca;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: none;
            outline: none;
            color: #fff;
            cursor: pointer;
        }

        .header_nav3_text {
            font-size: 15px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <div class="header_nav">
        <button class="header_nav1">여행지</button>
        <button class="header_nav2">체크아웃</button>
        <div class="header_nav3">
            <span class="header_nav3_text">인원수</span>
            <button class="circle_button"></button>
        </div>
    </div>
</body>
</html>