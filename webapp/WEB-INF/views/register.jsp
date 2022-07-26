<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<%@ include file="../comp/script.jsp" %>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

			<title>index.jsp</title>
	</head>
	<style>
		.container-section {
			min-height: 100vh;
			box-sizeing: border-box;
		}

		.container-section.register {
			background-color: #8947CC;
			padding: 0 !important;
			display: flex;
			align-items: center;
		}

		.container.register {
			align-items: left;
			background-color: #f4f4f4;
			width: 650px;
			height: 100%;
			padding: 20px 20px 50px 20px;
			box-shadow: 10px 15px 0px 2px rgb(0 0 255 / 20%);
			border-radius: 5px;

		}

		.container.register .title {
			font-size: 33px;
			font-weight: 600;
			margin-bottom: 10px;
			justify-content: center;
		}

		.--ls {
			font-weight: 600;
		}

		.a {
			position: relative;
			margin: 5px 0 5px 0;
			display: flex;
			flex-direction: column;
		}
		.inner {
			display: flex;
		}
		.left-side {
			width: 50%;
			position: relative;
		}

		.--iwp {
			width: 300px;
		}
		.--iwp > input {
			padding-left: 15px;
		}

		.--uiw {
			position: absolute;
    		right: 10%;
			display: flex;
			align-items: flex-end;
			margin: 0 0 10px 10px;
			color: red;
		}

		.toc-content {
			display: none;

		}

		.profileemoticon {
			float: left;

		}

		.emoji {
			display: flex;
			font-size: 88px;
			justify-content: center;
			align-items: center;
		}
		.emoji > div {
			border-radius: 5px;
			padding: 1px 15px 15px 15px;
			cursor: pointer;
		}
		.emoji > div:hover {
			background: #dddddd;
		}

		.emoji-list {
			position: absolute;
			background: whitesmoke;
    		border: 1px solid #dddddd;
			top: 37%;
			left: 15%;
			padding: 10px;
			font-size: 22px;
			display: flex;
			border-radius: 5px;
			width: 200px;
    		flex-wrap: wrap;
		}
		.emoji-list > div {
			cursor: pointer;
			border-radius: 5px;
    		padding: 1px 4px 4px;
		}
		.emoji-list > div:hover {
			background: #dddddd;
		}
		.button-wrapper {
			display: flex;
    		margin-top: 10px;
		}
		.btw {
			width: 49%;
			margin-right: 5px;
		}
		.btw:last-child {
			margin-right: 0px;
		}
		.bt {
			width: 100%;
			background: #8947cc;
			border: 0px solid;
			margin-right: 5px;
			border-radius: 5px;
			padding: 8px 25px 8px 25px;
			font-weight: 600;
			color: whitesmoke;
			cursor: pointer;
		}
		.bt.sign:hover {

		}
		.bt.back {
		}
		.date.--iwp {
			width: 100px;
			margin-right: 5px;
		}
		.date.--iwp:nth-child(1) {
			width: 33%;
		}
		.date.--iwp:nth-child(2) {
			width: 33%;
		}
		.date.--iwp:nth-child(3) {
			width: 33%;
			margin-right: 0px;
		}
		.--iwp > select {
			text-indent: 10px;			
		}
		.date.--iwp > select {
			background: none;
    		border: 0px;
			width: 100%;			
		}
		.--iwp > select#gender {
			background: none;
    		border: 0px;
			width: 100%;
		}
		.date.--iwp > input {
			width: 100%;
		}
		.multiple-input {
			display: flex;
		}
	</style>

	<body>

		<div class="container-section register">
			<div class="container register">
				<div class="title">회원가입</div>
				<div class="inner">
					<div class="left-side">
						<div  class="emoji"><div id="profile">😊</div></div>
						<div class="emoji-list" style="display:none">
							<div class="es">😀</div>
							<div class="es">😎</div>
							<div class="es">😍</div>
							<div class="es">🤠</div>
							<div class="es">🤢</div>
							<div class="es">😈</div>
							<div class="es">🤯</div>
							<div class="es">😨</div>
							<div class="es">🤓</div>
						</div>
					<script>
						$(document).on("click", ".emoji", function (e) {
							$(".emoji-list").toggle();
						})
						$(document).on("click", ".emoji-list .es", function (e) {
							document.querySelector(".emoji > div").innerHTML = e.target.innerHTML;
						})
					</script>
					</div>
					<div class="right-side">

						<div class="a">
							<div class="a--a">
								<div class="--ls">아이디 </div>
								<div class="single-input --iwp"><input type="text" id="ida" maxlength="12" autocomplete="off" /></div>
							</div>
							<div class="a--b --uiw">
								<div id="msg" class=""></div>
							</div>
						</div>

						<div class="a">
							<div class="a--a">
								<div class="--ls">비밀번호 </div>
								<div class="single-input --iwp"><input type="password" id="passa" onblur="chkFunc()"
										maxlength="12" autocomplete="off" /></div>
							</div>
							<div class="a--b --uiw">
								<div id="____" class=""></div>
							</div>
						</div>

						<div class="a">
							<div class="a--a">
								<div class="--ls">비밀번호 확인 </div>
								<div class="single-input --iwp"><input type="password" id="passb" onblur="chkFunc()"
										maxlength="12" autocomplete="off" /></div>
							</div>
							<div class="a--b --uiw">
								<div id="msgchkcpass" class=""> </div>
							</div>
						</div>

<!-- 

						<div>
							<div class="">프로필</div>
							<div><input type="text" id="profile" readonly /></div>
							<div class=""><input type="button" value="목록" onclick="emotionlist()" /></div>
							<div id="toc-content" class="toc-content">
								<div class="profileemoticon">😊</div>
								<div class="profileemoticon">😢</div>
								<div class="profileemoticon">😍</div>

							</div>
							<div class=""> </div>
						</div> -->

						<div class="a">
							<div class="a--a">
								<div class="--ls">닉네임 </div>

								<div class="--iwp"> <input type="text" id="nicka" /> </div>
							</div>
							<div class="a--b --uiw">
								<div id="msg2" class=""></div>
							</div>
						</div>

						<div class="a">
							<div class="a--a">
								<div class="--ls">생년월일 </div>
								<div class="multiple-input">
									<div class="date --iwp">
										<input id="year" type="text" placeholder="년(4자)" onkeyup="checkFinish('year')" maxlength=4 />
									</div>
									<div class="date --iwp">
										<select id="month" onchange="dayList()">
											<option value="">월</option>
											<option value="1">1월</option>
											<option value="2">2월</option>
											<option value="3">3월</option>
											<option value="4">4월</option>
											<option value="5">5월</option>
											<option value="6">6월</option>
											<option value="7">7월</option>
											<option value="8">8월</option>
											<option value="9">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</div>
									<div class="a--b date --iwp" id="dateform">
										<select id="date">
											<option>일</option>
											<option value="1">1일</option>
										</select>
									</div>
								</div>
							</div>
							<div class="a--b --uiw">
								<div id="msgDate" class=""></div>
							</div>	
						</div>

						<div class="a">
							<div class="a--a">
								<div class="--ls">성별 : </div>
								<div class="--iwp">
									<select id="gender">
										<option value="">성별을 입력하세요</option>
										<option value="M">남자</option>
										<option value="F">여자</option>
									</select>
								</div>
							</div>
						</div>
						<!-- <div class="">
							<div> 취향</div>
							<div class=""><input id="hob1" type="text" placeholder="취향 1순위" /></div>
							<div class=""><input id="hob2" type="text" placeholder="취향 2순위" /></div>
							<div class=""><input id="hob3" type="text" placeholder="취향 3순위" /></div>
						</div> -->
						<div class="button-wrapper">
							<div class="btw"><input class="bt sign" type="button" value="가입하기" id="btnGaip" /></div>
							<div class="btw"><input class="bt back" type="button" value="뒤로가기" id="btnBack" /></div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<script>
			$("#year").change(function () {


				var year = Number($("#year").val());


				if (isNaN(year)) {
					$("#year").val("");
				}
				let today = new Date();
				if (!(year > 1900 && year < 2022)) {
					$("#year").val("");
					$("select#month").val("");


					return;
				}

			})

			var dayList = function () {
				var year = Number($("#year").val());
				if ($("#year").val() == "") {
					alert("년도를 입력하세요.");
					$("select#month").val("");
					return;
				}

				console.log($("#month option:selected").text());

				var month = $("#month option:selected").text();
				if (month.length == 2) {
					month = month.substr(0, 1);
				} else if (month.length == 3) {
					month = month.substr(0, 2);
				}
				console.log(month);

				if (Number(month) == 12) {
					month = 0;
					year = year + 1;
				}
				var date = new Date(year + '-' + (Number(month) + 1));
				date.setDate(date.getDate() - 1);

				let lastDate = date.getDate(); // 31
				let dateArray = Array.from({ length: lastDate }, (v, i) => i + 1); // [ 1, 2, 3, ... 31 ]
				var strHTML = "<select id=date>";
				for (var i = 1; i <= lastDate; i++) {
					strHTML += "<option value=" + i + ">" + i + "일";
					strHTML += "</option>";
				}

				strHTML += "</select>";
				$("#dateform").html(strHTML);

			}
			var chkFunc = function () { // 비밀번호 일치 불일치 여부 판단
				if (document.getElementById("passa").value != "" &
					document.getElementById("passb").value != "") {
					if (document.getElementById("passa").value == document.getElementById("passb").value) {
						document.querySelector("div#msgchkcpass").innerHTML = "비밀번호가 일치합니다.";
					} else {
						document.querySelector("div#msgchkcpass").innerHTML = "비밀번호가 일치하지않습니다.";
					}


				}
			}
			const id = document.querySelector("input#ida");
			id.addEventListener('blur', function (event) { // id 맨첫글자 영어만가능 + ajax를 통해 중복아이디 체크
				var first = /[a-zA-Z]/;
				String.prototype.replaceAt = function (index, character) {
					return this.substr(0, index) + character + this.substr(index + character.length);
				}

				var inputVal = $(this).val();

				for (var i = 0; i < inputVal.length; i++) {
					if (first.exec(inputVal[i]) == null) {
						inputVal = inputVal.replaceAt(i, " ");
					} else {
						break;
					}
				}
				var str = /[^A-Za-z0-9]/;
				if (!(str.exec(inputVal) == null)) {
					console.log("유효하지않은 입력입니다.");
				}
				$(this).val(inputVal.replace(/[^A-Za-z0-9]/gi, ''));

				$.ajax({
					url: "chk",
					data: JSON.stringify({ data: { memberid: this.value } }),
					type: "post",
					dataType: "json",
					contentType: "application/json",
					success: function (result) {
						if (result.result == "SUC") {
							if (document.querySelector("input#ida").value == "") {
								document.querySelector("div#msg").innerHTML = "아이디를 입력하세요.";

							}
							else {
								document.querySelector("div#msg").innerHTML = "사용가능한 아이디입니다.";
							}
						}
						else {
							document.querySelector("div#msg").innerHTML = "중복된 아이디입니다.";
							document.querySelector("input#ida").value = "";

						}
					},
					error: function (error) {
						console.log(error);

					}

				})
			})



			const nickname = document.querySelector("input#nicka")
			nickname.addEventListener("blur", function (event) { // 닉네임 중복체크를 위한 ajax 

				$.ajax({
					url: "chk",
					data: JSON.stringify({ data: { membernickname: this.value } }),
					type: "post",
					dataType: "json",
					contentType: "application/json",
					success: function (result) {
						if (result.result == "SUC") {
							if (document.querySelector("input#nicka").value == "") {
								document.querySelector("div#msg2").innerHTML = "닉네임을 입력하세요.";
							}
							else {
								document.querySelector("div#msg2").innerHTML = "사용가능한 닉네임입니다.";

							}
						}
						else {
							document.querySelector("div#msg2").innerHTML = "중복된 닉네임입니다.";
							document.querySelector("input#nicka").value = "";
						}

					},
					error: function (error) {
						console.log(error);

					}

				})
			})
			const gaipButtion = document.querySelector("input#btnGaip");
			gaipButtion.addEventListener("click", function () { // 가입버튼 시작
				$(this).attr("disabled", "true");
				var year = Number($("input#year").val());
				var month = Number($("select#month").val()) + 1;
				var day = Number($("input#date").val());
				console.log(year);
				console.log(month);
				var date = new Date(year + '-' + (month + 1));
				date.setDate(date.getDate() - 1);
				if (Number($("input#date").val()) > date.getDate()) {
					alert("잘못된 날짜 형식입니다. ex) 1월달은 1~31일까지");
					return;
				}



				// $("select#month").val()

				var alldata = {	 // 가입 데이터 

					memberid: $("#ida").val(),
					memberpass: $("#passa").val(),
					memberprofile: $("#profile").text(),
					membernickname: $("#nicka").val(),
					memberbirth: $("input#year").val() + "/" + $("select#month").val() + "/" + $("select#date").val(),
					membergender: $("select#gender").val(),
					msigndate: "now",
					memberhob1: "로맨스",
					memberhob2: "코미디",
					memberhob3: "액션"


				}
				// 가입조건 불응시 되돌림 
				if (alldata.memberid == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("아이디를 입력하세요.");
					return;
				}

				if (alldata.memberpass == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("비밀번호를 입력하세요.");
					return;
				}
				if (alldata.memberprofile == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("프로필을 입력하세요.");
					return;
				}
				if ($("input#passb").val() == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("비밀번호를 입력하세요.");
					return;
				}
				if ($("input#passb").val() != $("input#passb").val()) {

					$("input#btnGaip").removeAttr("disabled");
					alert("비밀번호가 틀렸습니다.");
					return;
				}

				if (alldata.membernickname == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("닉네임을 입력하세요.");
					return;
				}
				if ($("input#year").val() == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("년도를  입력하세요");
					return;
				}
				if ($("select#month").val() == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("월을 입력하세요.");
					return;
				}
				if ($("input#date").val() == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("일을 입력하세요.");
					return;
				}

				if (alldata.membergender == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("성별을 입력하세요.");
					return;
				}

				if (alldata.memberhob1 == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("취미를 입력하세요.");
					return;
				}

				if (alldata.memberhob2 == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("취미를 입력하세요.");
					return;
				}

				if (alldata.memberhob3 == "") {

					$("input#btnGaip").removeAttr("disabled");
					alert("취미를 입력하세요.");
					return;
				}




				$.ajax({
					url: "register",
					data: JSON.stringify({ data: alldata }),
					type: "post",
					dataType: "json",
					contentType: "application/json",
					success: function (result) {
						console.log(result.result);
						if (result.result == "SUC") {
							//				alert("가입완료되었습니다.");
							$("input#btnGaip").removeAttr("disabled");
							//				history.back();
						}
						else {
							alert("실패하셨습니다.");
							$("input#btnGaip").removeAttr("disabled");
						}

					},
					error: function (error) {
						console.log(error);
					}

				})

			}) // 가입버튼 끝

			var checkFinish = function (a) { // 숫자만입력 (날짜)
				let wantChar = "0123456789";
				let eachChr = "";
				let resultStr = "";
				let nowStr = document.getElementById(a).value;
				for (var i = 0; i < nowStr.length; i++) {
					eachChr = nowStr.substr(i, 1);
					if (wantChar.indexOf(eachChr) != -1) {
						resultStr += eachChr;
					}
				}
				document.getElementById(a).value = resultStr;
			}

			$("input#btnBack").click(function () { // 뒤로가기
				history.back();


			})

			var emotionlist = function () { // 이모티콘 리스트 보여주고 끄기
				if (document.getElementById('toc-content').style.display === 'block') {
					document.getElementById('toc-content').style.display = 'none';
				}
				else {
					document.getElementById('toc-content').style.display = 'block';
				}

			}
			$(".profileemoticon").click(function () { // 이모티콘 클릭시 프로필란에 표시

				$("input#profile").val($(this).text());


			})


			// 자동회원가입 test용
			let autofill = true;
			$(document).ready(function () {
				autofill = true;
				if (autofill == false) return;
				setInterval(function () {

					document.querySelector("#ida").value = "test" + new Date().getTime();
					document.querySelector("#nicka").value = "test" + new Date().getTime();
					document.querySelector("#passa").value = "1234";
					document.querySelector("#passb").value = "1234";
					document.querySelector("#profile").value = "1234";
					document.querySelector("#year").value = "1997";
					document.querySelector("#month").value = "1";

					document.querySelector("#date").value = "1";
					document.querySelector("#gender").value = "M";
					


					document.querySelector("#btnGaip").click();

				}, 3000);

			});
		</script>
	</body>

	</html>