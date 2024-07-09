const hre = require("hardhat");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0x8475Bb2D06FC39d707f60b86BFBB924d5976288f";

    const ActionParser = await hre.ethers.getContractFactory("ActionParser");
    const actionParser = await ActionParser.attach(contractAddress);
    const actionParserWithSigner = actionParser.connect(accounts[0]);

    var result;

    // result = await actionParserWithSigner.readHackAndSlash();
    // console.log("HackAndSlash result:");
    // console.log(result);

    // result = await actionParserWithSigner.readGrinding();
    // console.log("Grinding result:");
    // console.log(result);

    // result = await actionParserWithSigner.readCombinationEquipment();
    // console.log("CombinationEquipment result:");
    // console.log(result);

    // result = await actionParserWithSigner.readRapidCombination();
    // console.log("RapidCombination result:");
    // console.log(result);

    // result = await actionParserWithSigner.readHackAndSlashSweep();
    // console.log("HackAndSlashSweep result:");
    // console.log(result);

    // result = await actionParserWithSigner.readTransferAsset();
    // console.log("TransferAsset result:");
    // console.log(result);
    // console.log(result[2][0]);

    result = await actionParserWithSigner.readClaimItems();
    console.log("ClaimItems result:");
    console.log(result);
    console.log(result[1][0][1]);

    // result = await actionParserWithSigner.readSimple();
    // console.log("Simple result:");
    // console.log(result);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});