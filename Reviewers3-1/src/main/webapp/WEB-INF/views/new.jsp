<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 회원가입 폼 따기</title>
<link href="<c:url value="/resources/new.css" />" rel="stylesheet">
</head>
<body>
<div class="member">
        <!-- 1. 로고 -->
        <h1>#REVIEWERS</h1>

        <!-- 2. 필드 -->
        <div class="field">
            <b>아이디</b>
            <span class="placehold-text"><input type="text" id="username"></span> 
            <div class="failure-message hide" style="color:coral;">아이디 다섯글자 이상이여야 합니다.</div>
            <div class="success-message hide" style="color:coral;">사용할 수 있는 아이디 입니다.</div>
            <div class="null-message hide" style="color:coral;">필수 입력 사항입니다.</div>
        </div>
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password" id="password">
        </div>
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password" id="password-retype">
            <div class="mismatch-message hide" style="color:coral;">두 비밀번호가 일치하지 않습니다.</div>
            <div class="rightmatch-message hide" style="color:coral;">비밀번호가 일치합니다.</div> 
        </div>
        <div class="field">
            <b>이름</b>
            <input type="text">
        </div>

        <!-- 3. 필드(생년월일) -->
        <div class="field birth">
            <b>생년월일</b>
            <div>
                <input type="number" placeholder="년(4자)">                
                <select>
                    <option value="">월</option>
                    <option value="">1월</option>
                    <option value="">2월</option>
                    <option value="">3월</option>
                    <option value="">4월</option>
                    <option value="">5월</option>
                    <option value="">6월</option>
                    <option value="">7월</option>
                    <option value="">8월</option>
                    <option value="">9월</option>
                    <option value="">10월</option>
                    <option value="">11월</option>
                    <option value="">12월</option>
                </select>
                <input type="number" placeholder="일">
            </div>
        </div>

        <!-- 4. 필드(성별) -->
        <div class="field gender">
            <b>성별</b>
            <div>
                <label><input type="radio" name="gender">남자</label>
                <label><input type="radio" name="gender">여자</label>
                <label><input type="radio" name="gender">선택안함</label>
            </div>
        </div>

        <!-- 5. 이메일_전화번호 -->
        <div class="field">
            <b>본인 확인 이메일<small>(필수)</small></b>
            <input type="email" placeholder="필수입력사항입니다.">
        </div>


        <!-- 6. 가입하기 버튼 -->
        <input type="submit" value="가입하기" id="joinbutton">

        <!-- 7. 푸터 -->
        <div class="member-footer">
            <div>
                <a href="#none">이용약관</a>
                <a href="#none">업데이트예정</a>
                <a href="#none">업데이트예정</a>
                <a href="#none">업데이트예정</a>
            </div>
            <span><a href="#none">REVIEWERS TEAM</a></span>
        </div>
    </div>


<script type="text/javascript">

let elInputUsername = document.querySelector('#username')
let elInputPassword = document.querySelector('#password')
let elInputPasswordretype = document.querySelector('#password-retype')
let elJoinbutton = document.querySelector('#joinbutton')

let elFailuremessage = document.querySelector('.failure-message')
let elSuccessmessage = document.querySelector('.success-message')
let elNullmessage = document.querySelector('.null-message')
let elMismatchmessage = document.querySelector('.mismatch-message')
let elRightmatchmessage = document.querySelector('.rightmatch-message')

elJoinbutton.disabled = true;

//아이디 입력창에 글자를 키보드로 입력할 때, 성공메시지와 실패메시지를 보여주는 함수
elInputUsername.onkeyup = function () {
	if(elInputUsername.value==""){
		elNullmessage.classList.remove('hide')
	}
		if (isMoreThan4Length(elInputUsername.value)) {
			elNullmessage.classList.add('hide')
			elFailuremessage.classList.add('hide')
		    elSuccessmessage.classList.remove('hide')
		  }  
		  else{
		    elSuccessmessage.classList.add('hide')

		    elFailuremessage.classList.remove('hide')
		  }
		}
  

//글자수가 5개이상이면
function isMoreThan4Length(value) {
  return value.length >= 5
}

//비밀번호 입력창에 값을 입력하면, 비밀번호 값과 비밀번호 확인값이 일치하지 않으면 불일치 메시지를 표시하는 함수
elInputPasswordretype.onkeyup = function () {
  if ( elInputPassword.value == elInputPasswordretype.value) {
    elMismatchmessage.classList.add('hide')
    
    elRightmatchmessage.classList.remove('hide')
  }
  else {
    elMismatchmessage.classList.remove('hide')
    
    elRightmatchmessage.classList.add('hide')
  }
}

//비밀번호 값과 비밀번호 확인값이 일치하는지 판별하는 함수
function isMatch (password1, password2) {
  if ( password1 === password2 ) {
    return true;
  }
  else {
    return false;
  }
}

//전화번호 값을 숫자값만 받는 함수
function isNumbermatch(value) {
  let phonenumber = /^[0-9]*$/
  if ( phonenumber.test(value) === true ) {
    return true;
  }
  else {
    return false;
  }
}

elInputUsername.addEventListener('keyup', button)
elInputPassword.addEventListener('keyup', button)
elInputPasswordretype.addEventListener('keyup', button)

//아이디, 비밀번호, 비밀번호 확인, 전화번호 값을 모두 입력하였을 때, 회원가입 버튼이 활성화 되는 함수
function button() {
  switch (!(elInputUsername.value && elInputPassword.value && elInputPasswordretype.value && elNumbertype.value)) {
    case true : elJoinbutton.disabled = true; break;
    case false : elJoinbutton.disabled = false; break
  }
}
</script>

</body>
</html>