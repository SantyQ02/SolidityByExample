// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Fallback {
    event Log(string func, uint gas);

    // Fallback function must be declared as external.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log("fallback", gasleft());
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Log("receive", gasleft());
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}


/*
fallback es una funcion especial que es ejecutada cuando una se llama una funcion que no existe o cuando 
se envía Ether directamente a un contrato que no tiene una funcion receive() o msg.data no esta vacío.

fallback tiene un gas limit de 300 cuando es llamada por transfer o send.
 */