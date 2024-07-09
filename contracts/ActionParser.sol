// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract ActionParser {
    struct HackAndSlash {
        bytes16 id;
        bytes16[] costumes;
        bytes16[] equipments;
        bytes16[] foods;
        RuneSlotInfo[] r;
        int64 worldId;
        int64 stageId;
        int64 stageBuffId; // -1 if null
        address avatarAddress;
        int64 totalPlayCount;
        int64 apStoneCount;
    }

    struct Grinding {
        bytes16 id;
        address a;
        bytes16[] e;
        bool c;
    }

    struct CombinationEquipment {
        bytes16 id;
        address a;
        int64 s;
        int64 r;
        int64 i; // -1 if null
        bool p;
        bool h;
        int64 pid; // -1 if null
    }

    struct RapidCombination {
        bytes16 id;
        address avatarAddress;
        int64 slotIndex;
    }

    struct HackAndSlashSweep {
        bytes16 id;
        bytes16[] costumes;
        bytes16[] equipments;
        RuneSlotInfo[] runeInfos;
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
        bytes16 id;
        ClaimData[] cd;
        string m; // "" if null
    }

    struct ClaimData {
        address avatarAddress;
        FungibleAssetValue[] fungibleAssetValues;
    }

    struct DailyReward {
        bytes16 id;
        address a;
    }

    struct AuraSummon {
        bytes16 id;
        address aa;
        int64 gid;
        int64 sc;
    }

    struct ExploreAdventureBoss {
        bytes16 id;
        int64 season;
        address avatarAddress;
        bytes16[] costumes;
        bytes16[] equipments;
        bytes16[] foods;
        RuneSlotInfo[] r;
        int64 stageBuffId; // -1 if null
    }

    struct RuneSlotInfo {
        int64 slotIndex;
        int64 runeId;
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

    function actionDeserializer(bytes memory input) public view returns (bool ok, bytes memory out) {
        address _addr = 0x0000000000000000000000000000000000000100;
        return _addr.staticcall(input);
    }

    function parseHackAndSlash(bytes memory input) public view returns (HackAndSlash memory) {
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        HackAndSlash memory _struct = abi.decode(out, (HackAndSlash));
        return _struct;
    }

    function parseGrinding(bytes memory input) public view returns (Grinding memory) {
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        Grinding memory _struct = abi.decode(out, (Grinding));
        return _struct;
    }

    function parseCombinationEquipment(bytes memory input) public view returns (CombinationEquipment memory) {
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        CombinationEquipment memory _struct = abi.decode(out, (CombinationEquipment));
        return _struct;
    }

    function parseRapidCombination(bytes memory input) public view returns (RapidCombination memory) {
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        RapidCombination memory _struct = abi.decode(out, (RapidCombination));
        return _struct;
    }

    function parseHackAndSlashSweep(bytes memory input) public view returns (HackAndSlashSweep memory) {
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        HackAndSlashSweep memory _struct = abi.decode(out, (HackAndSlashSweep));
        return _struct;
    }

    function parseTransferAsset(bytes memory input) public view returns (TransferAsset memory){
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        TransferAsset memory _struct = abi.decode(out, (TransferAsset));
        return _struct;
    }

    function parseClaimItems(bytes memory input) public view returns (ClaimItems memory){
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        ClaimItems memory _struct = abi.decode(out, (ClaimItems));
        return _struct;
    }

    function parseDailyReward(bytes memory input) public view returns (DailyReward memory){
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        DailyReward memory _struct = abi.decode(out, (DailyReward));
        return _struct;
    }

    function parseAuraSummon(bytes memory input) public view returns (AuraSummon memory){
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        AuraSummon memory _struct = abi.decode(out, (AuraSummon));
        return _struct;
    }

    function parseExploreAdventureBoss(bytes memory input) public view returns (ExploreAdventureBoss memory){
        (bool ok, bytes memory out) = actionDeserializer(input);
        require(ok);
        ExploreAdventureBoss memory _struct = abi.decode(out, (ExploreAdventureBoss));
        return _struct;
    }
}