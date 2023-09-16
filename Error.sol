// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    // You can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }
}

/*
Un error va a revertir todos los cambios hechos durante una transaccion.
Los errores pueden ser provocados llamando a las siguientes funciones:
    - require: para validar inputs y condicionales antes de la ejecucion.
    - revert: similar a require, la diferencia es que revert se utiliza para proporcionar un mensaje personalizado.
    - assert: para verificar condiciones que deben ser siempre verdaderas.
*/
