<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            background-color: #1e1e2f;
            color: #e0e0f0;
            background-image: url('https://wallpaperaccess.com/full/13672.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-blend-mode: overlay;
            background-color: rgba(30, 30, 47, 0.9);
        }

        .feedback-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: rgba(40, 40, 60, 0.95);
            border-radius: 10px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(4px);
        }

        h2 {
            color: #b8b8ff;
            margin-bottom: 1rem;
            text-align: center;
        }

        .feedback-intro {
            text-align: center;
            margin-bottom: 2rem;
            color: #cfcfe6;
        }

        .feedback-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
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

        .come-back-section {
            margin-bottom: 1rem;
        }

        .come-back-section h3 {
            margin-bottom: 0.8rem;
            color: #b8b8ff;
            text-align: center;
        }

        .checkbox-group {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            margin-top: 0.5rem;
        }

        .checkbox-option {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #e0e0f0;
        }

        .feedback-inputs {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        label {
            font-weight: 600;
            color: #d0d0ff;
        }

        textarea {
            padding: 0.8rem;
            border: 1px solid #444;
            border-radius: 5px;
            resize: vertical;
            font-family: inherit;
            font-size: 1rem;
            transition: border-color 0.2s ease;
            background-color: rgba(20, 20, 30, 0.9);
            color: #e0e0f0;
        }

        textarea:focus {
            outline: none;
            border-color: #7f5af0;
        }

        .submit-btn {
            background-color: #7f5af0;
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
            align-self: center;
            min-width: 200px;
        }

        .submit-btn:hover {
            background-color: #6246ea;
        }

        @media (max-width: 600px) {
            .feedback-container {
                margin: 1rem;
                padding: 1rem;
            }

            .checkbox-group {
                flex-direction: column;
                gap: 0.5rem;
                align-items: center;
            }

            .star-rating label {
                font-size: 1.5rem;
            }

            .submit-btn {
                width: 100%;
            }
        }

        .message {
            margin-top: 1rem;
            padding: 1rem;
            border-radius: 5px;
            text-align: center;
        }

        .success {
            background-color: #2e7d32;
            color: #d0ffd0;
            border: 1px solid #4caf50;
        }

        .error {
            background-color: #c62828;
            color: #ffd0d0;
            border: 1px solid #ef5350;
        }
    </style>
</head>
<body>
    <div class="feedback-container">
        <h2>Feedback</h2>
        <p class="feedback-intro">We value your opinion! Please share your feedback.</p>

        <form action="listFeedback" method="post" class="feedback-form">
            <div class="come-back-section">
                <h3>Will You Come Back?</h3>
                <div class="checkbox-group">
                    <label class="checkbox-option">
                        <input type="radio" name="comeBack" value="yes"> Yes
                    </label>
                    <label class="checkbox-option">
                        <input type="radio" name="comeBack" value="maybe"> Maybe
                    </label>
                    <label class="checkbox-option">
                        <input type="radio" name="comeBack" value="no"> No
                    </label>
                </div>
            </div>

            <div class="rating-section">
                <label for="rating">Your Rating:</label>
                <div class="star-rating">
                    <input type="radio" id="star5" name="rating" value="5"><label for="star5">&#9733;</label>
                    <input type="radio" id="star4" name="rating" value="4"><label for="star4">&#9733;</label>
                    <input type="radio" id="star3" name="rating" value="3"><label for="star3">&#9733;</label>
                    <input type="radio" id="star2" name="rating" value="2"><label for="star2">&#9733;</label>
                    <input type="radio" id="star1" name="rating" value="1"><label for="star1">&#9733;</label>
                </div>
            </div>

            <div class="feedback-inputs">
                <div class="input-group">
                    <label for="feedback">REVIEW</label>
                    <textarea name="couldDoBetter" id="couldDoBetter" rows="5" required></textarea>
                </div>
            </div>

            <button type="submit" class="submit-btn">Submit Feedback</button>
        </form>

        <!-- Display messages based on status -->
        <%
            String status = request.getParameter("status");
            if ("success".equals(status)) {
        %>
            <div class="message success">Thank you for your feedback!</div>
        <%
            } else if ("error".equals(status)) {
        %>
            <div class="message error">Something went wrong. Please try again.</div>
        <%
            }
        %>
    </div>
</body>
</html>
