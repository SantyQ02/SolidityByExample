// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() returns "B"
    // since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}

/*
Los contratos pueden heredar otros contratos utilizando la keyword "is"
Una función que va a ser anulada por un contrato hijo tiene que ser declarada "virtual".
Una función que va a ser anulada por un contrato padre tiene que usar la keyword "override".
La función que va a anular una función principal debe utilizar la palabra clave override.

Las variables estado no pueden ser anuladas redeclarandolas en el contrato hijo. Esto debe hacerse de la siguiente manera:
contract C is A {
    // This is the correct way to override inherited state variables.
    constructor() {
        name = "Contract C";
    }

    // C.getName returns "Contract C"
}

Los contratos padres pueden ser llamados directamente o utilizando la keyword "super". Usando esta keyword todos los contratos inmediatamentes padres vana ser llamados.

*/