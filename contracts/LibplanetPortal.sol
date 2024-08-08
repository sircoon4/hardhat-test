// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import { Types } from "./utils/LibplanetTypes.sol";

contract LibplanetPortal {

    function proveWithdrawalTransaction(
        Types.WithdrawalTransaction memory _tx
    ) external view returns (address) {
        address withdrawalHash = _callLibplanetWithdrawalTransactionHashing(_tx);
        return withdrawalHash;
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
}
