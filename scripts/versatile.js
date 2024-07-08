const hre = require("hardhat");
const transactions = require("./json/transactions.json");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0x1B7D8073538dF795CbeF40643A8b815544816873";

    const Versatile = await hre.ethers.getContractFactory("Versatile");
    const versatile = await Versatile.attach(contractAddress);
    const versatileWithSigner = versatile.connect(accounts[0]);

    // let hash = await versatileWithSigner.hashSha256(10909);
    // console.log("Hash is", hash);

    let utf8Encode = new TextEncoder();
    let data = utf8Encode.encode(transactions.serializedPayload);
    let result1 = await versatileWithSigner.ret(data);
    console.log("Result is", result1);

    // let transactionResult2 = await versatileWithSigner.serialize();
    // await transactionResult2.wait();
    // let result2 = await versatileWithSigner.value();
    // console.log("Result is", result2);
    // let result3 = await versatileWithSigner.deserialize();
    // console.log("Result is", result3);

    // let transactionResult4 = await versatileWithSigner.serializeParams();
    // await transactionResult4.wait();
    // let result4 = await versatileWithSigner.value();
    // console.log("Result is", result4);
    // let transactionResult5 = await versatileWithSigner.deserializeParams();
    // await transactionResult5.wait();
    // let result5 = await versatileWithSigner.modelResult();
    // console.log("Result is", result5);

    let result6 = await versatileWithSigner.check();
    console.log("Result is", result6);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});