<%-- 
    Document   : game.jsp
    Created on : Apr 25, 2015, 10:47:09 PM
    Author     : mrquorr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="js/game.js"></script>
    </head>
    <body>
        <div id="main-game">
            <table class="col-md-12">
                <tr >
                    <th class="col-md-2" id="00">00</td>
                    <th class="col-md-2" id="01">01</td>
                    <th class="col-md-2" id="02">02</td>
                    <th class="col-md-2" id="03">03</td>
                    <th class="col-md-2" id="04">04</td>
                    <th class="col-md-2" id="05">05</td>
                </th>
                <tr>
                    <td class="col-md-2 square" id="10">10</td>
                    <td class="col-md-2 square" id="11">11</td>
                    <td class="col-md-2 square" id="12">12</td>
                    <td class="col-md-2 square" id="13">13</td>
                    <td class="col-md-2 square" id="14">14</td>
                    <td class="col-md-2 square" id="15">15</td>
                </tr>
                <tr>
                    <td class="col-md-2 square" id="20">20</td>
                    <td class="col-md-2 square" id="21">21</td>
                    <td class="col-md-2 square" id="22">22</td>
                    <td class="col-md-2 square" id="23">23</td>
                    <td class="col-md-2 square" id="24">24</td>
                    <td class="col-md-2 square" id="25">25</td>
                </tr>
                <tr>
                    <td class="col-md-2 square" id="30">30</td>
                    <td class="col-md-2 square" id="31">31</td>
                    <td class="col-md-2 square" id="32">32</td>
                    <td class="col-md-2 square" id="33">33</td>
                    <td class="col-md-2 square" id="34">34</td>
                    <td class="col-md-2 square" id="35">35</td>
                </tr>
                <tr>
                    <td class="col-md-2 square" id="40">40</td>
                    <td class="col-md-2 square" id="41">41</td>
                    <td class="col-md-2 square" id="42">42</td>
                    <td class="col-md-2 square" id="43">43</td>
                    <td class="col-md-2 square" id="44">44</td>
                    <td class="col-md-2 square" id="45">45</td>
                </tr>
                <tr>
                    <td class="col-md-2 square" id="50">50</td>
                    <td class="col-md-2 square" id="51">51</td>
                    <td class="col-md-2 square" id="52">52</td>
                    <td class="col-md-2 square" id="53">53</td>
                    <td class="col-md-2 square" id="54">54</td>
                    <td class="col-md-2 square" id="55">55</td>
                </tr>
            </table>
        </div>
    </body>
</html>
