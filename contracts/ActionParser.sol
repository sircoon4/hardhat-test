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
        int64 stageBuffId;
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
        int64 i;
        bool p;
        bool h;
        int64 pid;
    }

    function actionDeserializer(bytes memory input) public view returns (bool ok, bytes memory out) {
        address _addr = 0x0000000000000000000000000000000000000100;
        return _addr.staticcall(input);
    }

    function readHackAndSlash() public view returns (HackAndSlash memory) {
        bytes memory serialiezedPayload = bytes("ZDE6UzcwOjBEAiBREB4k6V+8VAXxIe9I1s565xeRyEhTcvft0QtkQavdRAIgF/7gAwEK1hCXBI3vStWHsInR56Pjbpgr77ZGNfYJWJ8xOmFsZHU3OnR5cGVfaWR1MTY6aGFja19hbmRfc2xhc2gyMnU2OnZhbHVlc2R1MTI6YXBTdG9uZUNvdW50dTE6MHUxMzphdmF0YXJBZGRyZXNzMjA63+Olmd3JqvwM5CMsow1BKkN5eE91ODpjb3N0dW1lc2xldTEwOmVxdWlwbWVudHNsMTY6k0hvMSQP3ESqxHe5FvP/ZDE2OnESdTcOEDhHjXX+a8k/kgMxNjputrpDman3Q5V424Y2EJutMTY6vGXnkjiTjk6uEDh/1UnKlTE2OoCmFqSy2FdGlMeyRVDTd0sxNjqAhR6pZsrMRoS+9euOX7TnMTY6yetsy/AeaEm0XJX2GX1KBWV1NTpmb29kc2xldTI6aWQxNjpVMrOqojpcTo+szFsaRu5tdTE6cmxsdTE6MHU1OjMwMDAxZWV1NzpzdGFnZUlkdTM6MjEwdTE0OnRvdGFsUGxheUNvdW50dTE6MXU3OndvcmxkSWR1MTo1ZWVlMTpnMzI6RYIlDQ2jOwZ3moR10oPV3SEMaDubmZ100D+sT1j6a84xOmxpNGUxOm1sZHUxMzpkZWNpbWFsUGxhY2VzMToSdTc6bWludGVyc251Njp0aWNrZXJ1NDpNZWFkZWkxMDAwMDAwMDAwMDAwMDAwMDAwZWUxOm5pMzExNmUxOnA2NToE3wbqFQmA1Y+s/9KKFfFC0scchb6fM0FbN2zIUcbvextqIZ+RGm9zXti+cBRBMhv+/ghXR6k08lAxOUH2iJvMYzE6czIwOmtPF4trn3OiAUK7/onUOjgBB4aDMTp0dTI3OjIwMjQtMDctMDVUMDk6MjM6MjAuNTE3Njc2WjE6dWxlZQ==");
        (bool ok, bytes memory out) = actionDeserializer(serialiezedPayload);
        require(ok);
        HackAndSlash memory _struct = abi.decode(out, (HackAndSlash));
        return _struct;
    }

    function readGrinding() public view returns (Grinding memory) {
        bytes memory serialiezedPayload = bytes("ZDE6UzcwOjBEAiBNIJpUkfHyhnA3wCHRFt9iuyHqPbKPbEys9MF/RsG1OQIgTB1dU35a5Cr2odqIkNUE6hEZ/PIdrLt5fiidK3YrQsoxOmFsZHU3OnR5cGVfaWR1OTpncmluZGluZzJ1Njp2YWx1ZXNkdTE6YTIwOlE4aopjoX/XOXBM3WCk5oN/7lWIdTE6Y3R1MTplbDE2OutbnGA0koFAu+zs6J5VuAVldTI6aWQxNjpJtSFKgJLXQpKj9T0cXokPZWVlMTpnMzI6RYIlDQ2jOwZ3moR10oPV3SEMaDubmZ100D+sT1j6a84xOmxpMWUxOm1sZHUxMzpkZWNpbWFsUGxhY2VzMToSdTc6bWludGVyc251Njp0aWNrZXJ1NDpNZWFkZWkxMDAwMDAwMDAwMDAwMDAwMDAwZWUxOm5pMjc1ZTE6cDY1OgTcDJ8HG/Fe9jSl94B4LbBfLyUe2gJZmIVaLbjVMXNKh14btogWXuVmcKGhwxuQeDQHjkVD1NXeLyA+X4Jj5Y0vMTpzMjA6ga9iZHvpgtBiwvnBCbOlOdjJy8ExOnR1Mjc6MjAyNC0wNy0wNVQwOToyMzowNi4xNzYyODhaMTp1bGVl");
        (bool ok, bytes memory out) = actionDeserializer(serialiezedPayload);
        require(ok);
        Grinding memory _struct = abi.decode(out, (Grinding));
        return _struct;
    }

    function readCombinationEquipment() public view returns (CombinationEquipment memory) {
        bytes memory serialiezedPayload = bytes("ZDE6UzcwOjBEAiAAqENcATSUfl/izYJWShs0nTLf5XDqg+n11hTIlSZ7kAIgWzmye7xj2lTPL1bdO+FztKTgSPHYRXBHTFni5OGjDSMxOmFsZHU3OnR5cGVfaWR1MjM6Y29tYmluYXRpb25fZXF1aXBtZW50MTd1Njp2YWx1ZXNkdTE6YTIwOvsmvr466BLcc1rbsNdF7jN1jxN2dTE6aGZ1MTppdTM6MzczdTI6aWQxNjqwfyDSYCl6QqXK30uDXCoBdTE6cHR1MzpwaWRudTE6cnUxOjF1MTpzdTE6MWVlZTE6ZzMyOkWCJQ0NozsGd5qEddKD1d0hDGg7m5mddNA/rE9Y+mvOMTpsaTFlMTptbGR1MTM6ZGVjaW1hbFBsYWNlczE6EnU3Om1pbnRlcnNudTY6dGlja2VydTQ6TWVhZGVpMTAwMDAwMDAwMDAwMDAwMDAwMGVlMTpuaTQ0ZTE6cDY1OgTtl6zT5sIF42uyL9icLWTkFBfLykCjUDRNSPgVzoJ3P0UPXpBZci4nWTcs/pSwsxcfhgUULLgxb5jhWzvRNMUGMTpzMjA695+PB+EmhdKUge+5CMjRa/kIWmIxOnR1Mjc6MjAyNC0wNy0wNVQwOToyMzoxMy41ODcyMTVaMTp1bGVl");
        (bool ok, bytes memory out) = actionDeserializer(serialiezedPayload);
        require(ok);
        CombinationEquipment memory _struct = abi.decode(out, (CombinationEquipment));
        return _struct;
    }
}