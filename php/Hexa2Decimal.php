// Use a Apache server

<html>
    <body>
        <form action="" method="post">
            Enter value here:
            <input type=text name="t1">
            <br>
            <br>
            <input type=submit name="s">
            <?php
          
if(isset($_POST['s']))
{
    $a=$_POST['t1']; //accessing value from the text field
}
          
            ?>
        </form>

        <?php
          $hexadecimal = $a;

          $decimal = hexdec($hexadecimal);

          echo $hexadecimal . ' -> in decimal the resulte is : ' . $decimal;
          ?>

    </body>
</html>
