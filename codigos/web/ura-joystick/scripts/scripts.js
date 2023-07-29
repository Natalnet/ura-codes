function move(where) {
    var xhttp = new XMLHttpRequest();
  
    xhttp.open("GET", where, true);
    xhttp.send();
  }
  
  $(function () {

    $("#action").submit(function (event) {
        
      event.preventDefault();
  
      var inputData = $("input[name='input-text']").val(); 

      $.ajax({
        type: "POST",
        url: "/action", 
        data: { input: inputData },
        success: function () {
          alert("Dados enviados com sucesso!");
        },
        error: function () {
          alert("Erro ao enviar dados");
        },
      });
    });
  });