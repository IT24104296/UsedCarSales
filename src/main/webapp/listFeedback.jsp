<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.feedback.Feedback" %>
<%@ page import="java.util.List" %>

<%
    List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");
    if (feedbackList == null) {
        feedbackList = new java.util.ArrayList<>();
    }
    request.setAttribute("feedbackList", feedbackList);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reviews</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #2c2f33;
            color: #f1f1f1;
        }
        .review-box {
            background-color: #40444b;
            border: 1px solid #555;
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            position: relative;
        }
        .stars {
            font-size: 18px;
            margin-bottom: 8px;
        }
        .stars span {
            color: #ffd700;
        }
        .stars span.empty {
            color: #555;
        }
        .review-text {
            font-size: 16px;
            color: #e0e0e0;
            margin-bottom: 10px;
        }
        .timestamp {
            font-size: 12px;
            color: #bbb;
        }
        a.button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #7289da;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        a.button:hover {
            background-color: #5b6eae;
        }
        h2 {
            color: #ffffff;
        }
        .options-menu {
            position: absolute;
            top: 15px;
            right: 15px;
        }
        .options-menu a {
            color: #bbb;
            margin-left: 10px;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
        }
        .options-menu a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <h2>Reviews</h2>

    <c:choose>
        <c:when test="${not empty feedbackList}">
            <c:forEach var="fb" items="${feedbackList}">
                <div class="review-box">
                    <div class="stars">
                        <c:forEach var="star" begin="1" end="5">
                            <c:choose>
                                <c:when test="${star <= fb.rating}">
                                    <span>&#9733;</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="empty">&#9733;</span>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <div class="review-text">${fb.couldDoBetter}</div>
                    <div class="timestamp">${fb.timestamp}</div>
                    <div class="options-menu">
                        <a href="EditFeedbackServlet?id=${fb.id}" title="Edit">&#9998;</a> <!-- Pencil icon -->
                        <a href="DeleteFeedbackServlet?id=${fb.id}" title="Delete" onclick="return confirm('Are you sure you want to delete this feedback?');">&#10006;</a> <!-- Cross icon -->
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>No reviews submitted yet.</p>
        </c:otherwise>
    </c:choose>

    <a href="index.jsp" class="button">Give Another Feedback</a>
</body>
</html>
