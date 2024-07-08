const hre = require("hardhat");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0x9460C445B1c5F26751aD3b577bBf0591061759c2";

    const HackAndSlashParser = await hre.ethers.getContractFactory("HackAndSlashParser");
    const hackAndSlashParser = await HackAndSlashParser.attach(contractAddress);
    const hackAndSlashParserWithSigner = hackAndSlashParser.connect(accounts[0]);

    let result = await hackAndSlashParserWithSigner.readHackAndSlash();
    console.log("Result is", result);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});