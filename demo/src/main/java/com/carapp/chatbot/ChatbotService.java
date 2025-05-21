package com.carapp.chatbot;

import java.util.HashMap;
import java.util.Map;

public class ChatbotService {
    private Map<String, String> responses;

    public ChatbotService() {
        responses = new HashMap<>();
        loadResponses();
    }

    private void loadResponses() {
        responses.put("hi", "Hello! How can I assist you with your car purchase?");
        responses.put("test drive", "You can schedule a test drive on our website or by contacting us. Would you like the link to book one?");
        responses.put("financing", "We offer competitive financing options. Please contact our team for personalized plans.");
        responses.put("warranty", "Most of our vehicles come with a warranty. Would you like details for a specific model?");
        responses.put("trade in", "Yes, we accept trade-ins! Submit your car’s details online for an estimated value.");
        responses.put("delivery", "Delivery typically takes 3-7 business days, depending on your location.");
    }

    public String getReply(String message) {
        if (message == null || message.trim().isEmpty()) {
            return "Please ask a question about cars.";
        }
        String msg = message.toLowerCase().trim();
        for (String key : responses.keySet()) {
            if (msg.contains(key)) {
                return responses.get(key);
            }
        }
        return "I’m not sure about that. Try asking about test drives, financing, warranties, trade-ins, or delivery!";
    }
}
