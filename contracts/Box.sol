// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Import Auth from the access-control subdirectory
import "./access-control/Auth.sol";
import "hardhat/console.sol";

contract Box {
    uint256 private _value;
    Auth private _auth;

    event ValueChanged(uint256 value);
    
    enum Status {
        Processing,
        Processed,
        Failed
    }

    event TransactionProcessed(uint256 indexed blockIndex, Status status);
    event TransactionData(bytes data);

    constructor() {
        _auth = new Auth(msg.sender);
    }

    function versatile() public {
        bytes memory sample = abi.encodePacked(hex"0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000029c5a444536557a63784f6a4246416945416c49574a484d376d73793142736c455034417153662b5431664d716e676c36445048514a5978354a65656f4349454e6a414344614153395352676a72686d71434349714e54376554464b69676534476236307a4171727a4f4d547068624752314e7a70306558426c58326c6b6454497a4f6d4e7662574a70626d4630615739755832567864576c77625756756444453364545936646d46736457567a5a4855784f6d45794d44704b7a5441364d742b796343634f34716564512f2b65542b6336596e55784f6d686d64544536615855354f6a45774e44557a4d4441774d5855794f6d6c6b4d5459364c784b78304b2f58575536496c51484c64516e64385855784f6e423064544d3663476c6b626e55784f6e4a314d7a6f784d7a46314d54707a645445364d57566c5a5445365a7a4d794f6b57434a51304e6f7a73476435714564644b4431643068444767376d356d64644e412f724539592b6d764f4d5470736154466c4d547074624752314d544d365a47566a615731686246427359574e6c637a4536456e55334f6d3170626e526c636e4e756454593664476c6a6132567964545136545756685a4756704d5441774d4441774d4441774d4441774d4441774d4441774d47566c4d547075615455344d544a6c4d5470774e6a5536424948754b6265732f2b5770656762577148556f41614d6778587658476c6551464d75634f6a38343841715674723150666a58626962336b6158564a65363747457a435472556e6a6d6c7569614c6c6249625444776838784f6e4d794d4470574a76722b314a6951454a466f424e45707830507170514a524d444536644855794e7a6f794d4449304c5441334c544532564441304f6a41794f6a55334c6a67334d4463324d6c6f784f6e56735a57553d00000000");
        //bytes memory encoded = abi.encode(sample);
        console.logBytes(sample);
        bytes memory decoded = abi.decode(sample, (bytes));
        console.logBytes(decoded);
        emit TransactionData(decoded);
    }

    function store(uint256 value) public {
        // Require that the caller is registered as an administrator in Auth
        require(_auth.isAdministrator(msg.sender), "Unauthorized");

        _value = value;
        emit ValueChanged(value);
    }

    function retrieve() public view returns (uint256) {
        return _value;
    }

    function processTransaction(uint256 blockIndex, bytes[] memory input) public {
        emit TransactionProcessed(blockIndex, Status.Processing);
        console.logBytes(input[0]);
        (bytes memory data) = abi.decode(input[0], (bytes));
        emit TransactionData(data);
        emit TransactionProcessed(blockIndex, Status.Processed);
    }
}