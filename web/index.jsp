<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">
            <h2>Pessoas Registradas</h2>
            <br> <br>


            <div class="row">
                <div class="col-sm-5" id="respostasSelectCombo">
                    <select multiple class="form-control" id="listarNomes" name="listarNomes">
                      
                    </select>
                    
                </div>
                <div class="col-sm-7">
                    <h2>Rogerio Aguiar</h2> <br><br>
                    <label>Email: </label> <br>
                    <label>Sexo: </label><br>
                    <label>Estado civil: </label><br>
                    <label>Observaçoes: </label><br>
                </div>
            </div>
            <!-- Button to Open the Modal -->
            <button type="button" class="btn btn-primary col-sm-1" data-toggle="modal" data-target="#Inserir">
                Novo 
            </button>



            <!-- The Modal -->
            <div class="modal" id="Inserir">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Registrar nova pessoa</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="container">
                            <form action="/action_page.php">
                                <div class="row">
                                    <div class="form-group col-sm-7">
                                        <label for="usr">Nome:</label>
                                        <input type="text" class="form-control" id="nome" name="nome">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="sel1">Estado Civil:</label>
                                        <select class="form-control" id="estadoCivil" name="estadoCivil">
                                            <option>Solteiro</option>
                                            <option>Casado</option>
                                        </select>
                                    </div>

                                    <div class="form-group col-sm-7">
                                        <label for="usr">Email:</label>
                                        <input type="text" class="form-control" id="email" name="email">
                                        <label for="usr">Senha:</label>
                                        <input type="password" class="form-control" id="senha" name="senha">
                                    </div>

                                    <div class="form-group col-sm-5">
                                        <label for="comment">Observaçoes:</label>
                                        <textarea class="form-control" rows="5" id="obs" name="obs"></textarea>
                                    </div>

                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            &nbsp;&nbsp;&nbsp; Sexo: &nbsp; &nbsp; &nbsp;
                                            <input type="radio" class="form-check-input" name="gender" id="masc" value="masc">Masculino
                                        </label>
                                    </div>

                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="gender" id="fem" value="fem">Feminino &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </label>
                                    </div>

                                </div>
                                 <!-- Modal footer -->
                                    <div  align="right">
                                        <button type="button" class="btn btn-primary" id="btEnviar">Enviar</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Sair</button>
                                    </div>
                        </div>
                    </div>

                </div>

                <script>

                    $(document).ready(function () {
                        $.listaTodasPessoas = function () {
                            $.ajax({
                                method: "POST",
                                url: 'listarTodos.jsp'
                                    
                                , beforeSend: function () {

                                }, success: function (result) {
                                    $("#respostasSelectCombo").html(result);
                                }, error: function (obj, text, error) {

                                }, fail: function (result) {

                                }, complete: function (result) {

                                }});
                        };
                        $.buscarDadosAluno = function () {
                            $.ajax({method: "POST", url: 'buscardadosaluno.jsp',
                                data: {
                                    edtmatricula: $("#cbAluno").val()
                                },
                                beforeSend: function () {
                                    $("#divespera").show();
                                }, success: function (result) {
                                    $("#divespera").hide();
                                    $("#imprimirrespostaselect").html(result);
                                }, error: function (obj, text, error) {

                                }, fail: function (result) {

                                }, complete: function (result) {
                                    $("#filtro").html("");
                                }});
                        };

                        $("#btEnviar").click(function () {

                            $.ajax({
                                method: "POST",
                                url: 'cadastraPessoa.jsp',
                                data: {
                                    nomePessoa: $("#nome").val(),
                                    emailPessoa: $("#email").val(),
                                    estadoCivilPessoa: $("#estadoCivil").val(),
                                    sexoPessoa: $("input[name='gender']:checked").val(),
                                    obsPessoa: $("#obs").val(),
                                    senhaPessoa: $("#senha").val()
                                },
                                beforeSend: function () {

                                }, success: function (result) {
                                    $("#divespera").hide();
                                    alert(result);
                                    $("#btEnviar").show();
                                    $("#nome").val("");
                                    $("#estadoCivil").val("");
                                    $("#gender").val("");
                                    $("#obs").val("");
                                    $("#senha").val("");
                                    //$.listaTodasPessoas();


                                }, error: function (obj, text, error) {

                                }, fail: function (result) {

                                }, complete: function (result) {

                                }});
                        });
                        $.listaTodasPessoas();
                    });
                </script>

                </body>
                </html>
