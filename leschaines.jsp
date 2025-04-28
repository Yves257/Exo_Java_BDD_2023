<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de caractères</h1>
<form action="#" method="post">
    <p>Saisir une chaine (Du texte avec 6 caractères minimum) : <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<% String chaine = request.getParameter("chaine"); %>

<% if (chaine != null && chaine.length() >= 6) { %>

    <%-- Obtention de la longueur de la chaîne --%>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>

    <%-- Extraction du 3° caractère dans votre chaine --%>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3° caractère de votre chaine est la lettre <%= caractereExtrait %></p>

    <%-- Obtention d'une sous-chaîne --%>
    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous chaine de votre texte : <%= sousChaine %></p>

    <%-- Recherche de la lettre "e" --%>
    <% char recherche = 'e'; 
       int position = chaine.indexOf(recherche); %>
    <p>Votre premier "e" est en : <%= position %></p>

<h2>Exercice 1 : Combien de 'e' dans notre chaine de caractères ?</h2>
<p>Ecrire un programme pour compter le nombre de lettre e dans votre chaine de caractères</p>

<%-- Compter le nombre de 'e' dans la chaîne --%>
<% int countE = 0;
   for (int i = 0; i < chaine.length(); i++) {
       if (chaine.charAt(i) == 'e') {
           countE++;
       }
   } %>
<p>Le nombre de 'e' dans votre chaîne est : <%= countE %></p>

<h2>Exercice 2 : Affichage verticale</h2>
<p>Ecrire le programme pour afficher le texte en vertical</br>
Exemple : Bonjour</br>
B</br>
o</br>
n</br>
j</br>
o</br>
u</br>
r</p>

<%-- Afficher le texte en vertical --%>
<% for (int i = 0; i < chaine.length(); i++) { %>
    <p><%= chaine.charAt(i) %></p>
<% } %>

<h2>Exercice 3 : Retour à la ligne</h2>
<p>La présence d'un espace provoque un retour à la ligne </br>
Exemple : L'hiver sera pluvieux</br>
L'hiver</br>
sera</br>
pluvieux</p>

<%-- Retour à la ligne à chaque espace --%>
<% String[] mots = chaine.split(" "); %>
<% for (String mot : mots) { %>
    <p><%= mot %></p>
<% } %>

<h2>Exercice 4 : Afficher une lettre sur deux</h2>
<p>Ecrire le programme pour afficher seulement une lettre sur deux de votre texte </br>
Exemple : L'hiver sera pluvieux</br>
Lhvrsr lvex</p>

<%-- Afficher une lettre sur deux --%>
<% StringBuilder sb = new StringBuilder();
   for (int i = 0; i < chaine.length(); i += 2) {
       sb.append(chaine.charAt(i));
   } %>
<p>Une lettre sur deux : <%= sb.toString() %></p>

<h2>Exercice 5 : La phrase en verlant</h2>
<p>Ecrire le programme afin d'afficher le texte en verlant </br>
Exemple : L'hiver sera pluvieux</br>
xueivulp ares revih'l</p>

<%-- Afficher le texte en verlant --%>
<% StringBuilder sbVerlant = new StringBuilder(chaine);
   sbVerlant.reverse(); %>
<p>Le texte en verlant : <%= sbVerlant.toString() %></p>

<h2>Exercice 6 : Consonnes et voyelles</h2>
<p>Ecrire le programme afin de compter les consonnes et les voyelles dans votre texte</p>

<%-- Compter les consonnes et les voyelles --%>
<% int countVoyelles = 0;
   int countConsonnes = 0;
   String voyelles = "aeiouyAEIOUY";
   for (int i = 0; i < chaine.length(); i++) {
       char c = chaine.charAt(i);
       if (voyelles.indexOf(c) != -1) {
           countVoyelles++;
       } else if (Character.isLetter(c)) {
           countConsonnes++;
       }
   } %>
<p>Nombre de voyelles : <%= countVoyelles %></p>
<p>Nombre de consonnes : <%= countConsonnes %></p>

<% } else { %>
    <p>Veuillez saisir une chaîne de caractères avec au moins 6 caractères.</p>
<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
