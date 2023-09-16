// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Gas {
    uint public i = 0;

    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    function forever() public {
        // Here we run a loop until all of the gas are spent
        // and the transaction fails
        while (true) {
            i += 1;
        }
    }
}


/*
El gas es la unidad computacional que es utilizada para determinar el costo de una transaccion.
El costo de la transaccion, en ether, va a ser igual al gas utilizadp por el precio de gas en ese momento.
El precio de gas es variable en base al mercado.

Las transacciones con gas mas alto tendrán mayor prioridad y el gas no utilizado sera reembolzado.
Si transaccion se queda sin gas mientras está siendo procesada, esta fallará y el gas utilizado se perderá.

Existen dos limites de la cantidad de gas que se puede gastar:
- Gas limit: es el limite de gas para usar en una transaccion, este esta establecido por el usuario.
- Block gas limit: es el limite de gas permitido en un bloque, este esta establecido por la red.
*/