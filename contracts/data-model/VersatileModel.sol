// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract VersatileModel {
    uint256 public _value1;
    string public _value2;
    bytes32 public _value3;

    constructor(uint256 value1, string memory value2, bytes32 value3) {
        _value1 = value1;
        _value2 = value2;
        _value3 = value3;
    }
}