<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sheet Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    {{-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js">
    </script> --}}
    <style>
        #menu ul{
        list-style: none;
        }
        #menu li{
        display: inline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <form class="form-inline" id="sheetform" method="POST" enctype="multipart/form-data" action="javascript:void(0)">
                    <div class="form-group mb-2">
                      <label for="staticEmail2" class="sr-only">Sheets</label>
                      <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="No. of sheet (Max upto 7)">
                    </div>
                    <div class="form-group mx-sm-3 mb-2">
                      {{-- <label for="inputSeat" class="sr-only">input of sheet</label> --}}
                      <input type="text" style="width: 13%; height: 5%" name="no_of_sheet" id="inputSeat" required>
                      {{-- <input type="number" class="form-control" id="inputSeat" placeholder="Seat qty" required onkeypress="return isNumberKey(this.value)"> --}}
                    </div>
                    <button type="submit" class="btn btn-primary mb-2" id="himanshu">Book</button>
                    <a href="{{'/'}}"><button type="button" class="btn btn-info mb-2">Return To List</button></a>
                </form>
            </div>
            <div class="col-md-4">
                {{-- <?php dd($rowdata); ?> --}}
                @if (!empty($rowdata))
                <?php $rowtype = ['A','B','C','D','E','F','G','H','I','J','K','L'];$count1=0; ?>
                    @foreach ($rowdata as $row)

                    <div style='justify-content:center'>
                        {{$rowtype[$count1]}} -
                        <?php $count=1   ?>
                        @foreach ($row->seats as $item)
                                      <button style="background:{{$item->booking_status==1?'green':'#ffffff' }};   ">{{$count}}</button>
                        <?php $count++?>
                        @endforeach
                    </div>
                        <br>
                        <?php $count1++ ?>
                    @endforeach
                @endif
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <Script>
        $('#inputSeat').on('paste input', function () {
            var number = $(this).val()
            if (isNaN(number)) {
                alert("Enter only numbers.");
                $(this).val('');
            }

            if (number > 7) {
                alert("Value entered should not be greater than 7");
                $(this).val('');
            }
            if (number == 0) {
                alert("Value entered should be greater than 0");
                $(this).val('');
            }
        });
        $('#sheetform').on('submit', function(e) {
            e.preventDefault();
            var no_of_sheet = $('#inputSeat').val();
            $.ajax({
                type: "POST",
                url: "{{url('book-sheet')}}",
                data: {no_of_sheet:no_of_sheet, _token: "{{ csrf_token() }}"},
                success: function( response ) {
                    alert( response.msg);
                }
            });
        });
    </Script>

</body>
</html>
{{-- <script>
    function isNumberKey(value){
        alert("Value entered should not be greater than 7");
        console.log(value);
    }
</script> --}}
