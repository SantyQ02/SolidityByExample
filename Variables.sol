// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public {
        // Local variables are not saved to the blockchain.
        uint i = 456;

        // Here are some global variables
        uint timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
    }
}


/*
Existen 3 tipos de variables en Solidity:
    - Local:
    Son variables declaradas dentro de una función y no son guardadas en la blockchain.
    - State:
    Son variables declaradas fuera de una función y guardades en la blockchain.
    Para escribir o actualizar una variable de tipo state, se debe enviar una transaccion.
    Leer variables de tipo state no tiene ningun costo de transaccion.
    - Global:
    Son variables que proveen información acerca de la blockchain.
*/