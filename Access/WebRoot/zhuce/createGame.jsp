<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!--[if IE 8 ]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9 ]> <html lang="en" class="ie9"> <![endif]-->

<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta charset="utf-8"/>

<title>发起比赛</title>

<!--[if lt IE 9]>

<script src="js/html5shiv.js"></script>

<![endif]-->

<link href="css/1140.css" rel="stylesheet"/>

<link href="css/normalize.css" rel="stylesheet"/>

<link href="css/jquery-ui.css" rel="stylesheet"/>

<link href="css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

<link href="css/styles.css" rel="stylesheet" media="all"/>

</head>

<body>



<header>

  <div class="container clearfix">

    <div class="row">

      <div class="twelvecol last">

        <h1 id="title"></h1>

      </div>

    </div>

  </div>

</header>



<div id="main">

<div class="container clearfix">

<div class="row">



  <div class="fourcol content">

    <h1>发起比赛</h1>

    <p>在这里，你可以发起任何比赛</p>

    <h2>比赛信息:</h2>

    <ul>

    	<li>比赛名称</li>

    	<li>比赛人群</li>

      <li>比赛状态 <code>报名期</code>, <code>审核期</code>, <code>决赛期</code> 和 <code>结束期</code></li>

      <li>比赛简介</li>

    	<!-- <li>"On the spot" validation</li>

    	<li>Localization</li> -->

      <!--<li>HTML5 <code>placeholder</code> polyfill</li>-->

    </ul>

    <h2>比赛时间:</h2>

    <ul>

    	<li><strong>报名时间 </strong></li>

    	<li><strong>报名截止时间 </strong></li>

    	<li><strong>作品提交截止时间 </strong></li>

    </ul>



  </div>



  <div class="eightcol last">



    <!-- Begin Form -->



    <form id="my-form" action="<c:url value='/GameServlet?method=add'/>" method="post">



        <section name="Step 1">

          <div>

            <h2>Initiate A Contest:</h2>

            <p>Come On! Start A New Challenge!</p>

          </div>

          <div><label>比赛名称:</label><input id="username" name="name" type="text"/></div>

          <!-- <div><label>Password:</label><input id="pass" name="password" type="password"/></div>

          <div><label>E-Mail:</label><input id="email" name="email" data-ideal="required email" type="email"/></div> -->

          <div><label>报名时间:</label><input name="start" class="datepicker" data-ideal="date" type="text" placeholder="月/日/年"/></div>

          <div><label>报名截止时间:</label><input name="stop" class="datepicker" data-ideal="date" type="text" placeholder="月/日/年"/></div>

          <div><label>作品提交时间:</label><input name="end" class="datepicker" data-ideal="date" type="text" placeholder="月/日/年"/></div>

          <!-- <div><label>Image:</label><input id="file" name="file" multiple type="file"/></div>

          <div><label>Website:</label><input name="website" data-ideal="url" type="text"/></div> -->

          <div><label>比赛简介:</label><textarea id="comments" name="detail"></textarea></div>
        
        </section>



        <section name="Step 2">

          <div>

            <h2>Options:</h2>

            <p>Please Select Relevant Information.</p>

          </div>

          <div><label>比赛状态:</label>

            <select id="states" name="statu">
  
              <option value="default">&ndash; 选择状态 &ndash;</option>
  
              <option value="0">报名期</option>
  
              <option value="1">审核期</option>
  
              <option value="2">决赛期</option>
  
              <option value="3">结束期</option>
  
             
            </select>
  
          </div>

          <div><label>比赛人群:</label>

            <label><input type="radio" name="kind" value="0" checked/>全部学生</label>

            <label><input type="radio" name="kind" value="1"/>大一新生</label>

            <label><input type="radio" name="kind" value="2"/>大二/大三</label>

          </div>

        </section>


      <div><hr/></div>



      <div>

        <button type="submit">Submit</button>

        <button id="reset" type="button">Reset</button>

      </div>



    </form>



    <!-- End Form -->



  </div>



</div>

</div>

</div><! -- End Main -->







<script src="js/jquery-1.8.2.min.js"></script>

<script src="js/jquery-ui.min.js"></script>

<script src="js/jquery.idealforms.js"></script>

<script>







  var options = {



    onFail: function() {

      alert( $myform.getInvalid().length +' invalid fields.' )

    },



    inputs: {

      'password': {

        filters: 'required pass',

      },

      'username': {

        filters: 'required username',

        data: {

          //ajax: { url:'validate.php' }

        }

      },

      'file': {

        filters: 'extension',

        data: { extension: ['jpg'] }

      },



      'comments': {

        filters: 'min max',

        data: { min: 50, max: 200 }

      },

      'states': {

        filters: 'exclude',

        data: { exclude: ['default'] },

        errors : {

          exclude: 'Select a State.'

        }

      },

      'langs[]': {

        filters: 'min max',

        data: { min: 2, max: 3 },

        errors: {

          min: 'Check at least <strong>2</strong> options.',

          max: 'No more than <strong>3</strong> options allowed.'

        }

      }

    }

  };



  var $myform = $('#my-form').idealforms(options).data('idealforms');



  $('#reset').click(function(){ $myform.reset().fresh().focusFirst() });

  $myform.focusFirst();



</script>

<!--��ɾ��-->

<script src="http://www.jq22.com/js/jq.js"></script>

<!--ecd ��ɾ��-->



</body>

</html>