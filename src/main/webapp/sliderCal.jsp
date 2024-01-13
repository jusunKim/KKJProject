<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가격 범위 선택기</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
$( function() {
  $( "#price-range-slider" ).slider({
    range: true,
    min: 10000,
    max: 500000,
    step: 100,
    values: [ 10000, 500000 ],
    slide: function( event, ui ) {
      $("#price-range-min").val("₩" + ui.values[0].toLocaleString());
      $("#price-range-max").val("₩" + (ui.values[1] < 500000 ? ui.values[1].toLocaleString() : "500000+"));
    }
  });
  $("#price-range-min").val("₩" + $("#price-range-slider").slider("values", 0).toLocaleString());
  $("#price-range-max").val("₩" + ($("#price-range-slider").slider("values", 1) < 500000 ? $("#price-range-slider").slider("values", 1).toLocaleString() : "500000+"));
});

function applyFilter() {
  let minPrice = $("#price-range-slider").slider("values", 0);
  let maxPrice = $("#price-range-slider").
slider("values", 1);

console.log("선택된 가격 범위: " + minPrice + "원 - " + maxPrice + "원");
// 여기에 AJAX 호출이나 페이지 업데이트 로직을 추가합니다.
}
</script>
<style>
  .slider-container {
    margin: 2em;
  }
  .ui-slider-horizontal {
    height: .5em;
  }
  .ui-slider .ui-slider-handle {
    position: absolute;
    z-index: 2;
    width: 1.6em;
    height: 1.6em;
    cursor: pointer;
    outline: none;
    background: #FFF;
    border-radius: 50%;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
  }
  .ui-slider .ui-slider-range {
    position: absolute;
    z-index: 1;
    height: 100%;
    background: #01d1ca;
  }
  .price-range-labels {
    display: flex;
    justify-content: space-between;
    margin: 1em 0;
  }
  .price-range-labels input {
    border: 1px solid #ccc;
    padding: 0.5em;
    width: 6em;
    text-align: center;
  }
  .apply-button {
    display: block;
    width: 100%;
    padding: 0.5em;
    margin-top: 1em;
    text-align: center;
    background-color: #01d1ca;
    color: white;
    border: none;
    cursor: pointer;
  }
</style>
</head>
<body>

<div class="slider-container">
  <div id="price-range-slider"></div>
  <div class="price-range-labels">
    <input id="price-range-min" type="text" readonly>
    <input id="price-range-max" type="text" readonly>
  </div>
  <button class="apply-button" onclick="applyFilter()">적용 하기</button>
</div>



</body>
</html>