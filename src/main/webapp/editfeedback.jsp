<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Feedback</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            background-color: #2c2f33;
            color: white;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            background-color: #40444b;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-sizing: border-box;
            /* Center the form vertically and horizontally (already handled by body flex) */
        }
        label, input, textarea, select {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            font-size: 16px;
        }
        input, textarea, select {
            padding: 8px;
            background-color: #2c2f33;
            border: 1px solid #555;
            color: white;
            border-radius: 4px;
        }
        button {
            background-color: #7289da;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover {
            background-color: #5b6eae;
        }
        .rating-section {
                    text-align: center;
                }

                .star-rating {
                    display: flex;
                    flex-direction: row-reverse;
                    justify-content: center;
                    gap: 0.5rem;
                    margin-top: 0.5rem;
                }

                .star-rating input {
                    display: none;
                }

                .star-rating label {
                    font-size: 2rem;
                    color: #555;
                    cursor: pointer;
                    transition: color 0.2s ease;
                }

                .star-rating label:hover,
                .star-rating label:hover ~ label,
                .star-rating input:checked ~ label {
                    color: #ffcc33;
                }

    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Feedback</h2>
        <form action="EditFeedbackServlet" method="post">
            <input type="hidden" name="id" value="${feedback.id}" />

            <label for="rating">Rating:</label>
            <div class="star-rating">
                <c:forEach var="i" begin="1" end="5" step="1">
                    <c:set var="starNum" value="${6 - i}" />
                    <input type="radio" id="star${starNum}" name="rating" value="${starNum}"
                        <c:if test="${starNum == feedback.rating}">checked</c:if> />
                    <label for="star${starNum}">&#9733;</label>
                </c:forEach>
            </div>

            <label for="couldDoBetter">Your Feedback:</label>
            <textarea name="couldDoBetter" id="couldDoBetter" rows="4" required>${feedback.couldDoBetter}</textarea>

            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
