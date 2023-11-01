document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('savePattern').addEventListener('click', function(event) {
    // デフォルト動作をキャンセル
    event.preventDefault();
    
    const canvas = document.getElementById("patternCanvas");
    const dataURL = canvas.toDataURL("image/png"); // canvasの内容をpng画像のDataURLとして取得
    const title = document.getElementById("imageTitle").value;
  
    // サーバに対してHTTPリクエスト
    fetch('/patterns', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({ pattern: { title: title, picture: dataURL } }),
    })
    // responseをJSON形式で解析
    .then(response => response.json())
    .then(data => {
      console.log('Success:', data);
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  });

})