// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import { Types } from "./utils/LibplanetTypes.sol";

contract LibplanetPortal {
    struct proofArgs {
        bytes stateRootHash;
        bytes proof;
        bytes key;
        bytes value;
    }

    function proveWithdrawalTransaction(
        Types.WithdrawalTransaction memory _tx,
        Types.OutputRootProof memory _proof,
        bytes memory _withdrawalProof
    ) external view returns (proofArgs memory) {
        address withdrawalHash = _callLibplanetWithdrawalTransactionHashing(_tx);
        return proofArgs({
            stateRootHash: abi.encodePacked(_proof.storageRoot),
            proof: _withdrawalProof,
            key: abi.encodePacked(withdrawalHash),
            value: hex"74" // bencoded(true) = 0x74
        });

        require(_callLibplanetVerifyProof(
            abi.encodePacked(_proof.storageRoot),
            _withdrawalProof,
            abi.encodePacked(withdrawalHash),
            hex"74" // bencoded(true) = 0x74
            ),
            "Invalid withdrawal proof"
        );
    }

    function _callLibplanetWithdrawalTransactionHashing(
        Types.WithdrawalTransaction memory _tx
    ) private view returns (address) {
        address _addr = 0x0000000000000000000000000000000000000201;
        (bool ok, bytes memory out) = _addr.staticcall(abi.encode(
            _tx.nonce,
            _tx.from,
            _tx.to,
            _tx.amount
        ));
        require(ok, "withdrawal transaction hashing failed");
        return abi.decode(out, (address));
    }

    function _callLibplanetVerifyProof(
        bytes memory stateRootHash,
        bytes memory proof,
        bytes memory key,
        bytes memory value
    ) private view returns (bool) {
        address _addr = 0x0000000000000000000000000000000000000200;
        (bool ok, bytes memory out) = _addr.staticcall(abi.encode(stateRootHash, proof, key, value));
        require(ok, "proof verification error");
        return abi.decode(out, (bool));
    }
}
