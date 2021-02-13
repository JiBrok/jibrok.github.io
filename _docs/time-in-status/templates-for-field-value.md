---
title: Templates for field values
key: time-in-status
---


You can configure how to display the values of the Time in status, Timer, and Stopwatch fields. This is done through the configuration of the fields.

The template uses [velocity](https://velocity.apache.org/engine/1.7/user-guide.html) and a number of predefined variables to render the value. Благодаря этому вы можете с помощью html задать абсолютно любой вид вашим полям, а не только предоставляемый вендором.

В меню со всеми шаблонами вы можете посмотреть какие шаблоны есть и где они используются.

<p style="text-align: center;"><a href="/uploads/time-in-status/templates/1.png"><img src="/uploads/time-in-status/templates/1.png" style="width:600px"/></a></p>

В самом шаблоне вы можете использовать HTML, JavaScript и предопределенные переменные, которые зависят от выбранного типа поля.

Небольшой пример что можно сделать:<br>
* Вывести нужные данные о таймере в таблицу:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/templates/2.png"><img src="/uploads/time-in-status/templates/2.png" style="width:300px"/></a></p>


<script src="https://gist.github.com/JiBrok/9999437e950b81d35853d85c4975caad.js"></script>

* Подключить этот шаблон в настройках поля:<br>
  <p style="text-align: center;"><a href="/uploads/time-in-status/templates/3.png"><img src="/uploads/time-in-status/templates/4.png" style="width:300px"/></a></p>
  
* И вот так теперь будет выглядеть значение таймера в задаче:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/templates/3.png"><img src="/uploads/time-in-status/templates/3.png" style="width:300px"/></a></p>
  

Теперь вы ничем не ограничены и можете как угодно настраивать отображение значений.