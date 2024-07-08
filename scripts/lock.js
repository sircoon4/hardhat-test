const hre = require("hardhat");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0x4f28a296a79f2Cc2800B47c7e7307C25f7F5DE71";

    const Lock = await hre.ethers.getContractFactory("Lock");
    const lock = await Lock.attach(contractAddress);
    const lockWithSigner = lock.connect(accounts[0]);

    await lockWithSigner.withdraw();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});