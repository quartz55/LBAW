<?php

function dateDiff($date1, $date2) {
    if ($date1 == null)
        $ddate1 = new DateTime();
    else $ddate1 = new DateTime($date1);

    if ($date2 == null)
        $ddate2 = new DateTime();
    else $ddate2 = new DateTime($date2);
    return $ddate1->diff($ddate2)->format('%a');
}

?>