const hre = require("hardhat");
const transactions = require("./json/transactions.json");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0x2ce3a29BfcFE1FCA522e9f0b7d1699a0f7D0a713";

    const LibplanetPortal = await hre.ethers.getContractFactory("LibplanetPortal");
    const libplanetPortal = await LibplanetPortal.attach(contractAddress);
    const libplanetPortalWithSigner = libplanetPortal.connect(accounts[0]);

    let result = await libplanetPortalWithSigner.proveWithdrawalTransaction({
      nonce: 17n,
      from: "0xCE70F2e49927D431234BFc8D439412eef3a6276b",
      to: "0x47E0Dd0B503C153D7FB78c43cc9aC135C60Dfd94",
      amount: 10000n,
    });

    console.log("--result--")
    console.log(result);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});