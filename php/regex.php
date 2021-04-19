<?php

function deteksiUsername($input)
{
    $regex = "/@([a-zA-Z0-9_]+)/";

    return preg_replace($regex, '', $input);
}

$teks2 = "Pak @jokowi";

echo deteksiUsername($teks2);

?>
