<?php

function distributeCards($numPeople) {
    // Check if the input is valid
    if (!is_numeric($numPeople) || $numPeople < 1) {
        echo "Input value does not exist or value is invalid";
        return;
    }

    // it is impossible to distribute 52 cards to more than 52 people evenly, so anything bigger than 52 then default to 52 people.
    if ($numPeople > 52) {
        $numPeople = 52;
    }

    // Define card suits and special card representations
    $suits = ['S', 'H', 'D', 'C'];
    $specialCards = ['A', 'X', 'J', 'Q', 'K'];

    // Initialize the deck of cards
    $cards = [];
    foreach ($suits as $suit) {
        for ($i = 1; $i <= 13; $i++) {
            // get the first card in the specialCards array, which is 'A'
            if($i == 1){
                $card = $specialCards[$i-1];
            } else {
                // if $i goes up to 10 and above, that means it is a special card already, so do $i - 9 to get the index of it inside specialCards array
                $card = ($i >= 2 && $i <= 9) ? $i : $specialCards[$i - 9];
            }
            $cards[] = $suit . '-' . $card;
        }
    }

    // Shuffle the deck of cards
    shuffle($cards);

    // Distribute cards among people
    // ceil(count($cards) / $numPeople) is how big you want each array to be
    $peopleCards = array_chunk($cards, ceil(count($cards) / $numPeople));

    // display the distributed cards
    $output = '<h3>Card Distribution over ' . $numPeople . ' people</h3>';
    foreach ($peopleCards as $person => $cards) {
        $output .= '<p><strong>Person ' . ($person + 1) . ':</strong> ' . implode(', ', $cards) . '</p>';
    }

    echo $output;
}

// Check if numPeople is set in POST request
if (isset($_POST['numPeople'])) {
    distributeCards($_POST['numPeople']);
}

?>