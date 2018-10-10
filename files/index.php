<html>
<body>
<?php

echo '<font size="5" face="verdana">Welcome to <font color="green">' . gethostname() . '</font><br><br>';

echo 'display_errors =  <font color="red">' . ini_get('display_errors') . '</font><br>';
echo 'memory_limit = ' . ini_get('memory_limit') . '<br><br>';

echo 'Config file:<br>';

if ($file = fopen("/etc/app/config", "r")) {
    while(!feof($file)) {
        $line = fgets($file);
        echo $line . '<br>';
    }
    fclose($file);
}
?>
</body>
</html>
