<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card Distribution</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#submitBtn").click(function(){
                var numPeople = $("#numPeople").val();
                $.ajax({
                url: "distribute_cards.php",
                type: "POST",
                data: {numPeople: numPeople},
                success: function(response){
                    if(response == "Input value does not exist or value is invalid"){
                        alert(response);
                        return;
                    }
                    $("#result").html(response);
                },
                error: function(xhr, status, error){
                    console.error(error);
                    alert("An error occurred while processing your request.");
                }
                });
            });
        });
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Card Distribution</h2>
        <div class="row">
            <div class="col-md-6">
                <form>
                    <div class="form-group">
                        <label for="numPeople">Enter the number of people:</label>
                        <input type="text" id="numPeople" name="numPeople" class="form-control" required>
                    </div>
                    <button type="button" class="btn btn-primary" id="submitBtn">Distribute Cards</button>
                </form>
            </div>
        </div>
        <div id="result" class="mt-4"></div>
    </div>
</body>
</html>