## **Version: v1.0 MVP**


## **Last Updated: 2025-07-24**

---

## **1. 🌍 Product Overview**

  

**MindOwl** transforms passive listening (podcasts, courses, YouTube, training audio) into fast-paced, real-time quiz sessions. It listens through the phone's microphone, sends snippets to the backend for AI processing, and returns personalized questions that challenge the listener in real time.

  

**Core Value Proposition:**

  

> **Time + Attention = Learning**

> Every second spent listening becomes an opportunity to reinforce memory and boost retention — solo or with others.

---

## **2. 🎯 Goals & Objectives**

  

### **Primary Goals for v1.0**

- Build a **server-powered, mic-listening learning app**.
    
- Enable users to **play instantly**, alone or in groups.
    
- Deliver **real-time, context-relevant questions** via AI.
    
- Offer a frictionless onboarding experience with **anonymous login**.
    
- Provide meaningful **feedback and gamified progression**.
    

  

### **Success Metrics (MVP)**

- ⏱️ Time-to-first-question < 20 seconds
    
- 🧠 Question relevance rated ≥ 80% (via user feedback, internal QA)
    
- 🚀 80% of new users complete at least one full session
    
- 🔁 >30% retention at day 3 (goal for post-launch iteration)
    

---

## **3. 👥 Target Users**

|**User Type**|**Needs**|**Pain Points**|
|---|---|---|
|Casual Learners|Make passive listening productive|Boredom, low retention, zoning out|
|Students|Reinforce lectures/podcasts with quizzes|Struggle to retain info from audio|
|Teams / Trainers|Fun group-based revision using shared content|Lack of lightweight, real-time training|
|Quiz Lovers|Fast, competitive trivia with educational value|Static quizzes, no audio-based interactivity|

---

## **4. ✨ Key Features (MVP)**

  

### **4.1 🎧 Mic-Based Listening**

- Listens through phone microphone to external audio (e.g. podcast playing on speaker).
    
- Captures snippets every X seconds for backend processing.
    

  

### **4.2 🧠 Server-Side AI Question Generator**

- Transcription + semantic parsing handled on the backend.
    
- Questions are generated based on last N seconds of audio.
    
- Lightweight, rapid-response API.
    

  

### **4.3 ⚡ Solo Gameplay**

- User hears audio, then a question.
    
- Has limited time to respond.
    
- Points awarded for speed + accuracy.
    

  

### **4.4 👨‍👩‍👧 Group Mode (Same-Room)**

- Everyone hears same content out loud.
    
- Each player uses their phone to buzz in.
    
- Points awarded per round (1st correct = max score).
    

  

### **4.5 🔒 Anonymous Login**

- No email or password required.
    
- User identified via Firebase Anonymous Auth (or similar).
    
- Local persistent session with option to upgrade later.
    

  

### **4.6 🧩 Gamification**

- XP per question and per session.
    
- Streak bonuses.
    
- Performance summary screen at end of session.
    

  

### **4.7 🧾 Stats & Review**

- Show correct/wrong answers.
    
- Option to replay “missed” segments.
    
- Cumulative XP additions
    

### **4.8 🧠 Knowledge Base (🆕)**

- After each session, users see a summary page with:
    
    - List of all questions
        
    - Correct answers + short explanation
        
    - Their selected answer (if any)
        
    
- Each session can be **saved to a Markdown file (.md)** containing:
    
    - Timestamp
        
    - Topic metadata (e.g. podcast name)
        
    - Questions, answers, explanations
        
    
- This is stored in the user’s personal **Knowledge Database**.
    
- Sessions are also saved in the user profile (time, score, answers, content tags).
    

---
---

## **5. 🧪 Technical Requirements**

  

### **5.1 Backend**

- Audio ingestion API (short segments)
    
- Real-time transcription (ASR)
    
- Semantic chunking + prompt to LLM for Q&A
    
- Scoring logic for answers
    
- Session history and XP tracking
    

  

### **5.2 Frontend (Flutter)**

- Mic capture while app is foregrounded
    
- Countdown timers and buzzers
    
- Question UI: MCQ, true/false, fill-in-the-blank (start with one type)
    
- Offline cache of session history (local)
    
- Anonymous login flow
    
- Group mode ( from backend sync firestore document)
    

  

### **5.3 Security & Privacy**

- Audio never stored (streamed, processed, and discarded)
    
- GDPR-friendly: anonymous ID, optional opt-in analytics
    

### **5.4 Markdown Export (🆕)**

- Format summary as .md file with:
    
    - Title, date, source audio metadata
        
    - Each question with:
        
        - Q / A / Explanation
            
        - Answer correctness
            
        
    
- Saved locally and/or sync to cloud storage
---

## **6. 🚧 Out of Scope (MVP)**

- Full offline mode (AI requires server)
    
- Public user profiles / social features
    
- Audio import or podcast library integration
    
- Dynamic difficulty or advanced adaptive learning
    
- Leaderboards or public rankings
    
- Avatars and full user customization
    

---

## **7. 🗺 Roadmap Snapshot**

|**Milestone**|**Target Date**|**Description**|
|---|---|---|
|✅ Spec & Design Freeze|July 25|PRD ready, initial mockups approved|
|🔧 Dev Sprint 1|July 26–Aug 2|Mic input, anonymous login, basic quiz flow|
|🧠 Dev Sprint 2|Aug 3–Aug 9|Backend AI API, scoring, gamification loop|
|🎮 Sprint 3|Aug 10–Aug 15|Group mode (if possible), polish, review system|
|🚀 Shipathon Submission|Aug 16|MVP playable and presentable|

---

## **8. 📌 Open Questions**

- What’s the initial question format? MCQ only or include fill-in-the-blank?
    
- Do we allow skipping questions or is every answer mandatory?
    
- Should we add a feedback option for each question? (e.g., “Was this relevant?”)
    

---

Let me know if you want this turned into a Notion doc, shared Markdown file, Figma handoff, or developer ticket breakdown — I can spin that up next.

| **Question**                    | **Decision**                                                                                                            |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| **1. Initial question format?** | Single-answer quiz (e.g. “Which one is correct?”)                                                                       |
| **2. Is answering mandatory?**  | No. After 10 seconds, unanswered questions are dismissed. May be A/B tested later.                                      |
| **3. Feedback per question?**   | Not inline. Feedback + explanations shown at the end of session. User can export to Markdown and store in knowledge DB. |
