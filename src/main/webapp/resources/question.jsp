<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>POF 문의하기</title>
<link href="/resources/css/questionbox.css" rel="stylesheet">
      <link rel="stylesheet" href="style.css">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
   <body>
      <div class="container">
      <div class="text">
         무엇이든 문의 하세요 P O F
      </div>
      <form action="#">
         <div class="form-row">
            <div class="input-data">
               <input type="text" required>
               <div class="underline"></div>
               <label for="">회원 아이디</label>
            </div>
            <div class="input-data">
               <input type="text" required>
               <div class="underline"></div>
               <label for="">주문 ID</label>
            </div>
         </div>
         <div class="form-row">
            <div class="input-data">
               <input type="text" required>
               <div class="underline"></div>
               <label for="">Email Address</label>
            </div>
            <div class="input-data">
               <input type="text" required>
               <div class="underline"></div>
               <label for="">상품 이름</label>
            </div>
         </div>
         <div class="form-row">
         <div class="input-data textarea">
            <textarea rows="8" cols="80" required></textarea>
            <br />
            <div class="underline"></div>
            <label for="">Write your message</label>
            <br />
            <div class="form-row submit-btn">
               <div class="input-data">
                  <div class="inner"></div>
                  <input type="submit" value="submit">
               </div>
            </div>
      </form>
      </div>
   </body>