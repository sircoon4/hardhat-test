const hre = require("hardhat");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0x9b3B97F1c9803F5160C8BEB9d0B3b61281E7041D";

    const ActionParser = await hre.ethers.getContractFactory("ActionParser");
    const actionParser = await ActionParser.attach(contractAddress);
    const actionParserWithSigner = actionParser.connect(accounts[0]);

    let result = await actionParserWithSigner.readHackAndSlash();
    console.log("HackAndSlash result:")
    console.log(result);

    result = await actionParserWithSigner.readGrinding();
    console.log("Grinding result:")
    console.log(result);

    result = await actionParserWithSigner.readCombinationEquipment();
    console.log("CombinationEquipment result:")
    console.log(result);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});