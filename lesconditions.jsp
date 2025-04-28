<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p>Saisir la valeur A : <input type="text" id="inputValeur" name="valeurA">
    <p>Saisir la valeur B : <input type="text" id="inputValeur" name="valeurB">
    <p>Saisir la valeur C : <input type="text" id="inputValeur" name="valeurC">
    <p>Saisir un nombre pour vérifier s'il est pair ou impair : <input type="text" id="inputValeur" name="valeurPairImpair">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<% String valeur1 = request.getParameter("valeur1"); %>
<% String valeur2 = request.getParameter("valeur2"); %>
<% String valeurA = request.getParameter("valeurA"); %>
<% String valeurB = request.getParameter("valeurB"); %>
<% String valeurC = request.getParameter("valeurC"); %>
<% String valeurPairImpair = request.getParameter("valeurPairImpair"); %>

<%-- Vérification de la condition entre les deux valeurs --%>
<% if (valeur1 != null && valeur2 != null) { %>
    <%-- Conversion des valeurs en entiers pour la comparaison --%>
    <% int intValeur1 = Integer.parseInt(valeur1); %>
    <% int intValeur2 = Integer.parseInt(valeur2); %>
    
    <%-- Condition if pour comparer les valeurs --%>
    <% if (intValeur1 > intValeur2) { %>
        <p>Valeur 1 est supérieure à Valeur 2.</p>
    <% } else if (intValeur1 < intValeur2) { %>
        <p>Valeur 1 est inférieure à Valeur 2.</p>
    <% } else { %>
        <p>Valeur 1 est égale à Valeur 2.</p>
    <% } %>
<% } %>

<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>

<%-- Vérification si C est compris entre A et B --%>
<% if (valeurA != null && valeurB != null && valeurC != null) { %>
    <%-- Conversion des valeurs en entiers pour la comparaison --%>
    <% int intValeurA = Integer.parseInt(valeurA); %>
    <% int intValeurB = Integer.parseInt(valeurB); %>
    <% int intValeurC = Integer.parseInt(valeurC); %>
    
    <%-- Condition if pour vérifier si C est compris entre A et B --%>
    <% if (intValeurC >= intValeurA && intValeurC <= intValeurB) { %>
        <p>Oui, C est compris entre A et B.</p>
    <% } else { %>
        <p>Non, C n'est pas compris entre A et B.</p>
    <% } %>
<% } %>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>

<%-- Vérification si le nombre est pair ou impair --%>
<% if (valeurPairImpair != null) { %>
    <%-- Conversion de la valeur en entier pour la comparaison --%>
    <% int intValeurPairImpair = Integer.parseInt(valeurPairImpair); %>
    
    <%-- Condition if pour vérifier si le nombre est pair ou impair --%>
    <% if (intValeurPairImpair % 2 == 0) { %>
        <p>Le nombre <%= intValeurPairImpair %> est pair.</p>
    <% } else { %>
        <p>Le nombre <%= intValeurPairImpair %> est impair.</p>
    <% } %>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
