<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
.tooltip {
    position: relative;
    display: inline-block;
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 519px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: absolute;
    z-index: 1;
    top: 80%;
    left: 50%;
    margin-left: 106px;
    opacity: 0.5;
    transition: opacity 0.3s;
}


.tooltip:hover .tooltiptext {
    visibility: visible;
    opacity: 1;
}
</style>
</head>
<body>
    <input type='file' id='myFileInput' style="display: none;"updateButtonLabel(this)">
    <button id='fileuploadButton' class='tooltip' onclick="$('#myFileInput').click()"
        style="width: 200px; height: 30px; margin-top: 20px;">txt 파일 업로드
         <span class="tooltiptext">
            사용년월, 순번, 시군구코드, 법정동코드, 시도명, 시군구명,<br>
            법정도명, 대지구분코드, 본번, 부번, 새주소대로코드, 새주소대로명,<br> 
            새주소지상지하코드, 새주소지상지하명, 새주소본번, 새주소부번, 사용량<br>
            사이사이에 '|'를 붙혀서 순서대로 입력 해주세요. <br>
            <br>
            예시)<br>
            202302|1|11110|10100|서울특별시|종로구|청운동|0|0001|0000|<br>
            111104100289|자하문로36길|0|지상|16|14|60243</span></button>

    <button id='sendFile'
        style="width: 200px; height: 40px; margin-top: 20px; background-color: hsl(197, 100%, 51%); color: white; outline: none; border: none;">파일
        업로드</button>

<script>
$(document).ready(function() {
      $('#myFileInput').on('change', function() {
        updateButtonLabel(this);
      });

      $('#sendFile').on('click', function() {
          var geoFile = $('#myFileInput').prop('files')[0];

          if (geoFile) {
            var formData = new FormData();
            formData.append('file', geoFile);

            $.ajax({
              url: 'uploadfile.do',  // 컨트롤러 URL로 변경해야 합니다.
              type: 'POST',
              data: formData,
              processData: false,
              contentType: false,
              dataType: 'text',
              charset: 'UTF-8',
              success: function(response) {
                // 파일 전송 성공 후의 동작
                alert("파일이 업로드 되었습니다.");
                console.log(response);
              },
              error: function(xhr, status, error) {
                // 파일 전송 실패 후의 동작
                alert(error);
              }
            });
          }else{
              alert("파일을 선택해주세요.");
              return false;
          }
        });


    });    // document.ready end

    function updateButtonLabel(input) {
      var fileName = input.files[0].name;
      $('#fileuploadButton').text(fileName);
    }


</script>
</body>
</html>