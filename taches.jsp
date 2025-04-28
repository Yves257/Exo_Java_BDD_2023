<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>

<html>
<head>
<title>Mini Gestionnaire de Tâches</title>
</head>
<body bgcolor="white">
<h1>Mini Gestionnaire de Tâches</h1>

<h2>Ajouter une Tâche</h2>
<form action="taches.jsp" method="post">
    <label for="title">Titre de la tâche :</label>
    <input type="text" id="title" name="title" required><br>
    <label for="description">Description :</label>
    <input type="text" id="description" name="description" required><br>
    <label for="dueDate">Date d'échéance :</label>
    <input type="text" id="dueDate" name="dueDate" required><br>
    <input type="submit" value="Ajouter la tâche">
</form>

<%! 
    // Classe Task définie directement dans le fichier JSP
    public class Task {
        private String title;
        private String description;
        private String dueDate;  // Date d'échéance
        private boolean isCompleted;

        public Task(String title, String description, String dueDate) {
            this.title = title;
            this.description = description;
            this.dueDate = dueDate;
            this.isCompleted = false;
        }

        // Getters et Setters
        public String getTitle() {
            return title;
        }

        public String getDescription() {
            return description;
        }

        public String getDueDate() {
            return dueDate;
        }

        public boolean isCompleted() {
            return isCompleted;
        }

        public void setCompleted(boolean isCompleted) {
            this.isCompleted = isCompleted;
        }
    }
%>

<%
    // Récupération de la liste des tâches depuis la session
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<Task>();
        session.setAttribute("tasks", tasks);
    }

    // Ajouter une nouvelle tâche à la liste
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    if (title != null && description != null && dueDate != null) {
        Task newTask = new Task(title, description, dueDate);
        tasks.add(newTask);
    }
%>

<h2>Liste des Tâches</h2>
<% 
    Iterator<Task> iterator = tasks.iterator();
    while (iterator.hasNext()) {
        Task task = iterator.next();
%>
        <p>
            <b>Titre:</b> <%= task.getTitle() %> <br>
            <b>Description:</b> <%= task.getDescription() %> <br>
            <b>Date d'échéance:</b> <%= task.getDueDate() %> <br>
            <b>Statut:</b> <%= task.isCompleted() ? "Terminée" : "En cours" %> <br>
            <form action="taches.jsp" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="taskTitle" value="<%= task.getTitle() %>">
                <input type="submit" value="Supprimer">
            </form>
            <form action="taches.jsp" method="post">
                <input type="hidden" name="action" value="complete">
                <input type="hidden" name="taskTitle" value="<%= task.getTitle() %>">
                <input type="submit" value="Marquer comme terminée">
            </form>
        </p>
<%
    }

    // Suppression d'une tâche
    String action = request.getParameter("action");
    if ("delete".equals(action)) {
        String taskTitle = request.getParameter("taskTitle");
        tasks.removeIf(task -> task.getTitle().equals(taskTitle));
    }

    // Marquer une tâche comme terminée
    if ("complete".equals(action)) {
        String taskTitle = request.getParameter("taskTitle");
        for (Task task : tasks) {
            if (task.getTitle().equals(taskTitle)) {
                task.setCompleted(true);
                break;
            }
        }
    }
%>

</body>
</html>
