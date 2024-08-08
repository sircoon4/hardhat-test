const hre = require("hardhat");
const transactions = require("./json/transactions.json");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0x4f28a296a79f2Cc2800B47c7e7307C25f7F5DE71";

    const Versatile = await hre.ethers.getContractFactory("Versatile");
    const versatile = await Versatile.attach(contractAddress);
    const versatileWithSigner = versatile.connect(accounts[0]);

    // let hash = await versatileWithSigner.hashSha256(10909);
    // console.log("Hash is", hash);

    let utf8Encode = new TextEncoder();

    let hexString1 = "1bb0734cffb2226288fbb5124e560deb3322a0957a710829082d25e51872c84d"
    let input1 = Uint8Array.from(Buffer.from(hexString1, 'hex'));
    let hexString2 = "6c6c6e6e6e33323aa05901b256bc5c70e94b294c6d8bd9446d2d7f9cb47645a5869afb779f1054176e6e6e6e6e6e6e6e6e6e6e6e6c6e6c6939656565656c323a010333323acd7c05916ad1c68c19fa275a7409ec15a2af3dcf13ffe1b4b3fa03a5e4885c99656c33323a730d10e492580dc2b071e0a2462f9a28b90be9d275e0a44711965afee77d5e316e33323a3322fd72c0ad2c681e715b82b5ac5395710510e24a70baa2fb4fb037cf6227186e6e6e6e6e6e6e6e6e6e6e6e6e6e656c37363a0307060206030306030103090603030106030309030703080605060506050306030303090303060303070308030406060605060203010605060403030306030606050604030003090306060633323ab592c07326758348b4cbf4be9be98d028381d4251308785859f7148ba333aedb656c6e33323ac606a553d2e65a72cbb8ea34dcadf14d65a3c4d8cda8ff7368cd6c35a12e7fe06565"
    let input2 = Uint8Array.from(Buffer.from(hexString2, 'hex'));
    let hexString3 = "31323762633631396331633937386565653633393363373834666562316564333636656430393666"
    let input3 = Uint8Array.from(Buffer.from(hexString3, 'hex'));
    let hexString4 = "33323ac606a553d2e65a72cbb8ea34dcadf14d65a3c4d8cda8ff7368cd6c35a12e7fe0"
    let input4 = Uint8Array.from(Buffer.from(hexString4, 'hex'));

    let result = await versatileWithSigner.simple(input1, input2, input3, input4);
    console.log("--result--")
    console.log(result);



    // let data = utf8Encode.encode(transactions.serializedPayload);
    // let result1 = await versatileWithSigner.ret(data);
    // console.log("Result is", result1);

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

    // let result6 = await versatileWithSigner.check();
    // console.log("Result is", result6);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});