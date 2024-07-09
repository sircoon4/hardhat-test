// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract ActionParser {
    struct HackAndSlash {
        uint8[16] id;
        uint8[16][] costumes;
        uint8[16][] equipments;
        uint8[16][] foods;
        int64[][] r;
        int64 worldId;
        int64 stageId;
        int64 stageBuffId; // -1 if null
        address avatarAddress;
        int64 totalPlayCount;
        int64 apStoneCount;
    }

    struct Grinding {
        uint8[16] id;
        address a;
        uint8[16][] e;
        bool c;
    }

    struct CombinationEquipment {
        uint8[16] id;
        address a;
        int64 s;
        int64 r;
        int64 i; // -1 if null
        bool p;
        bool h;
        int64 pid; // -1 if null
    }

    struct RapidCombination {
        uint8[16] id;
        address avatarAddress;
        int64 slotIndex;
    }

    struct HackAndSlashSweep {
        uint8[16] id;
        uint8[16][] costumes;
        uint8[16][] equipments;
        int64[][] runeInfos;
        address avatarAddress;
        int64 apStoneCount;
        int64 actionPoint;
        int64 worldId;
        int64 stageId;
    }

    struct TransferAsset {
        address sender;
        address recipient;
        FungibleAssetValue amount;
        string memo; // "" if null
    }

    struct ClaimItems {
        uint8[16] id;
        ClaimData[] cd;
        string m; // "" if null
    }

    struct ClaimData {
        address avatarAddress;
        FungibleAssetValue[] fungibleAssetValues;
    }

    struct FungibleAssetValue {
        Currency currency;
        uint256 rawValue;
    }

    struct Currency {
        uint8 decimalPlaces;
        address[] minters;
        string ticker;
        bool totalSupplyTrackable; // false if null
        uint256 maximumSupplyMajor; // 0 if null
        uint256 maximumSupplyMinor; // 0 if null
    }

    struct Simple {
        uint8[16] id;
        int64 simpleId;
    }

    function simpleDeserializer(bytes memory input) public view returns (bool ok, bytes memory out) {
        address _addr = 0x0000000000000000000000000000000000000101;
        return _addr.staticcall(input);
    }

    function readSimple() public view returns (Simple[] memory) {
        bytes memory serializedPayload = bytes("");
        (bool ok, bytes memory out) = simpleDeserializer(serializedPayload);
        require(ok);
        Simple[] memory _struct = abi.decode(out, (Simple[]));
        return _struct;
    }

    function actionDeserializer(bytes memory input) public view returns (bool ok, bytes memory out) {
        address _addr = 0x0000000000000000000000000000000000000100;
        return _addr.staticcall(input);
    }

    function readHackAndSlash() public view returns (HackAndSlash memory) {
        bytes memory serializedPayload = bytes("ZDE6UzcwOjBEAiBREB4k6V+8VAXxIe9I1s565xeRyEhTcvft0QtkQavdRAIgF/7gAwEK1hCXBI3vStWHsInR56Pjbpgr77ZGNfYJWJ8xOmFsZHU3OnR5cGVfaWR1MTY6aGFja19hbmRfc2xhc2gyMnU2OnZhbHVlc2R1MTI6YXBTdG9uZUNvdW50dTE6MHUxMzphdmF0YXJBZGRyZXNzMjA63+Olmd3JqvwM5CMsow1BKkN5eE91ODpjb3N0dW1lc2xldTEwOmVxdWlwbWVudHNsMTY6k0hvMSQP3ESqxHe5FvP/ZDE2OnESdTcOEDhHjXX+a8k/kgMxNjputrpDman3Q5V424Y2EJutMTY6vGXnkjiTjk6uEDh/1UnKlTE2OoCmFqSy2FdGlMeyRVDTd0sxNjqAhR6pZsrMRoS+9euOX7TnMTY6yetsy/AeaEm0XJX2GX1KBWV1NTpmb29kc2xldTI6aWQxNjpVMrOqojpcTo+szFsaRu5tdTE6cmxsdTE6MHU1OjMwMDAxZWV1NzpzdGFnZUlkdTM6MjEwdTE0OnRvdGFsUGxheUNvdW50dTE6MXU3OndvcmxkSWR1MTo1ZWVlMTpnMzI6RYIlDQ2jOwZ3moR10oPV3SEMaDubmZ100D+sT1j6a84xOmxpNGUxOm1sZHUxMzpkZWNpbWFsUGxhY2VzMToSdTc6bWludGVyc251Njp0aWNrZXJ1NDpNZWFkZWkxMDAwMDAwMDAwMDAwMDAwMDAwZWUxOm5pMzExNmUxOnA2NToE3wbqFQmA1Y+s/9KKFfFC0scchb6fM0FbN2zIUcbvextqIZ+RGm9zXti+cBRBMhv+/ghXR6k08lAxOUH2iJvMYzE6czIwOmtPF4trn3OiAUK7/onUOjgBB4aDMTp0dTI3OjIwMjQtMDctMDVUMDk6MjM6MjAuNTE3Njc2WjE6dWxlZQ==");
        (bool ok, bytes memory out) = actionDeserializer(serializedPayload);
        require(ok);
        HackAndSlash memory _struct = abi.decode(out, (HackAndSlash));
        return _struct;
    }

    function readGrinding() public view returns (Grinding memory) {
        bytes memory serializedPayload = bytes("ZDE6UzcwOjBEAiBNIJpUkfHyhnA3wCHRFt9iuyHqPbKPbEys9MF/RsG1OQIgTB1dU35a5Cr2odqIkNUE6hEZ/PIdrLt5fiidK3YrQsoxOmFsZHU3OnR5cGVfaWR1OTpncmluZGluZzJ1Njp2YWx1ZXNkdTE6YTIwOlE4aopjoX/XOXBM3WCk5oN/7lWIdTE6Y3R1MTplbDE2OutbnGA0koFAu+zs6J5VuAVldTI6aWQxNjpJtSFKgJLXQpKj9T0cXokPZWVlMTpnMzI6RYIlDQ2jOwZ3moR10oPV3SEMaDubmZ100D+sT1j6a84xOmxpMWUxOm1sZHUxMzpkZWNpbWFsUGxhY2VzMToSdTc6bWludGVyc251Njp0aWNrZXJ1NDpNZWFkZWkxMDAwMDAwMDAwMDAwMDAwMDAwZWUxOm5pMjc1ZTE6cDY1OgTcDJ8HG/Fe9jSl94B4LbBfLyUe2gJZmIVaLbjVMXNKh14btogWXuVmcKGhwxuQeDQHjkVD1NXeLyA+X4Jj5Y0vMTpzMjA6ga9iZHvpgtBiwvnBCbOlOdjJy8ExOnR1Mjc6MjAyNC0wNy0wNVQwOToyMzowNi4xNzYyODhaMTp1bGVl");
        (bool ok, bytes memory out) = actionDeserializer(serializedPayload);
        require(ok);
        Grinding memory _struct = abi.decode(out, (Grinding));
        return _struct;
    }

    function readCombinationEquipment() public view returns (CombinationEquipment memory) {
        bytes memory serializedPayload = bytes("ZDE6UzcwOjBEAiAAqENcATSUfl/izYJWShs0nTLf5XDqg+n11hTIlSZ7kAIgWzmye7xj2lTPL1bdO+FztKTgSPHYRXBHTFni5OGjDSMxOmFsZHU3OnR5cGVfaWR1MjM6Y29tYmluYXRpb25fZXF1aXBtZW50MTd1Njp2YWx1ZXNkdTE6YTIwOvsmvr466BLcc1rbsNdF7jN1jxN2dTE6aGZ1MTppdTM6MzczdTI6aWQxNjqwfyDSYCl6QqXK30uDXCoBdTE6cHR1MzpwaWRudTE6cnUxOjF1MTpzdTE6MWVlZTE6ZzMyOkWCJQ0NozsGd5qEddKD1d0hDGg7m5mddNA/rE9Y+mvOMTpsaTFlMTptbGR1MTM6ZGVjaW1hbFBsYWNlczE6EnU3Om1pbnRlcnNudTY6dGlja2VydTQ6TWVhZGVpMTAwMDAwMDAwMDAwMDAwMDAwMGVlMTpuaTQ0ZTE6cDY1OgTtl6zT5sIF42uyL9icLWTkFBfLykCjUDRNSPgVzoJ3P0UPXpBZci4nWTcs/pSwsxcfhgUULLgxb5jhWzvRNMUGMTpzMjA695+PB+EmhdKUge+5CMjRa/kIWmIxOnR1Mjc6MjAyNC0wNy0wNVQwOToyMzoxMy41ODcyMTVaMTp1bGVl");
        (bool ok, bytes memory out) = actionDeserializer(serializedPayload);
        require(ok);
        CombinationEquipment memory _struct = abi.decode(out, (CombinationEquipment));
        return _struct;
    }

    function readRapidCombination() public view returns (RapidCombination memory) {
        bytes memory serializedPayload = bytes("ZDE6UzcwOjBEAiBZR4AWgBA3nzr85z78em/zxXYVNUf1FequYqCpyA2JEgIgbsaxuK0+ltCOiXT42GnRxZZYViOrJxM6y5WsNVMh1I8xOmFsZHU3OnR5cGVfaWR1MTk6cmFwaWRfY29tYmluYXRpb24xMHU2OnZhbHVlc2R1MTM6YXZhdGFyQWRkcmVzczIwOvH7GPXpy7CHQO4PFtgXbP3CgQNxdTI6aWQxNjoq3OyMSPUsS5aa18gH++MtdTk6c2xvdEluZGV4dTE6MGVlZTE6ZzMyOkWCJQ0NozsGd5qEddKD1d0hDGg7m5mddNA/rE9Y+mvOMTpsaTFlMTptbGR1MTM6ZGVjaW1hbFBsYWNlczE6EnU3Om1pbnRlcnNudTY6dGlja2VydTQ6TWVhZGVpMTAwMDAwMDAwMDAwMDAwMDAwMGVlMTpuaTE2M2UxOnA2NToEU/MbuCWFARsi1/TWHi1mmXKhjO7X1C0T7Iy81RiItB3qBfawFHS3Tn0asS1hW8XHstN1mLKixzKRIutHO9vbCDE6czIwOttjcXDqIhLYPQyav09/1q7lFQgAMTp0dTI3OjIwMjQtMDctMDVUMDk6MjM6MDcuNzkzODE2WjE6dWxlZQ==");
        (bool ok, bytes memory out) = actionDeserializer(serializedPayload);
        require(ok);
        RapidCombination memory _struct = abi.decode(out, (RapidCombination));
        return _struct;
    }

    function readHackAndSlashSweep() public view returns (HackAndSlashSweep memory) {
        bytes memory serializedPayload = bytes("ZDE6UzcxOjBFAiEA3pSeUIw3Q7ZzkkeB4Iqa1d/W8OVdS55nCqJksCw40DYCIDCByMHbJqzes+gCsQiH0JzZ5zl3FN1bjOnwwYoT4G39MTphbGR1Nzp0eXBlX2lkdTIyOmhhY2tfYW5kX3NsYXNoX3N3ZWVwMTB1Njp2YWx1ZXNkdTExOmFjdGlvblBvaW50dTM6MTE1dTEyOmFwU3RvbmVDb3VudHUxOjB1MTM6YXZhdGFyQWRkcmVzczIwOgpwc9j+o4OCu1j37+QK3DU8CMMsdTg6Y29zdHVtZXNsZXUxMDplcXVpcG1lbnRzbDE2OvFS0g6N6xZNq1uSRRFzhfoxNjrPDwwqGNsyTqDLCCpn6R0xMTY6d3MmZy76p065VNQ9D8I2yTE2OvPoHX2fFWRIuV85tK9wzPsxNjpxKy6HMuBATo/kcggaW2NbMTY6UGCdqF7Fe0OlZEm2wm7rUzE2OuugcKljm7ZJrtOd8J5oqzVldTI6aWQxNjqS2IHQ4BQaTKKONtIVVwQgdTk6cnVuZUluZm9zbGx1MTowdTU6MzAwMDFlZXU3OnN0YWdlSWR1MzoxMzl1Nzp3b3JsZElkdTE6M2VlZTE6ZzMyOkWCJQ0NozsGd5qEddKD1d0hDGg7m5mddNA/rE9Y+mvOMTpsaTFlMTptbGR1MTM6ZGVjaW1hbFBsYWNlczE6EnU3Om1pbnRlcnNudTY6dGlja2VydTQ6TWVhZGVpMTAwMDAwMDAwMDAwMDAwMDAwMGVlMTpuaTI1N2UxOnA2NToEFNrx5bPvcPh05jtabwKOrsbvGhukSlWNA2ydhLJ6/Kvb07VgrHTQJ3CuX9KjKBkGrW/E3EMnpe3QkSVO8RSNxjE6czIwOveKSbie1JodVw+wZeAskPe1SH5bMTp0dTI3OjIwMjQtMDctMDVUMDk6MjM6MTIuNTg3MDAyWjE6dWxlZQ==");
        (bool ok, bytes memory out) = actionDeserializer(serializedPayload);
        require(ok);
        HackAndSlashSweep memory _struct = abi.decode(out, (HackAndSlashSweep));
        return _struct;
    }

    function readTransferAsset() public view returns (TransferAsset memory){
        bytes memory serializedPayload = bytes("ZDE6UzcwOjBEAiBSOidioUVetuLwDfe/GPEoIK57gJ9eCjClsrzgwJOvmgIgHvRYjATEzc3qL9f/a4bo1i/2iHwcyAiB3w9EnbkKvvQxOmFsZHU3OnR5cGVfaWR1MTU6dHJhbnNmZXJfYXNzZXQ1dTY6dmFsdWVzZHU2OmFtb3VudGxkdTEzOmRlY2ltYWxQbGFjZXMxOgJ1NzptaW50ZXJzbDIwOkfQgqEVxj57WLFTLSDmMVOOr63eZXU2OnRpY2tlcnUzOk5DR2VpMTEwNGVldTk6cmVjaXBpZW50MjA6gjF6uyNzFLab6VM+b/TVpIsdG5J1NjpzZW5kZXIyMDo8gmHRKY1szqMo5jG2hFJCtgBxb2VlZTE6ZzMyOkWCJQ0NozsGd5qEddKD1d0hDGg7m5mddNA/rE9Y+mvOMTpsaTRlMTptbGR1MTM6ZGVjaW1hbFBsYWNlczE6EnU3Om1pbnRlcnNudTY6dGlja2VydTQ6TWVhZGVpMTAwMDAwMDAwMDAwMDAwMDAwMGVlMTpuaTQ4MWUxOnA2NToEJz5TlBFQ9EUwolEUJxDrQg9N55WqoP/N3yC85UouHhFChRgZ0v60DJxw84lyvsXntIcSLQq6iNzwWcO5bHDLczE6czIwOjyCYdEpjWzOoyjmMbaEUkK2AHFvMTp0dTI3OjIwMjQtMDctMDVUMDk6MjM6MjEuMTUwMzY1WjE6dWxlZQ==");
        (bool ok, bytes memory out) = actionDeserializer(serializedPayload);
        require(ok);
        TransferAsset memory _struct = abi.decode(out, (TransferAsset));
        return _struct;
    }

    function readClaimItems() public view returns (ClaimItems memory){
        bytes memory serializedPayload = bytes("ZDE6UzcxOjBFAiEAs6Dh4AKfGoj/JXt3105Q1AOLaE7BLTb5jAWhYc8DEyQCIAFualk5WtoTWT2mweMLgZRDbvkAG6KWdb3kt+UZRnunMTphbGR1Nzp0eXBlX2lkdTExOmNsYWltX2l0ZW1zdTY6dmFsdWVzZHUyOmNkbGwyMDprqXvayCAEA/BBF/4us4k6Z2/RomxsZHUxMzpkZWNpbWFsUGxhY2VzMToSdTc6bWludGVyc251Njp0aWNrZXJ1MTI6RkFWX19DUllTVEFMZWkyNDAwMDAwMDAwMDAwMDAwMDAwMDAwZWVsZHUxMzpkZWNpbWFsUGxhY2VzMToAdTc6bWludGVyc251Njp0aWNrZXJ1MTQ6SXRlbV9OVF84MDAyMDFlaTEyZWVlZWV1MjppZDE2Oh380p2eg9BFhvxr+YVClCl1MTptdTYwOnBhdHJvbCByZXdhcmQgNmJhOTdCREFjODIwMDQwM2YwNDExN0ZFMmVCMzg5M2E2NzZmRDFBMiAvIDEwN2VlZTE6ZzMyOkWCJQ0NozsGd5qEddKD1d0hDGg7m5mddNA/rE9Y+mvOMTpsaTRlMTptbGR1MTM6ZGVjaW1hbFBsYWNlczE6EnU3Om1pbnRlcnNudTY6dGlja2VydTQ6TWVhZGVpMTAwMDAwMDAwMDAwMDAwMDAwMGVlMTpuaTIzODYwNDhlMTpwNjU6BI+GguV92N77nV3VKLxTstLYZ6TAt7bz+YtvRKFnhSUmzMZqbTUSvEKcIOICgBUry/7opQPAKMVtXzSLYkidLnwxOnMyMDrK1g8YtLoYn38cFOImfZsg9bFv9TE6dHUyNzoyMDI0LTA3LTA2VDA5OjIzOjI0LjAwMjAxNloxOnVsZWU=");
        (bool ok, bytes memory out) = actionDeserializer(serializedPayload);
        require(ok);
        ClaimItems memory _struct = abi.decode(out, (ClaimItems));
        return _struct;
    }
}