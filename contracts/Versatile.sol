// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "./data-model/VersatileModel.sol";

contract Versatile {
    struct VersatileStruct {
        uint256 _value1;
        string _value2;
        bytes32 _value3;
    }

    bytes private _value;
    VersatileModel private _modelResult;

    function hashSha256(uint256 numberToHash) public view returns (bytes32 h) {
        address _addr = 0x0000000000000000000000000000000000000002;
		(bool ok, bytes memory out) = _addr.staticcall(abi.encode(numberToHash));
		require(ok);
		h = abi.decode(out, (bytes32));
    }

    function ret(bytes memory input) public view returns (bool ok, bytes memory out) {
        address _addr = 0x0000000000000000000000000000000000000100;
        return _addr.staticcall(input);
    }

    function check() public view returns (uint256, string memory, bytes32){
        (bool ok, bytes memory out) = ret("");
        require(ok);
        VersatileStruct memory _struct = abi.decode(out, (VersatileStruct));
        return (_struct._value1, _struct._value2, _struct._value3);
    }

    function serialize() public {
        VersatileModel _model = new VersatileModel(1, "hello", bytes32("bytes32"));
        (bool ok, bytes memory out) =  ret(abi.encode(_model));
        require(ok);
        _value = out;
    }

    function serializeParams() public {
        (bool ok, bytes memory out) =  ret(abi.encode(1, "hello", bytes32("bytes32")));
        require(ok);
        _value = out;
    }

    function value() public view returns (bytes memory) {
        return _value;
    }

    function deserialize() public view returns (uint256, string memory, bytes32) {
        VersatileModel _model = abi.decode(_value, (VersatileModel));
        return (_model._value1(), _model._value2(), _model._value3());
    }

    function deserializeParams() public {
        (uint256 _value1, string memory _value2, bytes32 _value3) = abi.decode(_value, (uint256, string, bytes32));
        _modelResult = new VersatileModel(_value1, _value2, _value3);
    }

    function modelResult() public view returns (uint256, string memory, bytes32) {
        return (_modelResult._value1(), _modelResult._value2(), _modelResult._value3());
    }

    function isContract(address _addr) public view returns (bool){
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }
}