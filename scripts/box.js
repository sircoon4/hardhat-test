const hre = require("hardhat");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0x2b09ba378C9CB2E8B88d65078F029b2dd851c981";

    const Box = await hre.ethers.getContractFactory("Box");
    const box = await Box.attach(contractAddress);
    const boxWithSigner = box.connect(accounts[0]);

    let value = await boxWithSigner.retrieve();
    console.log("Box value is", value);

    let result = await boxWithSigner.store(20);
    await result.wait();
  
    let mValue = await boxWithSigner.retrieve();
    console.log("Box value is", mValue);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});